#pragma once

#include "FastLog.h"

namespace FLog {

	bool LOGAPI SetLogStreamFile(const char* path);
	bool LOGAPI SetLogStreamNetworkClient(const char* address, unsigned int port);
	bool LOGAPI SetLogStreamNetworkServer(unsigned int port);

}
