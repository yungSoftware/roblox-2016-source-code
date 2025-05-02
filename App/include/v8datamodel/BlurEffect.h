#pragma once

#include "v8datamodel/InputObject.h"
#include "v8datamodel/Lighting.h"
#include "PostEffect.h"

namespace RBX {
	extern const char* const sBlurEffect;
	class BlurEffect : public DescribedCreatable<BlurEffect, PostEffect, sBlurEffect, Reflection::ClassDescriptor::PERSISTENT>
	{
	private:
		typedef DescribedCreatable<BlurEffect, PostEffect, sBlurEffect, Reflection::ClassDescriptor::PERSISTENT> Super;
	public:
		BlurEffect();

		void setSize(int value);
		int getSize() const { return std::min(56, std::max(0, Size)); }

		bool isActive;
	protected:
		int Size;
	};
}
