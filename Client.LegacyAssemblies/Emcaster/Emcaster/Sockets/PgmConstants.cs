namespace Emcaster.Sockets
{
    public class PgmConstants
    {
        public static readonly int IPPROTO_RM = 113;
        public static readonly int MAX_MCAST_TTL = 255;

        //
        // options for setsockopt, getsockopt
        //
        public static readonly int RM_OPTIONSBASE = 1000;

        // Set/Query rate (Kb/Sec) + window size (Kb and/or MSec) -- described by RM_SEND_WINDOW below
        public static readonly int RM_RATE_WINDOW_SIZE = (RM_OPTIONSBASE + 1);

        // Set the size of the next message -- (ULONG)
        public static readonly int RM_SET_MESSAGE_BOUNDARY = (RM_OPTIONSBASE + 2);

        // flush the entire data (window) right now -- not implemented
        public static readonly int RM_FLUSHCACHE = (RM_OPTIONSBASE + 3);

        // Set or Query the window advance method on the sender -- methods enumerated in eWINDOW_ADVANCE_METHOD
        public static readonly int RM_SENDER_WINDOW_ADVANCE_METHOD = (RM_OPTIONSBASE + 4);

        // get sender statistics
        public static readonly int RM_SENDER_STATISTICS = (RM_OPTIONSBASE + 5);

        // allow a late-joiner to NAK any packet upto the lowest sequence Id
        public static readonly int RM_LATEJOIN = (RM_OPTIONSBASE + 6);

        // set IP multicast outgoing interface
        public static readonly int RM_SET_SEND_IF = (RM_OPTIONSBASE + 7);

        // add IP multicast incoming interface
        public static readonly int RM_ADD_RECEIVE_IF = (RM_OPTIONSBASE + 8);

        // delete IP multicast incoming interface
        public static readonly int RM_DEL_RECEIVE_IF = (RM_OPTIONSBASE + 9);

        // Set/Query the Window's Advance rate (has to be less that MAX_WINDOW_INCREMENT_PERCENTAGE)
        public static readonly int RM_SEND_WINDOW_ADV_RATE = (RM_OPTIONSBASE + 10);

        // Instruct to use parity-based forward error correction schemes
        public static readonly int RM_USE_FEC = (RM_OPTIONSBASE + 11);

        // Set the Ttl of the MCast packets -- (ULONG)
        public static readonly int RM_SET_MCAST_TTL = (RM_OPTIONSBASE + 12);

        // get receiver statistics
        public static readonly int RM_RECEIVER_STATISTICS = (RM_OPTIONSBASE + 13);
    }

    internal enum eWINDOW_ADVANCE_METHOD
    {
        E_WINDOW_ADVANCE_BY_TIME = 1, // Default mode
        E_WINDOW_USE_AS_DATA_CACHE
    } ;

//==============================================================
//
// Structures
//
    public struct _RM_SEND_WINDOW
    {
        public uint RateKbitsPerSec; // Send rate
        public uint WindowSizeInMSecs;
        public uint WindowSizeInBytes;
    }

    public struct _RM_SENDER_STATS
    {
        public ulong DataBytesSent; // # client data bytes sent out so far
        public ulong TotalBytesSent; // SPM, OData and RData bytes
        public ulong NaksReceived; // # NAKs received so far
        public ulong NaksReceivedTooLate; // # NAKs recvd after window advanced
        public ulong NumOutstandingNaks; // # NAKs yet to be responded to
        public ulong NumNaksAfterRData; // # NAKs yet to be responded to
        public ulong RepairPacketsSent; // # Repairs (RDATA) sent so far
        public ulong BufferSpaceAvailable; // # partial messages dropped
        public ulong TrailingEdgeSeqId; // smallest (oldest) Sequence Id in the window
        public ulong LeadingEdgeSeqId; // largest (newest) Sequence Id in the window
        public ulong RateKBitsPerSecOverall; // Internally calculated send-rate from the beginning
        public ulong RateKBitsPerSecLast; // Send-rate calculated every INTERNAL_RATE_CALCULATION_FREQUENCY
    }


    public struct _RM_RECEIVER_STATS
    {
        public ulong NumODataPacketsReceived; // # OData sequences received
        public ulong NumRDataPacketsReceived; // # RData sequences received
        public ulong NumDuplicateDataPackets; // # RData sequences received

        public ulong DataBytesReceived; // # client data bytes received out so far
        public ulong TotalBytesReceived; // SPM, OData and RData bytes
        public ulong RateKBitsPerSecOverall; // Internally calculated Receive-rate from the beginning
        public ulong RateKBitsPerSecLast; // Receive-rate calculated every INTERNAL_RATE_CALCULATION_FREQUENCY

        public ulong TrailingEdgeSeqId; // smallest (oldest) Sequence Id in the window
        public ulong LeadingEdgeSeqId; // largest (newest) Sequence Id in the window
        public ulong AverageSequencesInWindow;
        public ulong MinSequencesInWindow;
        public ulong MaxSequencesInWindow;

        public ulong FirstNakSequenceNumber; // # First Outstanding Nak
        public ulong NumPendingNaks; // # Sequences waiting for Ncfs
        public ulong NumOutstandingNaks; // # Sequences for which Ncfs have been received, but no data
        public ulong NumDataPacketsBuffered; // # Data packets currently buffered by transport
        public ulong TotalSelectiveNaksSent; // # Selective NAKs sent so far
        public ulong TotalParityNaksSent; // # Parity NAKs sent so far
    }
}