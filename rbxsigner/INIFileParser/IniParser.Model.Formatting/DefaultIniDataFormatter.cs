using System;
using System.Collections.Generic;
using System.Text;
using IniParser.Model.Configuration;

namespace IniParser.Model.Formatting;

public class DefaultIniDataFormatter : IIniDataFormatter
{
	private IniParserConfiguration _configuration;

	/// <summary>
	///     Configuration used to write an ini file with the proper
	///     delimiter characters and data.
	/// </summary>
	/// <remarks>
	///     If the <see cref="T:IniParser.Model.IniData" /> instance was created by a parser,
	///     this instance is a copy of the <see cref="T:IniParser.Model.Configuration.IniParserConfiguration" /> used
	///     by the parser (i.e. different objects instances)
	///     If this instance is created programatically without using a parser, this
	///     property returns an instance of <see cref="T:IniParser.Model.Configuration.IniParserConfiguration" />
	/// </remarks>
	public IniParserConfiguration Configuration
	{
		get
		{
			return _configuration;
		}
		set
		{
			_configuration = value.Clone();
		}
	}

	public DefaultIniDataFormatter()
		: this(new IniParserConfiguration())
	{
	}

	public DefaultIniDataFormatter(IniParserConfiguration configuration)
	{
		if (configuration == null)
		{
			throw new ArgumentNullException("configuration");
		}
		Configuration = configuration;
	}

	public virtual string IniDataToString(IniData iniData)
	{
		StringBuilder stringBuilder = new StringBuilder();
		if (Configuration.AllowKeysWithoutSection)
		{
			WriteKeyValueData(iniData.Global, stringBuilder);
		}
		foreach (SectionData section in iniData.Sections)
		{
			WriteSection(section, stringBuilder);
		}
		return stringBuilder.ToString();
	}

	private void WriteSection(SectionData section, StringBuilder sb)
	{
		if (sb.Length > 0)
		{
			sb.Append(Configuration.NewLineStr);
		}
		WriteComments(section.LeadingComments, sb);
		sb.Append($"{Configuration.SectionStartChar}{section.SectionName}{Configuration.SectionEndChar}{Configuration.NewLineStr}");
		WriteKeyValueData(section.Keys, sb);
		WriteComments(section.TrailingComments, sb);
	}

	private void WriteKeyValueData(KeyDataCollection keyDataCollection, StringBuilder sb)
	{
		foreach (KeyData item in keyDataCollection)
		{
			if (item.Comments.Count > 0)
			{
				sb.Append(Configuration.NewLineStr);
			}
			WriteComments(item.Comments, sb);
			sb.Append(string.Format("{0}{3}{1}{3}{2}{4}", item.KeyName, Configuration.KeyValueAssigmentChar, item.Value, Configuration.AssigmentSpacer, Configuration.NewLineStr));
		}
	}

	private void WriteComments(List<string> comments, StringBuilder sb)
	{
		foreach (string comment in comments)
		{
			sb.Append($"{Configuration.CommentString}{comment}{Configuration.NewLineStr}");
		}
	}
}
