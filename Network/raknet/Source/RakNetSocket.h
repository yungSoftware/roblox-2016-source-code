/*
 *  Copyright (c) 2014, Oculus VR, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the BSD-style license found in the
 *  LICENSE file in the root directory of this source tree. An additional grant 
 *  of patent rights can be found in the PATENTS file in the same directory.
 *
 */

#ifndef __RAKNET_SOCKET_H
#define __RAKNET_SOCKET_H

#include "RakNetTypes.h"
#include "RakNetDefines.h"
#include "Export.h"

namespace RakNet
{

	struct RAK_DLL_EXPORT RakNetSocket
	{
		RakNetSocket();
		~RakNetSocket();
		// SocketIncludes.h includes Windows.h, which messes up a lot of compiles
		// SOCKET s;
		unsigned int s;
		unsigned int userConnectionSocketIndex;
		SystemAddress boundAddress;
		unsigned short socketFamily;

#if defined (_WIN32) && defined(USE_WAIT_FOR_MULTIPLE_EVENTS)
		void* recvEvent;
#endif






		unsigned short remotePortRakNetWasStartedOn_PS3_PSP2;

		unsigned int extraSocketOptions;
	};

} // namespace RakNet

#endif