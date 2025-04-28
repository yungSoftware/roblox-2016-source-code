#include "stdafx.h"
#include "./BlurEffect.h"

namespace RBX {
	const char* const  sBlurEffect = "BlurEffect";

	REFLECTION_BEGIN();
	static const Reflection::PropDescriptor<BlurEffect, int>	prop_size("Size", category_Data, &BlurEffect::getSize, &BlurEffect::setSize);
	REFLECTION_END();

	int Size = 8;
	bool isActive = false; // it has to be in lighting for now

	BlurEffect::BlurEffect()
		:DescribedCreatable<BlurEffect, PostEffect, sBlurEffect, Reflection::ClassDescriptor::PERSISTENT>("BlurEffect")
	{
	}

	void BlurEffect::setSize(int value)
	{
		RBXASSERT(isFinite(value));
		Size = value;
		raisePropertyChanged(prop_size);
	}
}