using System.Configuration;

namespace Roblox.WebsiteSettings.Properties
{
    [SettingsProvider(typeof(Roblox.Configuration.Provider))]
    public sealed partial class Settings
    {
        protected override void OnSettingsLoaded(object sender, SettingsLoadedEventArgs e)
        {
            base.OnSettingsLoaded(sender, e);
            Roblox.Configuration.Provider.RegisterSettings(e, this);
        }
    }
}
