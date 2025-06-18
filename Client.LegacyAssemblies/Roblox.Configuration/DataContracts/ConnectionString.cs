using System;
using System.ComponentModel;
using System.Data.Linq.Mapping;

namespace Roblox.Configuration
{
    [Table(Name = "dbo.ConnectionStrings")]
    public class ConnectionString :INotifyPropertyChanging, INotifyPropertyChanged
    {
        [Column(Storage = "_ID", AutoSync = AutoSync.OnInsert, DbType = "Int NOT NULL IDENTITY", IsPrimaryKey = true, IsDbGenerated = true)]
        public int ID
        {
            get { return _ID; }
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

        [Column(Storage = "_GroupName", DbType = "VarChar(256) NOT NULL", CanBeNull = false)]
        public string GroupName
        {
            get { return _GroupName; }
            set
            {
                if (_GroupName != value)
                {
                    SendPropertyChanging();
                    _GroupName = value;
                    SendPropertyChanged(nameof(GroupName));
                }
            }
        }

        [Column(Storage = "_Name", DbType = "VarChar(256) NOT NULL", CanBeNull = false)]
        public string Name
        {
            get { return _Name; }
            set
            {
                if (_Name != value)
                {
                    SendPropertyChanging();
                    _Name = value;
                    SendPropertyChanged(nameof(Name));
                }
            }
        }

        [Column(Storage = "_Value", DbType = "NVarChar(MAX) NOT NULL", CanBeNull = false)]
        public string Value
        {
            get { return _Value; }
            set
            {
                if (_Value != value)
                {
                    SendPropertyChanging();
                    _Value = value;
                    SendPropertyChanged(nameof(Value));
                }
            }
        }

        [Column(Storage = "_LastModified", DbType = "DateTime NOT NULL")]
        public DateTime LastModified
        {
            get { return _LastModified; }
            set
            {
                if (_LastModified != value)
                {
                    SendPropertyChanging();
                    _LastModified = value;
                    SendPropertyChanged(nameof(LastModified));
                }
            }
        }

        private static readonly PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(string.Empty);
        private int _ID;
        private string _GroupName;
        private string _Name;
        private string _Value;
        private DateTime _LastModified;

        public event PropertyChangingEventHandler PropertyChanging;
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void SendPropertyChanging() => PropertyChanging?.Invoke(this, emptyChangingEventArgs);
        protected virtual void SendPropertyChanged(string propertyName) => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));        
    }
}
