namespace Roblox.Common.Properties
{
    [System.Configuration.SettingsProvider(typeof(Roblox.Configuration.Provider))]
    public sealed partial class Settings
    {
        protected override void OnSettingsLoaded(object sender, System.Configuration.SettingsLoadedEventArgs e)
        {
            base.OnSettingsLoaded(sender, e);
            global::Roblox.Configuration.Provider.RegisterSettings(e, this);
        }
    }
}
