#include "NetworkProfiler.h"

#ifdef NETWORK_PROFILER

#include "SQLite3Plugin/sqlite3.h"
#include "SQLite3Plugin/SQLiteClientLoggerPlugin.h"
#include "rbx/Debug.h"

namespace RBX {
namespace Network {

const char* const columnNames = "tag, offset, bitSize, layer1, layer2, layer3, layer4, layer5, layer6, layer7, layer8, layer9";

NetworkProfiler::NetworkProfiler(void)
: deepestLayer(0)
, networkSettings(&NetworkSettings::singleton())
, loggerPlugin(NULL)
{
}

NetworkProfiler::~NetworkProfiler(void)
{
	Disconnect();
}

bool NetworkProfiler::CanProfile()
{
	if (networkSettings->profiling)
	{
		Connect();
		if (networkSettings->profilerTimedSeconds > 0.f)
		{
			if (profilerTimer.delta().seconds() > networkSettings->profilerTimedSeconds )
			{
				// timeout, stop profiling
				networkSettings->profiling = false;
				Disconnect();
				return false; // note, early return
			}
		}
		return true;
	}
	else
	{
		Disconnect();
		return false;
	}
}


void NetworkProfiler::Disconnect()
{
	if (connected)
	{
		loggerPlugin->ClearResultHandlers();
		packetizedTCP.Stop();
		packetizedTCP.DetachPlugin(loggerPlugin);
		delete loggerPlugin;
		dataBlobStack.clear();
		connected = false;
	}
}

NetworkProfiler* NetworkProfiler::singleton()
{
	static NetworkProfiler networkProfiler;
	return &networkProfiler;
}


void NetworkProfiler::startCpuProfiling(int tag)
{
    if (networkSettings->profilecpu)
    {
        cpuProfilingStats[tag].newSample();
    }
}

void NetworkProfiler::stepCpuProfiling(int tag)
{
    if (networkSettings->profilecpu)
    {
        cpuProfilingStats[tag].step();
    }
}

void NetworkProfiler::outputCpuProfiling()
{
    for (int tag=0; tag<PROFILER_TAG_COUNT; tag++)
    {
        if (cpuProfilingStats[tag].getNumSample() > 0)
        {
            // output the stats
            StandardOut::singleton()->printf(RBX::MESSAGE_INFO, "[%d] profiling results (%d samples):", tag, cpuProfilingStats[tag].getNumSample());
            float lastStepDelta = 0.0f;
            for (int i=0; cpuProfilingStats[tag].stepDelta[i]>0.f; i++)
            {
                float deltaBetweenSteps;
                float stepDelta = cpuProfilingStats[tag].stepDelta[i];
                deltaBetweenSteps = stepDelta - lastStepDelta;
                lastStepDelta = stepDelta;
                StandardOut::singleton()->printf(RBX::MESSAGE_INFO, "Step %d: %f (delta %f, total %f)", i+1, stepDelta, deltaBetweenSteps, deltaBetweenSteps*cpuProfilingStats[tag].getNumSample());
            }
        }
    }
}

#endif
