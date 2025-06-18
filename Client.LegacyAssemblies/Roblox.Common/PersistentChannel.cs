using System;
using System.ServiceModel;

namespace Roblox.ServiceModel
{
    public class PersistentChannel<TChannel> : IDisposable where TChannel : IClientChannel
    {
        public PersistentChannel(ChannelFactory<TChannel> factory) : this(factory, null)
        {}

        public PersistentChannel(ChannelFactory<TChannel> factory, TimeSpan? operationTimeout)
        {
            this.factory = factory;
            this.operationTimeout = operationTimeout;
            AppDomain.CurrentDomain.DomainUnload += CurrentDomain_DomainUnload;
        }

        public TChannel Get()
        {
            if (channel != null && channel.State == CommunicationState.Opened)
                return channel;

            lock (factory)
            {
                if (channel == null || channel.State != CommunicationState.Opened)
                {
                    CloseChannel();
                    channel = factory.CreateChannel();
                    if (operationTimeout != null)
                        channel.OperationTimeout = operationTimeout.Value;

                    try
                    {
                        channel.Open();
                    }
                    catch (Exception)
                    {
                        CloseChannel();
                        channel = factory.CreateChannel();
                        if (operationTimeout != null)
                            channel.OperationTimeout = operationTimeout.Value;
                        channel.Open();
                    }
                }
            }

            return channel;
        }

        private void CurrentDomain_DomainUnload(object sender, EventArgs e)
            => CloseChannel();

        private void CloseChannel()
        {
            if (channel == null) return;

            try
            {
                if (channel.State != CommunicationState.Faulted)
                    channel.Close();
                else
                    channel.Abort();
            }
            catch (CommunicationException)
            {
                channel.Abort();
            }
            catch (TimeoutException)
            {
                channel.Abort();
            }
            catch (Exception)
            {
                channel.Abort();
                throw;
            }
            finally
            {
                channel = default(TChannel);
            }
        }

        public void Dispose()
        {
            AppDomain.CurrentDomain.DomainUnload -= CurrentDomain_DomainUnload;
            CloseChannel();
        }
        
        private ChannelFactory<TChannel> factory;
        private TChannel channel;
        private TimeSpan? operationTimeout;
    }
}
