using System.Configuration;

namespace Roblox.Configuration
{
    public class EndpointAddressElement : ConfigurationElement
	{
		static EndpointAddressElement()
		{
            nameProperty = new ConfigurationProperty("endpointConfigurationName", typeof(string), null, ConfigurationPropertyOptions.IsRequired);
            properties.Add(nameProperty);
			connectionStringProperty = new ConfigurationProperty("connectionString", typeof(string), null, ConfigurationPropertyOptions.IsRequired);
			properties.Add(connectionStringProperty);
		}

		public string EndpointConfigurationName
        {
            get => (string)base[nameProperty];
            set => base[nameProperty] = value;
        }
        public string ConnectionString
        {
            get => (string)base[connectionStringProperty];
            set => base[connectionStringProperty] = value;
        }
        protected override ConfigurationPropertyCollection Properties => properties;

        private static readonly ConfigurationPropertyCollection properties = new ConfigurationPropertyCollection();
		private static readonly ConfigurationProperty nameProperty;
		private static readonly ConfigurationProperty connectionStringProperty;
	}
}
