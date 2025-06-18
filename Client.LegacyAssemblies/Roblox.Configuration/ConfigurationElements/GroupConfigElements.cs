using System.Configuration;

namespace Roblox.Configuration
{
    public class GroupConfigElements : ConfigurationElementCollection
    {
        public override ConfigurationElementCollectionType CollectionType => ConfigurationElementCollectionType.BasicMap;
        protected override string ElementName => "group";
        protected override ConfigurationPropertyCollection Properties => new ConfigurationPropertyCollection();
        public GroupConfigElement this[int index]
        {
            get => (GroupConfigElement)BaseGet(index);
            set
            {
                if (BaseGet(index) != null) BaseRemoveAt(index);
                BaseAdd(index, value);
            }
        }
        new public GroupConfigElement this[string name] => (GroupConfigElement)BaseGet(name);

        public void Add(GroupConfigElement item) => BaseAdd(item);
        public void Remove(GroupConfigElement item) => BaseRemove(item);
        public void RemoveAt(int index) => BaseRemoveAt(index);
        protected override ConfigurationElement CreateNewElement() => new GroupConfigElement();
        protected override object GetElementKey(ConfigurationElement element) => (element as GroupConfigElement).GroupName;
    }
}
