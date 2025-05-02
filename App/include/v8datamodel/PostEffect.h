#include "Reflection/Reflection.h"
#pragma once

namespace RBX {

	extern const char* const sPostEffect;
	class PostEffect : public DescribedNonCreatable<PostEffect, Instance, sPostEffect>
	{

	public:
		PostEffect(const char* name);

		void setEnabled(bool value);
		bool getEnabled() const { return enabled; }
	private:
		typedef DescribedNonCreatable<PostEffect, Instance, sPostEffect> Super;
		bool enabled;

	};

}
