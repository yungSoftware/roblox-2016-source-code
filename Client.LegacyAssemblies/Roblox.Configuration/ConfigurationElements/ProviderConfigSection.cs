using System.Configuration;

namespace Roblox.Configuration
{
    public class ProviderConfigSection : ConfigurationSection
	{
		static ProviderConfigSection()
		{
			isDatabaseWritableProperty = new ConfigurationProperty("isDatabaseWritable", typeof(bool), false, ConfigurationPropertyOptions.None);
			_Properties.Add(isDatabaseWritableProperty);
			groupConfigs = new ConfigurationProperty("groups", typeof(GroupConfigElements), null, ConfigurationPropertyOptions.IsRequired);
			_Properties.Add(groupConfigs);
			endpointAddressConfigs = new ConfigurationProperty("endpointAddresses", typeof(EndpointAddressElements), null, ConfigurationPropertyOptions.None);
            _Properties.Add(endpointAddressConfigs);
		}

		public bool IsDatabaseReadonly
        {
            get => !(bool)base[isDatabaseWritableProperty];
            set => base[isDatabaseWritableProperty] = !value;
        }
        public GroupConfigElements GroupConfigs => (GroupConfigElements)base[groupConfigs];
		public EndpointAddressElements EndpointAddressConfigs => (EndpointAddressElements)base[endpointAddressConfigs];
		protected override ConfigurationPropertyCollection Properties => _Properties;

		private static readonly ConfigurationPropertyCollection _Properties = new ConfigurationPropertyCollection();
		private static readonly ConfigurationProperty isDatabaseWritableProperty;
		private static readonly ConfigurationProperty groupConfigs;
		private static readonly ConfigurationProperty endpointAddressConfigs;
	}
}
