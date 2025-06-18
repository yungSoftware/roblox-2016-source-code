using System;
using System.ComponentModel;
using System.Data.Linq.Mapping;

namespace Roblox.Configuration
{
    [Table(Name = "dbo.Settings")]
    public class Setting : INotifyPropertyChanging, INotifyPropertyChanged
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
                    SendPropertyChanged("Id");
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
                    SendPropertyChanged("GroupName");
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
                    SendPropertyChanged("Name");
                }
            }
        }


        [Column(Storage = "_Type", DbType = "VarChar(256) NOT NULL", CanBeNull = false)]
        public string Type
        {
            get { return _Type; }
            set
            {
                if (_Type != value)
                {
                    SendPropertyChanging();
                    _Type = value;
                    SendPropertyChanged("Type");
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
                    SendPropertyChanged("Value");
                }
            }
        }

        [Column(Storage = "_Comment", DbType = "NVarChar(MAX)")]
        public string Comment
        {
            get { return _Comment; }
            set
            {
                if (_Comment != value)
                {
                    SendPropertyChanging();
                    _Comment = value;
                    SendPropertyChanged("Comment");
                }
            }
        }

        [Column(Storage = "_IsEnvironmentSpecific", DbType = "Bit NOT NULL", CanBeNull = false)]
        public bool IsEnvironmentSpecific
        {
            get { return _IsEnvironmentSpecific; }
            set
            {
                if (_IsEnvironmentSpecific != value)
                {
                    SendPropertyChanging();
                    _IsEnvironmentSpecific = value;
                    SendPropertyChanged("IsEnvironmentSpecific");
                }
            }
        }

        [Column(Storage = "_IsMasked", DbType = "Bit NOT NULL", CanBeNull = false)]
        public bool IsMasked
        {
            get { return _IsMasked; }
            set
            {
                if (_IsMasked != value)
                {
                    SendPropertyChanging();
                    _IsMasked = value;
                    SendPropertyChanged("IsMasked");
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
                    SendPropertyChanged("LastModified");
                }
            }
        }

        private static readonly PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(string.Empty);
        private int _ID;
        private string _GroupName;
        private string _Name;
        private string _Type;
        private string _Value;
        private string _Comment;
        private bool _IsEnvironmentSpecific;
        private bool _IsMasked;
        private DateTime _LastModified;

        public event PropertyChangingEventHandler PropertyChanging;
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void SendPropertyChanging() => PropertyChanging?.Invoke(this, emptyChangingEventArgs);
        protected virtual void SendPropertyChanged(string propertyName) => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));

    }
}
