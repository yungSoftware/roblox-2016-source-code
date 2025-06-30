/* Copyright 2003-2006 ROBLOX Corporation, All Rights Reserved */

#include "Client.h"
#include "ClientReplicator.h"

#include "PacketLogger.h"
#include "Util.h"
#include "ConcurrentRakPeer.h"
#include "Network/Players.h"
#include "Network/NetworkOwner.h"
#include "Util/ProgramMemoryChecker.h"
#include "util/standardout.h"
#include "util/ProtectedString.h"
#include "Util/RbxStringTable.h"
#include "CPUCount.h"
#include "FastLog.h"
#include "rbx/RbxDbgInfo.h"
#include "v8datamodel/HackDefines.h"
#include "v8datamodel/Workspace.h"
#include "v8datamodel/DataModel.h"
#include "V8DataModel/DebugSettings.h"
#include "v8datamodel/TeleportService.h"

#include "Script/scriptcontext.h"

#include "RakNetStatistics.h"
#include "VMProtectSDK.h"

LOGGROUP(US14116)
DYNAMIC_FASTFLAG(DebugDisableTimeoutDisconnect)
FASTFLAG(DebugLocalRccServerConnection)

DYNAMIC_LOGGROUP(NetworkJoin)
FASTFLAG(DebugProtocolSynchronization)

#ifndef _WIN32
// For inet_addr() call used below
#include <arpa/inet.h>
#endif

const char* const RBX::Network::sClient = "NetworkClient";

namespace RBX
{
	extern const char *const sHopper;
    class Instance;
}

using namespace RBX;
using namespace RBX::Network;

REFLECTION_BEGIN();
Reflection::BoundProp<std::string> Client::prop_Ticket("Ticket", "Authentication", &Client::ticket);
static Reflection::BoundFuncDesc<Client, shared_ptr<Instance>(int, std::string, int, int, int)> f_connect(&Client::playerConnect, "PlayerConnect", "userId", "server", "serverPort", "clientPort", 0, "threadSleepTime", 30, Security::Plugin);
static Reflection::BoundFuncDesc<Client, void(int)> f_disconnect(&Client::disconnect, "Disconnect", "blockDuration", 3000, Security::LocalUser);
static Reflection::BoundFuncDesc<Client, void(std::string)> func_setGameSessionID(&Client::setGameSessionID, "SetGameSessionID", "gameSessionID", Security::Roblox);
static Reflection::EventDesc<Client, void(std::string, shared_ptr<RBX::Instance>)> event_ConnectionAccepted(&Client::connectionAcceptedSignal, "ConnectionAccepted", "peer", "replicator");
static Reflection::EventDesc<Client, void(std::string)> event_ConnectionRejected(&Client::connectionRejectedSignal, "ConnectionRejected", "peer");
static Reflection::EventDesc<Client, void(std::string, int, std::string)> event_ConnectionFailed(&Client::connectionFailedSignal, "ConnectionFailed", "peer", "code", "reason");
REFLECTION_END();

Client::Client()
	: userId(-1), networkSettings(&NetworkSettings::singleton()), isCloudEditClient(false)
{
	RBX::Security::Context::current().requirePermission(RBX::Security::Plugin, "create a NetworkClient");
	setName(sClient);

	FASTLOG(FLog::Network, "NetworkClient:Create");
}

Client::~Client(void)
{
	FASTLOG(FLog::Network, "NetworkClient:Remove");
}

Client* Client::findClient(const RBX::Instance* context, bool testInDatamodel)
{
	const ServiceProvider* serviceProvider = ServiceProvider::findServiceProvider(context);
	RBXASSERT(!testInDatamodel || serviceProvider!=NULL);
	return ServiceProvider::find<Client>(serviceProvider);
}

bool Client::clientIsPresent(const RBX::Instance* context, bool testInDatamodel)
{
	return findClient(context, testInDatamodel) != NULL;
}

bool Client::physicsOutBandwidthExceeded(const RBX::Instance* context)
{
	if (Client* client = Client::findClient(context))
	{
		if (ClientReplicator* clientRep = client->findFirstChildOfType<ClientReplicator>())
		{
			return clientRep->isLimitedByOutgoingBandwidthLimit();
		}
	}
	return true;
}

double Client::getNetworkBufferHealth(const RBX::Instance* context)
{
	if (Client* client = Client::findClient(context))
	{
		return client->rakPeer->GetBufferHealth();
	}
	return 0.0f;
}

const RBX::SystemAddress Client::findLocalSimulatorAddress(const RBX::Instance* context)
{
	if (Client* client = Client::findClient(context, false)) {
		if (ClientReplicator* clientRep = client->findFirstChildOfType<ClientReplicator>()) {
			
		}
	}
	return Network::NetworkOwner::Unassigned();
}

shared_ptr<Instance> Client::playerConnect(int userId, std::string server, int serverPort, int clientPort, int threadSleepTime)
{
	FASTLOG3(FLog::Network, "Client:Connect serverPort(%d) clientPort(%d) threadSleepTime(%d)", serverPort, clientPort, threadSleepTime);

	this->userId = userId;
	Players* players = ServiceProvider::create<Players>(this);
	if(!players)
		throw RBX::runtime_error("Cannot get players");

	shared_ptr<Instance> player = players->createLocalPlayer(userId, TeleportService::getPreviousPlaceId() > 0);

	if (clientPort == 0) {
		clientPort = networkSettings->preferredClientPort;
	}

	// allow local and LAN games only.
	if (server != "localhost")
	{
		bool lansubnet = false;
		for (int i=0; !lansubnet && i<MAXIMUM_NUMBER_OF_INTERNAL_IDS; ++i)
		{
			

			// match the a and b records
			lansubnet = (localAddress.GetBinaryAddress() & 0x00FF) == (remoteAddress.GetBinaryAddress() & 0x00FF);
		}
		if (!FFlag::DebugLocalRccServerConnection)
		{
			if (!lansubnet)
			{
				RBX::Security::Context::current().requirePermission(RBX::Security::Roblox, " connect to an extranet game");
			}
		}
	}
    if (FFlag::DebugLocalRccServerConnection)
    {
        //skip the security check
        Network::versionB = "test";
    }

	
	FASTLOG1F(DFLog::NetworkJoin, "playerConnect connecting to server @ %f s", Time::nowFastSec());

	if(DFFlag::DebugDisableTimeoutDisconnect)
		

	StandardOut::singleton()->printf(MESSAGE_SENSITIVE, "Connecting to %s:%d", server.c_str(), serverPort);

	FASTLOG2(FLog::Network, "Connecting to server, IP(inet_addr): %u Port: %u", inet_addr(server.c_str()), serverPort);

	RBX::RbxDbgInfo::SetServerIP(server.c_str());

	return player;
}



void Client::disconnect(int blockDuration)
{
	FASTLOG(FLog::Network, "Client:Disconnect");

	// The following line will remove the Replicator
	this->visitChildren(boost::bind(&Instance::unlockParent, _1));
	this->removeAllChildren();

	if (rakPeer)
	{
		rakPeer->rawPeer()->CloseConnection(this->serverId, true);
		rakPeer->rawPeer()->Shutdown(blockDuration);
	}
}

void Client::setGameSessionID(std::string value)
{
	if (value != Http::gameSessionID)
	{
		Http::gameSessionID = value;
	}
}

void Client::configureAsCloudEditClient()
{
	isCloudEditClient = true;
}

bool Client::isCloudEdit() const
{
	return isCloudEditClient;
}

void Client::onServiceProvider(ServiceProvider* oldProvider, ServiceProvider* newProvider)
{
	if (oldProvider)
	{
		closingConnection.disconnect();

		disconnect(); // We should have disconnected by now (in response to the Closing event)

		Players* players = ServiceProvider::find<Players>(oldProvider);
		players->setConnection(NULL);
	}

	Super::onServiceProvider(oldProvider, newProvider);

	if (newProvider)
	{
		//We're in multiplayer mode, so burn out the studio tools
		if(RBX::DataModel* dataModel = RBX::DataModel::get(this)){
			if(dataModel->lockVerb.get())
				dataModel->lockVerb->doIt(NULL);
		}

		Players* players = ServiceProvider::create<Players>(newProvider);
		players->setConnection(rakPeer.get());

		// Disconnect now before we start getting DescendantRemoving events
		// If we don't disconnect first, then we'll send a shower of delete messages
		// to the Server
		closingConnection = newProvider->closingSignal.connect(boost::bind(&Client::disconnect, this));
	}

}

void Client::sendVersionInfo()
{
}

void Client::sendTicket()
{
	
    serializeStringCompressed(ticket, bitStream);

	serializeStringCompressed(RBX::DataModel::hash, bitStream);

	bitStream << protocolVersion;

    serializeStringCompressed(securityKey, bitStream);

	// TODO: better way to track protocol changes between versions
	// Network Protocol version 2
	serializeStringCompressed(DebugSettings::singleton().osPlatform(), bitStream);
    serializeStringCompressed(DebugSettings::singleton().getRobloxProductName(), bitStream);

    serializeStringCompressed(Http::gameSessionID, bitStream);

    unsigned int reportedGoldHash = RBX::Security::rbxGoldHash;

    bitStream << reportedGoldHash;

	encryptDataPart(bitStream);

	// Send ID_SUBMIT_TICKET
	rakPeer->rawPeer()->Send(&bitStream, networkSettings->getDataSendPriority(), DATAMODEL_RELIABILITY, DATA_CHANNEL, serverId, false);
}

std::string rakIdToString(int id)
{
	switch (id)
	{
	case ID_INVALID_PASSWORD:
	case ID_HASH_MISMATCH:
		return "ROBLOX version is out of date. Please uninstall and try again.";
	case ID_CONNECTION_ATTEMPT_FAILED:
		return "Connection attempt failed.";
	case ID_SECURITYKEY_MISMATCH:
		return "Version not compatible with server. Please uninstall and try again.";
	default:
		return RBX::format("Network error %d", id);
	}
}

// Cheat Engine StealthEdit Plugin helper. Name obscured for security.
#if !defined(RBX_STUDIO_BUILD)
static void programMemoryPermissionsHackChecker(weak_ptr<DataModel> weakDataModel) {
	static const unsigned int kSleepBetweenStealthEditChecksMillis = 2 * 1000;
	VMProtectBeginMutation("24");
	while (true) {
		shared_ptr<DataModel> dataModel = weakDataModel.lock();
		if (!dataModel) { break; }

		//FASTLOG(FLog::US14116, "Starting stealth check");
		if (ProgramMemoryChecker::areMemoryPagePermissionsSetupForHacking()) {
			//FASTLOG(FLog::US14116, "Caught stealthedit!");
            RBX::Security::setHackFlagVmp<LINE_RAND4>(RBX::Security::hackFlag7, HATE_CATCH_EXECUTABLE_ACCESS_VIOLATION);
		}
		//FASTLOG1(FLog::US14116, "Sleeping stealth for %ums", kSleepBetweenStealthEditChecksMillis);
		boost::this_thread::sleep(boost::posix_time::milliseconds(kSleepBetweenStealthEditChecksMillis));
	}
	VMProtectEnd();
}
#endif

void Client::sendPreferedSpawnName() const {

}
