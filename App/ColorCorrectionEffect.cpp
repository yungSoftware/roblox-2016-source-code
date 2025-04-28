#include "stdafx.h"
#include "./ColorCorrectionEffect.h"

namespace RBX {
	const char* const sColorCorrectionEffect = "ColorCorrectionEffect";

	REFLECTION_BEGIN();
	static const Reflection::PropDescriptor<ColorCorrectionEffect, int>	prop_brightness("Brightness", category_Data, &ColorCorrectionEffect::getBrightness, &ColorCorrectionEffect::setBrightness);
	static const Reflection::PropDescriptor<ColorCorrectionEffect, int>	prop_contrast("Contrast", category_Data, &ColorCorrectionEffect::getContrast, &ColorCorrectionEffect::setContrast);
	static const Reflection::PropDescriptor<ColorCorrectionEffect, int>	prop_saturation("Saturation", category_Data, &ColorCorrectionEffect::getSaturation, &ColorCorrectionEffect::setSaturation);
	static const Reflection::PropDescriptor<ColorCorrectionEffect, Color3>	prop_tintcolor("TintColor", category_Data, &ColorCorrectionEffect::getTintColor, &ColorCorrectionEffect::setTintColor);
	REFLECTION_END();

	int Brightness = 0;
	int Contrast = 0;
	int Saturation = 0;
	Color3 TintColor = Color3(1, 1, 1);

	ColorCorrectionEffect::ColorCorrectionEffect()
		:DescribedCreatable<ColorCorrectionEffect, PostEffect, sColorCorrectionEffect, Reflection::ClassDescriptor::PERSISTENT>("ColorCorrectionEffect")
	{
	}

	void ColorCorrectionEffect::setBrightness(int value)
	{
		RBXASSERT(isFinite(value));
		Brightness = value;
		raisePropertyChanged(prop_brightness);
	}

	void ColorCorrectionEffect::setContrast(int value)
	{
		RBXASSERT(isFinite(value));
		Contrast = value;
		raisePropertyChanged(prop_contrast);
	}

	void ColorCorrectionEffect::setSaturation(int value)
	{
		RBXASSERT(isFinite(value));
		Saturation = value;
		raisePropertyChanged(prop_saturation);
	}

	void ColorCorrectionEffect::setTintColor(Color3 value)
	{
		TintColor = value;
		raisePropertyChanged(prop_tintcolor);
	}
}
