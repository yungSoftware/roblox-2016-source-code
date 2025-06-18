using System;
using System.Linq;
using System.Diagnostics;
using System.Configuration;

namespace Roblox.Configuration
{
    public static class Utilities
    {
        public static DateTime GetTimestamp()
        {
            return DateTime.UtcNow.AddHours(-7);
        }

        internal static void MergeSettings(ClientSettingsSection settings, ConnectionStringSettingsCollection connectionStrings, string groupName, string connectionString, SettingsPropertyCollection collection)
        {
            using (var dataAccess = new ConfigurationDataClassesDataContext(connectionString))
            {
                if (settings == null)
                {
                    Log(EventLogEntryType.Information, "CopySettings: Did not find config for group {0}", groupName);
                }
                else
                {
                    foreach (var obj in settings.Settings)
                    {
                        if (!(obj is SettingElement setting)) continue;

                        if (setting.SerializeAs != SettingsSerializeAs.String)
                        {
                            Log(
                                EventLogEntryType.Warning,
                                "Property {0}.{1} cannot be saved because it serializes as {2}",
                                groupName,
                                setting.Name,
                                setting.SerializeAs
                            );

                            continue;
                        }

                        var type = (from p in collection.OfType<SettingsProperty>()
                                    where p.Name == setting.Name
                                    select p.PropertyType
                                    ).SingleOrDefault();
                        if (type == null)
                        {
                            Log(
                                EventLogEntryType.Warning,
                                "Property {0}.{1} is not a valid entry",
                                groupName,
                                setting.Name
                            );

                            continue;
                        }

                        if ((from c in dataAccess.Settings
                             where c.GroupName == groupName && c.Name == setting.Name
                             select c).SingleOrDefault() == null)
                        {
                            var entity = new Setting
                            {
                                GroupName = groupName,
                                Name = setting.Name,
                                Type = type.ToString(),
                                Value = setting.Value.ValueXml.InnerText,
                                LastModified = GetTimestamp()
                            };
                            dataAccess.Settings.InsertOnSubmit(entity);
                        }
                    }
                }

                foreach (var obj in connectionStrings)
                {
                    if (!(obj is ConnectionStringSettings cs)) continue;
                    if (cs.Name.StartsWith(groupName))
                    {
                        var name = cs.Name.Substring(groupName.Length + 1);
                        var entity = (from c in dataAccess.ConnectionStrings
                                      where c.GroupName == groupName && c.Name == name
                                      select c).SingleOrDefault();
                        if (entity != null)
                        {
                            entity.Value = cs.ConnectionString;
                            entity.LastModified = GetTimestamp();

                            continue;
                        }

                        entity = new ConnectionString
                        {
                            GroupName = groupName,
                            Name = name,
                            Value = cs.ConnectionString,
                            LastModified = GetTimestamp()
                        };
                        dataAccess.ConnectionStrings.InsertOnSubmit(entity);
                    }
                }

                dataAccess.SubmitChanges();
            }
        }

        internal static void Log(EventLogEntryType type, string format, params object[] args)
        {
            var message = string.Format(format, args);
            Console.WriteLine("EventLog - " + type.ToString() + " > " + message);
            EventLog.WriteEntry("Roblox.Configuration", message, type, 4983);
        }
    }
}
