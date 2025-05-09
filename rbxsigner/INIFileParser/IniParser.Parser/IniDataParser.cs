using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using IniParser.Exceptions;
using IniParser.Model;
using IniParser.Model.Configuration;

namespace IniParser.Parser;

/// <summary>
/// 	Responsible for parsing an string from an ini file, and creating
/// 	an <see cref="T:IniParser.Model.IniData" /> structure.
/// </summary>
public class IniDataParser
{
	private List<Exception> _errorExceptions;

	/// <summary>
	///     Temp list of comments
	/// </summary>
	private readonly List<string> _currentCommentListTemp = new List<string>();

	/// <summary>
	///     Tmp var with the name of the seccion which is being process
	/// </summary>
	private string _currentSectionNameTemp;

	/// <summary>
	///     Configuration that defines the behaviour and constraints
	///     that the parser must follow.
	/// </summary>
	public virtual IniParserConfiguration Configuration { get; protected set; }

	/// <summary>
	/// True is the parsing operation encounter any problem
	/// </summary>
	public bool HasError => _errorExceptions.Count > 0;

	/// <summary>
	/// Returns the list of errors found while parsing the ini file.
	/// </summary>
	/// <remarks>
	/// If the configuration option ThrowExceptionOnError is false it can contain one element
	/// for each problem found while parsing; otherwise it will only contain the very same 
	/// exception that was raised.
	/// </remarks>
	public ReadOnlyCollection<Exception> Errors => _errorExceptions.AsReadOnly();

	/// <summary>
	///     Ctor
	/// </summary>
	/// <remarks>
	///     The parser uses a <see cref="T:IniParser.Model.Configuration.IniParserConfiguration" /> by default
	/// </remarks>
	public IniDataParser()
		: this(new IniParserConfiguration())
	{
	}

	/// <summary>
	///     Ctor
	/// </summary>
	/// <param name="parserConfiguration">
	///     Parser's <see cref="T:IniParser.Model.Configuration.IniParserConfiguration" /> instance.
	/// </param>
	public IniDataParser(IniParserConfiguration parserConfiguration)
	{
		if (parserConfiguration == null)
		{
			throw new ArgumentNullException("parserConfiguration");
		}
		Configuration = parserConfiguration;
		_errorExceptions = new List<Exception>();
	}

	/// <summary>
	///     Parses a string containing valid ini data
	/// </summary>
	/// <param name="iniDataString">
	///     String with data
	/// </param>
	/// <returns>
	///     An <see cref="T:IniParser.Model.IniData" /> instance with the data contained in
	///     the <paramref name="iniDataString" /> correctly parsed an structured.
	/// </returns>
	/// <exception cref="T:IniParser.Exceptions.ParsingException">
	///     Thrown if the data could not be parsed
	/// </exception>
	public IniData Parse(string iniDataString)
	{
		IniData iniData = (Configuration.CaseInsensitive ? new IniDataCaseInsensitive() : new IniData());
		iniData.Configuration = Configuration.Clone();
		if (string.IsNullOrEmpty(iniDataString))
		{
			return iniData;
		}
		_errorExceptions.Clear();
		_currentCommentListTemp.Clear();
		_currentSectionNameTemp = null;
		try
		{
			string[] array = iniDataString.Split(new string[2] { "\n", "\r\n" }, StringSplitOptions.None);
			for (int i = 0; i < array.Length; i++)
			{
				string text = array[i];
				if (text.Trim() == string.Empty)
				{
					continue;
				}
				try
				{
					ProcessLine(text, iniData);
				}
				catch (Exception ex)
				{
					ParsingException ex2 = new ParsingException(ex.Message, i + 1, text, ex);
					if (Configuration.ThrowExceptionsOnError)
					{
						throw ex2;
					}
					_errorExceptions.Add(ex2);
				}
			}
			if (_currentCommentListTemp.Count > 0)
			{
				if (iniData.Sections.Count > 0)
				{
					iniData.Sections.GetSectionData(_currentSectionNameTemp).TrailingComments.AddRange(_currentCommentListTemp);
				}
				else if (iniData.Global.Count > 0)
				{
					iniData.Global.GetLast().Comments.AddRange(_currentCommentListTemp);
				}
				_currentCommentListTemp.Clear();
			}
		}
		catch (Exception item)
		{
			_errorExceptions.Add(item);
			if (Configuration.ThrowExceptionsOnError)
			{
				throw;
			}
		}
		if (HasError)
		{
			return null;
		}
		return (IniData)iniData.Clone();
	}

	/// <summary>
	///     Checks if a given string contains a comment.
	/// </summary>
	/// <param name="line">
	///     String with a line to be checked.
	/// </param>
	/// <returns>
	///     <c>true</c> if any substring from s is a comment, <c>false</c> otherwise.
	/// </returns>
	protected virtual bool LineContainsAComment(string line)
	{
		if (!string.IsNullOrEmpty(line))
		{
			return Configuration.CommentRegex.Match(line).Success;
		}
		return false;
	}

	/// <summary>
	///     Checks if a given string represents a section delimiter.
	/// </summary>
	/// <param name="line">
	///     The string to be checked.
	/// </param>
	/// <returns>
	///     <c>true</c> if the string represents a section, <c>false</c> otherwise.
	/// </returns>
	protected virtual bool LineMatchesASection(string line)
	{
		if (!string.IsNullOrEmpty(line))
		{
			return Configuration.SectionRegex.Match(line).Success;
		}
		return false;
	}

	/// <summary>
	///     Checks if a given string represents a key / value pair.
	/// </summary>
	/// <param name="line">
	///     The string to be checked.
	/// </param>
	/// <returns>
	///     <c>true</c> if the string represents a key / value pair, <c>false</c> otherwise.
	/// </returns>
	protected virtual bool LineMatchesAKeyValuePair(string line)
	{
		if (!string.IsNullOrEmpty(line))
		{
			return line.Contains(Configuration.KeyValueAssigmentChar.ToString());
		}
		return false;
	}

	/// <summary>
	///     Removes a comment from a string if exist, and returns the string without
	///     the comment substring.
	/// </summary>
	/// <param name="line">
	///     The string we want to remove the comments from.
	/// </param>
	/// <returns>
	///     The string s without comments.
	/// </returns>
	protected virtual string ExtractComment(string line)
	{
		string text = Configuration.CommentRegex.Match(line).Value.Trim();
		_currentCommentListTemp.Add(text.Substring(1, text.Length - 1));
		return line.Replace(text, "").Trim();
	}

	/// <summary>
	///     Processes one line and parses the data found in that line
	///     (section or key/value pair who may or may not have comments)
	/// </summary>
	/// <param name="currentLine">The string with the line to process</param>
	protected virtual void ProcessLine(string currentLine, IniData currentIniData)
	{
		currentLine = currentLine.Trim();
		if (LineContainsAComment(currentLine))
		{
			currentLine = ExtractComment(currentLine);
		}
		if (!(currentLine == string.Empty))
		{
			if (LineMatchesASection(currentLine))
			{
				ProcessSection(currentLine, currentIniData);
			}
			else if (LineMatchesAKeyValuePair(currentLine))
			{
				ProcessKeyValuePair(currentLine, currentIniData);
			}
			else if (!Configuration.SkipInvalidLines)
			{
				throw new ParsingException("Unknown file format. Couldn't parse the line: '" + currentLine + "'.");
			}
		}
	}

	/// <summary>
	///     Proccess a string which contains an ini section.
	/// </summary>
	/// <param name="line">
	///     The string to be processed
	/// </param>
	protected virtual void ProcessSection(string line, IniData currentIniData)
	{
		string text = Configuration.SectionRegex.Match(line).Value.Trim();
		text = text.Substring(1, text.Length - 2).Trim();
		if (text == string.Empty)
		{
			throw new ParsingException("Section name is empty");
		}
		_currentSectionNameTemp = text;
		if (currentIniData.Sections.ContainsSection(text))
		{
			if (!Configuration.AllowDuplicateSections)
			{
				throw new ParsingException($"Duplicate section with name '{text}' on line '{line}'");
			}
		}
		else
		{
			currentIniData.Sections.AddSection(text);
			currentIniData.Sections.GetSectionData(text).LeadingComments = _currentCommentListTemp;
			_currentCommentListTemp.Clear();
		}
	}

	/// <summary>
	///     Processes a string containing an ini key/value pair.
	/// </summary>
	/// <param name="line">
	///     The string to be processed
	/// </param>
	protected virtual void ProcessKeyValuePair(string line, IniData currentIniData)
	{
		string text = ExtractKey(line);
		if (string.IsNullOrEmpty(text) && Configuration.SkipInvalidLines)
		{
			return;
		}
		string value = ExtractValue(line);
		if (string.IsNullOrEmpty(_currentSectionNameTemp))
		{
			if (!Configuration.AllowKeysWithoutSection)
			{
				throw new ParsingException("key value pairs must be enclosed in a section");
			}
			AddKeyToKeyValueCollection(text, value, currentIniData.Global, "global");
		}
		else
		{
			SectionData sectionData = currentIniData.Sections.GetSectionData(_currentSectionNameTemp);
			AddKeyToKeyValueCollection(text, value, sectionData.Keys, _currentSectionNameTemp);
		}
	}

	/// <summary>
	///     Extracts the key portion of a string containing a key/value pair..
	/// </summary>
	/// <param name="s">    
	///     The string to be processed, which contains a key/value pair
	/// </param>
	/// <returns>
	///     The name of the extracted key.
	/// </returns>
	protected virtual string ExtractKey(string s)
	{
		int length = s.IndexOf(Configuration.KeyValueAssigmentChar, 0);
		return s.Substring(0, length).Trim();
	}

	/// <summary>
	///     Extracts the value portion of a string containing a key/value pair..
	/// </summary>
	/// <param name="s">
	///     The string to be processed, which contains a key/value pair
	/// </param>
	/// <returns>
	///     The name of the extracted value.
	/// </returns>
	protected virtual string ExtractValue(string s)
	{
		int num = s.IndexOf(Configuration.KeyValueAssigmentChar, 0);
		return s.Substring(num + 1, s.Length - num - 1).Trim();
	}

	/// <summary>
	///     Abstract Method that decides what to do in case we are trying to add a duplicated key to a section
	/// </summary>
	protected virtual void HandleDuplicatedKeyInCollection(string key, string value, KeyDataCollection keyDataCollection, string sectionName)
	{
		if (!Configuration.AllowDuplicateKeys)
		{
			throw new ParsingException($"Duplicated key '{key}' found in section '{sectionName}");
		}
		if (Configuration.OverrideDuplicateKeys)
		{
			keyDataCollection[key] = value;
		}
	}

	/// <summary>
	///     Adds a key to a concrete <see cref="T:IniParser.Model.KeyDataCollection" /> instance, checking
	///     if duplicate keys are allowed in the configuration
	/// </summary>
	/// <param name="key">
	///     Key name
	/// </param>
	/// <param name="value">
	///     Key's value
	/// </param>
	/// <param name="keyDataCollection">
	///     <see cref="T:IniParser.Model.KeyData" /> collection where the key should be inserted
	/// </param>
	/// <param name="sectionName">
	///     Name of the section where the <see cref="T:IniParser.Model.KeyDataCollection" /> is contained. 
	///     Used only for logging purposes.
	/// </param>
	private void AddKeyToKeyValueCollection(string key, string value, KeyDataCollection keyDataCollection, string sectionName)
	{
		if (keyDataCollection.ContainsKey(key))
		{
			HandleDuplicatedKeyInCollection(key, value, keyDataCollection, sectionName);
		}
		else
		{
			keyDataCollection.AddKey(key, value);
		}
		keyDataCollection.GetKeyData(key).Comments = _currentCommentListTemp;
		_currentCommentListTemp.Clear();
	}
}
