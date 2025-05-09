namespace IniParser.Model.Configuration;

public class ConcatenateDuplicatedKeysIniParserConfiguration : IniParserConfiguration
{
	public new bool AllowDuplicateKeys => true;

	public string ConcatenateSeparator { get; set; }

	public ConcatenateDuplicatedKeysIniParserConfiguration()
	{
		ConcatenateSeparator = ";";
	}

	public ConcatenateDuplicatedKeysIniParserConfiguration(ConcatenateDuplicatedKeysIniParserConfiguration ori)
		: base(ori)
	{
		ConcatenateSeparator = ori.ConcatenateSeparator;
	}
}
