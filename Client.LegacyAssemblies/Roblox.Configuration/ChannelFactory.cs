using System;
using System.Linq;
using System.Configuration;
using System.ServiceModel.Channels;
using System.ServiceModel.Description;

namespace Roblox.Configuration
{
    public class ChannelFactory<T> : System.ServiceModel.ChannelFactory<T>
    {
        private readonly Uri alternateUrl;

        public ChannelFactory(string endpointConfigurationName)
            : this(endpointConfigurationName, null as System.ServiceModel.EndpointAddress)
        { }
        public ChannelFactory(string endpointConfigurationName, string remoteAddress)
            : base(typeof(T))
        {
            alternateUrl = GetUriFromConfig(endpointConfigurationName);
            InitializeEndpoint(endpointConfigurationName, null);
        }
        public ChannelFactory(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress)
            : base(typeof(T))
        {
            alternateUrl = GetUriFromConfig(endpointConfigurationName);
            InitializeEndpoint(endpointConfigurationName, remoteAddress);
        }

        protected override ServiceEndpoint CreateDescription()
        {
            var endpoint = base.CreateDescription();
            if (alternateUrl != null)
            {
                if (endpoint.Address == null)
                    endpoint.Address = new System.ServiceModel.EndpointAddress(alternateUrl, new AddressHeader[0]);
                else
                {
                    using (var readerAtMeta = endpoint.Address.GetReaderAtMetadata())
                    using (var readerAtExt = endpoint.Address.GetReaderAtExtensions())
                        endpoint.Address = new System.ServiceModel.EndpointAddress(alternateUrl, endpoint.Address.Identity, endpoint.Address.Headers, readerAtMeta, readerAtExt);
                }
            }
            return endpoint;
        }
        private Uri GetUriFromConfig(string endpointConfigurationName)
        {
            if (string.IsNullOrEmpty(endpointConfigurationName))
                throw new ArgumentNullException(nameof(endpointConfigurationName));

            if (!(ConfigurationManager.GetSection("robloxConfigurationProvider") is ProviderConfigSection section))
                return null;

            var el = section.EndpointAddressConfigs[endpointConfigurationName];
            if (el == null)
                el = section.EndpointAddressConfigs["*"];
            if (el == null)
                return null;

            if (string.IsNullOrEmpty(el.ConnectionString))
                return null;
            using (var dataCtx = new ConfigurationDataClassesDataContext(el.ConnectionString))
                return new Uri((
                    from a in dataCtx.EndpointAddresses
                    where a.EndpointConfigurationName == endpointConfigurationName
                    select a.Uri
                ).SingleOrDefault());
        }
    }
}