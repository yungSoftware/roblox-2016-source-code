#include "common.h"

struct Appdata
{
    float4 Position	    : POSITION;
    float2 Uv	        : TEXCOORD0;
    float3 Normal       : NORMAL0;
};

struct VertexOutput
{
    float4 HPosition    : POSITION;

    float2 Uv           : TEXCOORD0;
    float4 Color        : COLOR0;

    float FogFactor     : TEXCOORD1;
};

struct AALineVertexOutput
{
    float4 HPosition    : POSITION;

    float4 Position     : TEXCOORD1;
    float4 Color        : COLOR0;

    float FogFactor     : COLOR1;
    float4 Start        : TEXCOORD2;
    float4 End          : TEXCOORD3;
};

struct OutlineVertexOutput
{
    float4 HPosition    : POSITION;

    float4 Color        : COLOR0;
    float4 Position     : TEXCOORD0;

	float4 CenterRadius : TEXCOORD1;
};

struct ObjectVertexOutput
{
    float4 HPosition    : POSITION;

    float2 Uv           : TEXCOORD0;
    float4 Color        : COLOR0;
    float3 Diffuse      : COLOR1;

    float4 LightPosition_Fog : TEXCOORD1;
};

WORLD_MATRIX(WorldMatrix);

uniform float4 Color;
uniform float4 Params;

VertexOutput AdornSelfLitVSGeneric(Appdata IN, float ambient)
{
    VertexOutput OUT = (VertexOutput)0;

    float4 position = mul(WorldMatrix, IN.Position);
    float3 normal = normalize(mul((float3x3)WorldMatrix, IN.Normal));

    float3 light = normalize(G(CameraPosition).xyz - position.xyz);
    float ndotl = saturate(dot(normal, light));

    float lighting = ambient + (1 - ambient) * ndotl;
    float specular = pow(ndotl, 64.0);

    OUT.HPosition = mul(G(ViewProjection), mul(WorldMatrix, IN.Position));
    OUT.Uv = IN.Uv;
    OUT.Color = float4(Color.rgb * lighting + specular, Color.a);

    OUT.FogFactor = (G(FogParams).z - OUT.HPosition.w) * G(FogParams).w;

    return OUT;
}

VertexOutput AdornSelfLitVS(Appdata IN)
{
    return AdornSelfLitVSGeneric(IN, 0.5f);
}

VertexOutput AdornSelfLitHighlightVS(Appdata IN)
{
    return AdornSelfLitVSGeneric(IN, 0.75f);
}

VertexOutput AdornVS(Appdata IN)
{
    VertexOutput OUT = (VertexOutput)0;

    float4 position = mul(WorldMatrix, IN.Position);

#ifdef PIN_LIGHTING
    float3 normal = normalize(mul((float3x3)WorldMatrix, IN.Normal));
    float ndotl = dot(normal, -G(Lamp0Dir));
    float3 lighting = G(AmbientColor) + saturate(ndotl) * G(Lamp0Color) + saturate(-ndotl) * G(Lamp1Color);
#else
    float3 lighting = 1;
#endif

    OUT.HPosition = mul(G(ViewProjection), position);
    OUT.Uv = IN.Uv;
    OUT.Color = float4(Color.rgb * lighting, Color.a);

    OUT.FogFactor = (G(FogParams).z - OUT.HPosition.w) * G(FogParams).w;

    return OUT;
}

TEX_DECLARE2D(DiffuseMap, 0);

float4 AdornPS(VertexOutput IN): COLOR0
{
    float4 result = tex2D(DiffuseMap, IN.Uv) * IN.Color;

    result.rgb = lerp(G(FogColor), result.rgb, saturate(IN.FogFactor));

    return result;
}

AALineVertexOutput AdornAALineVS(Appdata IN)
{
	// Params:
	// x -> Fov * 0.5f / screenSize.y;
	// y -> ScreenWidth
	// z -> ScreenWidth / ScreenHeight
	// w -> Line thickness 

    AALineVertexOutput OUT = (AALineVertexOutput)0;

    float4 position = mul(WorldMatrix, IN.Position);
    float3 normal = normalize(mul((float3x3)WorldMatrix, IN.Normal));

    // line start and end position in world space
    float4 startPosW = mul(WorldMatrix, float4(1, 0, 0, 1));
    float4 endPosW = mul(WorldMatrix, float4(-1, 0, 0, 1));

    // Compute view-space w
    float w = dot(G(ViewProjection)[3], float4(position.xyz, 1.0f));

    // radius in pixels + constant because line has to be little bit bigget to perform anti aliasing
    float radius = Params.w + 2;

    // scale the way that line has same size on screen
    if (length(position - startPosW) < length(position - endPosW))
    {
        float w = dot(G(ViewProjection)[3], float4(startPosW.xyz, 1.0f));
        float pixel_radius =  radius * w * Params.x;
        position.xyz = startPosW.xyz + normal * pixel_radius;
    }
    else
    {
        float w = dot(G(ViewProjection)[3], float4(endPosW.xyz, 1.0f));
        float pixel_radius = radius * w * Params.x;
        position.xyz = endPosW.xyz + normal * pixel_radius;
    }

    // output for PS
    OUT.HPosition = mul(G(ViewProjection), position);
    OUT.Position = OUT.HPosition; 
    OUT.Start = mul(G(ViewProjection), startPosW);
    OUT.End = mul(G(ViewProjection), endPosW);
    OUT.FogFactor = (G(FogParams).z - OUT.HPosition.w) * G(FogParams).w;

    // screen ratio
    OUT.Position.y *= Params.z;
    OUT.Start.y *= Params.z;
    OUT.End.y *= Params.z;

    return OUT;
}

float4 AdornAALinePS(AALineVertexOutput IN): COLOR0
{
    IN.Position /= IN.Position.w ;
    IN.Start /= IN.Start.w;
    IN.End /= IN.End.w;

    float4 result = 1;

    float2 lineDir = normalize(IN.End.xy - IN.Start.xy);
    float2 fragToPoint = IN.Position.xy - IN.Start.xy;

    // tips of the line are not Anti-Aliesed, they are just cut
    // discard as soon as we can
    float startDist = dot(lineDir, fragToPoint);
    float endDist = dot(lineDir, -IN.Position.xy + IN.End.xy);
    
    if (startDist < 0)
        discard;

    if (endDist < 0)
        discard;

    float2 perpLineDir = float2(lineDir.y, -lineDir.x);

    float dist = abs(dot(perpLineDir, fragToPoint));

    // high point serves to compute the function which is described bellow.
    float highPoint = 1 + (Params.w - 1) * 0.5;
    
    // this is function that has this shape /¯¯¯\, it is symetric, centered around 0 on X axis
    // slope parts are +- 45 degree and are 1px thick. Area of the shape sums to line thickness in pixels
    // funtion for 1px would be /\, func for 2px is /¯\ and so on...
    result.a = saturate(highPoint - (dist * 0.5 * Params.y));

    result *= Color;

    // convert to sRGB, its not perfect for non-black backgrounds, but its the best we can get
    result.a = pow( saturate(1 - result.a), 1/2.2);
    result.a = 1 - result.a;

    result.rgb = lerp(G(FogColor), result.rgb, saturate(IN.FogFactor));
    return result;

}
 
OutlineVertexOutput AdornOutlineVS(Appdata IN)
{
    OutlineVertexOutput OUT = (OutlineVertexOutput)0;

    float4 position = mul(WorldMatrix, IN.Position);

    OUT.HPosition = mul(G(ViewProjection), position);

    OUT.Color = Color;
	OUT.Position = position;

	OUT.CenterRadius = float4(mul(WorldMatrix, float4(0, 0, 0, 1)).xyz, length(mul(WorldMatrix, float4(1, 0, 0, 0))));

    return OUT;
}

float4 AdornOutlinePS(OutlineVertexOutput IN): COLOR0
{
	float3 rayO = IN.Position.xyz - IN.CenterRadius.xyz;
	float3 rayD = normalize(IN.Position.xyz - G(CameraPosition));

	// magnitude(rayO + t * rayD) = radius
	// t^2 + bt + c = radius
	float thickness = 1;

	float r0 = IN.CenterRadius.w;
	float r1 = max(0, IN.CenterRadius.w - thickness);

	float b = 2 * dot(rayO, rayD);
	float c0 = dot(rayO, rayO) - r0 * r0;
	float c1 = dot(rayO, rayO) - r1 * r1;

	if (b * b < 4 * c0)
		discard;

	if (b * b > 4 * c1)
		discard;

    return IN.Color;
}

ObjectVertexOutput AdornObjectGenericVS(Appdata IN, float3 position, float3 normal)
{
    ObjectVertexOutput OUT = (ObjectVertexOutput)0;

    float ndotl = dot(normal, -G(Lamp0Dir));

    OUT.HPosition = mul(G(ViewProjection), float4(position, 1));
    OUT.Uv = IN.Uv;
    OUT.Color = Color;
	OUT.Diffuse = saturate(ndotl) * G(Lamp0Color) + saturate(-ndotl) * G(Lamp1Color);

    OUT.LightPosition_Fog = float4(lgridPrepareSample(lgridOffset(position, normal)), (G(FogParams).z - OUT.HPosition.w) * G(FogParams).w);

    return OUT;
}

ObjectVertexOutput AdornObjectVS(Appdata IN)
{
	float3 posWorld = mul(WorldMatrix, IN.Position).xyz;
	float3 normalWorld = normalize(mul((float3x3)WorldMatrix, IN.Normal));

	return AdornObjectGenericVS(IN, posWorld, normalWorld);
}

ObjectVertexOutput AdornObjectRopeVS(Appdata IN)
{
	float length = Params.x;
	float slop = Params.y - Params.x;
	float thickness = Params.z;

	float3 position = float3(IN.Position.x * length * 0.5, IN.Position.yz * thickness);

	float3 posWorld = mul(WorldMatrix, float4(position, 1)).xyz;
	float3 normalWorld = mul((float3x3)WorldMatrix, IN.Normal);

	posWorld.y -= pow(slop, 0.75) * (1 - IN.Position.x * IN.Position.x);

	return AdornObjectGenericVS(IN, posWorld, normalWorld);
}

ObjectVertexOutput AdornObjectSpringVS(Appdata IN)
{
	float length = Params.x;
	float thickness = 0.05f;
	float coils = 8;

	float radius = 0.4 * saturate((0.9 - abs(IN.Position.x)) * 20);

	float angle = IN.Position.x * (3.1415926 * coils);
	float sina = sin(angle), cosa = cos(angle);

	float3 c = float3(IN.Position.x * length * 0.5, sina * radius, cosa * radius);
	float3 u = float3(0, cosa, -sina);
	float3 w = normalize(cross(u, float3(1, 0, 0)));
	float3 v = normalize(cross(w, u));

	float3 position = c + (IN.Position.y * v + IN.Position.z * w) * thickness;
	float3 normal = IN.Normal.x * u + IN.Normal.y * v + IN.Normal.z * w;

	float3 posWorld = mul(WorldMatrix, float4(position, 1)).xyz;
	float3 normalWorld = mul((float3x3)WorldMatrix, normal);

	return AdornObjectGenericVS(IN, posWorld, normalWorld);
}

LGRID_SAMPLER(LightMap, 1);
TEX_DECLARE2D(LightMapLookup, 2);

float4 AdornObjectPS(ObjectVertexOutput IN): COLOR0
{
    float4 light = lgridSample(TEXTURE(LightMap), TEXTURE(LightMapLookup), IN.LightPosition_Fog.xyz);

    float4 result;
	result.rgb = (G(AmbientColor) + IN.Diffuse + light.rgb) * IN.Color.rgb;
	result.a = IN.Color.a;

    result.rgb = lerp(G(FogColor), result.rgb, saturate(IN.LightPosition_Fog.w));

    return result;
}
