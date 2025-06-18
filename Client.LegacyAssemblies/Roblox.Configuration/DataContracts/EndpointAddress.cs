using System.ComponentModel;
using System.Data.Linq.Mapping;

namespace Roblox.Configuration
{
    [Table(Name = "dbo.EndpointAddresses")]
    public class EndpointAddress : INotifyPropertyChanging, INotifyPropertyChanged
    {
        [Column(Storage = "_ID", AutoSync = AutoSync.OnInsert, DbType = "Int NOT NULL IDENTITY", IsPrimaryKey = true, IsDbGenerated = true)]
        public int ID
        {
            get
            {
                return _ID;
            }
            set
            {
                if (_ID != value)
                {
                    SendPropertyChanging();
                    _ID = value;
                    SendPropertyChanged(nameof(ID));
                }
            }
        }

        [Column(Storage = "_EndpointConfigurationName", DbType = "VarChar(256) NOT NULL", CanBeNull = false)]
        public string EndpointConfigurationName
        {
            get
            {
                return _EndpointConfigurationName;
            }
            set
            {
                if (_EndpointConfigurationName != value)
                {
                    SendPropertyChanging();
                    _EndpointConfigurationName = value;
                    SendPropertyChanged(nameof(EndpointConfigurationName));
                }
            }
        }

        [Column(Storage = "_Uri", DbType = "VarChar(256) NOT NULL", CanBeNull = false)]
        public string Uri
        {
            get
            {
                return _Uri;
            }
            set
            {
                if (_Uri != value)
                {
                    SendPropertyChanging();
                    _Uri = value;
                    SendPropertyChanged(nameof(Uri));
                }
            }
        }

        private static readonly PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(string.Empty);
        private int _ID;
        private string _EndpointConfigurationName;
        private string _Uri;

        public event PropertyChangingEventHandler PropertyChanging;
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void SendPropertyChanging() => PropertyChanging?.Invoke(this, emptyChangingEventArgs);
        protected virtual void SendPropertyChanged(string propertyName) => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));

    }
}