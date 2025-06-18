using System.Configuration;

namespace Roblox.Configuration
{
    public class EndpointAddressElements : ConfigurationElementCollection
    {
        public override ConfigurationElementCollectionType CollectionType => ConfigurationElementCollectionType.BasicMap;
        protected override string ElementName => "endpointAddress";
        protected override ConfigurationPropertyCollection Properties => new ConfigurationPropertyCollection();
        public EndpointAddressElement this[int index]
        {
            get => (EndpointAddressElement)BaseGet(index);
            set
            {
                if (BaseGet(index) != null) BaseRemoveAt(index);
                BaseAdd(index, value);
            }
        }
        new public EndpointAddressElement this[string name] => (EndpointAddressElement)BaseGet(name);

        public void Add(EndpointAddressElement item) => BaseAdd(item);
        public void Remove(EndpointAddressElement item) => BaseRemove(item);
        public void RemoveAt(int index) => BaseRemoveAt(index);
        protected override ConfigurationElement CreateNewElement() => new EndpointAddressElement();
        protected override object GetElementKey(ConfigurationElement element) => (element as EndpointAddressElement).EndpointConfigurationName;
    }
}
