#include "stdafx.h"
#include "V8DataModel/PostEffect.h"

namespace RBX {

	extern const char* const sPostEffect = "PostEffect";

	REFLECTION_BEGIN();
	static const Reflection::PropDescriptor<PostEffect, bool> prop_enabled("Enabled", category_Data, &PostEffect::getEnabled, &PostEffect::setEnabled);
	REFLECTION_END();

	bool enabled = false;

	PostEffect::PostEffect(const char* name)
		: DescribedNonCreatable<PostEffect, Instance, sPostEffect>(name)
	{
		setName(sPostEffect);
	}

	void PostEffect::setEnabled(bool value)
	{
		enabled = value;
		raisePropertyChanged(prop_enabled);
	}
}
