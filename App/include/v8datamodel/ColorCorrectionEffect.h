#pragma once

#include "v8datamodel/InputObject.h"
#include "v8datamodel/Lighting.h"
#include "V8Tree/instance.h"
#include "PostEffect.h"

namespace RBX {
	extern const char* const sColorCorrectionEffect;
	class ColorCorrectionEffect : public DescribedCreatable<ColorCorrectionEffect, PostEffect, sColorCorrectionEffect, Reflection::ClassDescriptor::PERSISTENT>
	{
	private:
		typedef DescribedCreatable<ColorCorrectionEffect, PostEffect, sColorCorrectionEffect, Reflection::ClassDescriptor::PERSISTENT> Super;
	public:
		ColorCorrectionEffect();

		void setBrightness(int value);
		int getBrightness() const { return Brightness; }

		void setContrast(int value);
		int getContrast() const { return Contrast; }

		void setSaturation(int value);
		int getSaturation() const { return Saturation; }

		void setTintColor(Color3 value);
		Color3 getTintColor() const { return TintColor; }

		bool isActive;
	protected:
		int Brightness;
		int Contrast;
		int Saturation;
		Color3 TintColor;
	};
}
