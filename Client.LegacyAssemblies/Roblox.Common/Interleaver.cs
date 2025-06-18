using System;
using Microsoft.Ccr.Core;

namespace Roblox
{
    public class Interleaver
    {
        readonly Port<Action> exclusive = new Port<Action>();
        readonly Port<Action> concurrent = new Port<Action>();

        public void DoExclusive(Action action)
        {
            exclusive.Post(action);
        }

        public void DoConcurrent(Action action)
        {
            concurrent.Post(action);
        }

        public Interleaver()
        {
            CcrService.Singleton.Activate(Arbiter.Interleave(
                new TeardownReceiverGroup(),
                new ExclusiveReceiverGroup(
                    Arbiter.Receive(true, exclusive, action => action())
                    ),
                new ConcurrentReceiverGroup(
                    Arbiter.Receive(true, concurrent, action => action())
                    )
                ));
        }
    }
}
