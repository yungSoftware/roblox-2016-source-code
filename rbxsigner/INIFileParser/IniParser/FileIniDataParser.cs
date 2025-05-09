using System;
using System.IO;
using System.Text;
using IniParser.Exceptions;
using IniParser.Model;
using IniParser.Parser;

namespace IniParser;

/// <summary>
///     Represents an INI data parser for files.
/// </summary>
public class FileIniDataParser : StreamIniDataParser
{
	/// <summary>
	///     Ctor
	/// </summary>
	public FileIniDataParser()
	{
	}

	/// <summary>
	///     Ctor
	/// </summary>
	/// <param name="parser"></param>
	public FileIniDataParser(IniDataParser parser)
		: base(parser)
	{
		base.Parser = parser;
	}

	[Obsolete("Please use ReadFile method instead of this one as is more semantically accurate")]
	public IniData LoadFile(string filePath)
	{
		return ReadFile(filePath);
	}

	[Obsolete("Please use ReadFile method instead of this one as is more semantically accurate")]
	public IniData LoadFile(string filePath, Encoding fileEncoding)
	{
		return ReadFile(filePath, fileEncoding);
	}

	/// <summary>
	///     Implements reading ini data from a file.
	/// </summary>
	/// <remarks>
	///     Uses <see cref="P:System.Text.Encoding.Default" /> codification for the file.
	/// </remarks>
	/// <param name="filePath">
	///     Path to the file
	/// </param>
	public IniData ReadFile(string filePath)
	{
		return ReadFile(filePath, Encoding.ASCII);
	}

	/// <summary>
	///     Implements reading ini data from a file.
	/// </summary>
	/// <param name="filePath">
	///     Path to the file
	/// </param>
	/// <param name="fileEncoding">
	///     File's encoding.
	/// </param>
	public IniData ReadFile(string filePath, Encoding fileEncoding)
	{
		if (filePath == string.Empty)
		{
			throw new ArgumentException("Bad filename.");
		}
		try
		{
			using FileStream stream = File.Open(filePath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
			using StreamReader reader = new StreamReader(stream, fileEncoding);
			return ReadData(reader);
		}
		catch (IOException innerException)
		{
			throw new ParsingException($"Could not parse file {filePath}", innerException);
		}
	}

	/// <summary>
	///     Saves INI data to a file.
	/// </summary>
	/// <remarks>
	///     Creats an ASCII encoded file by default.
	/// </remarks>
	/// <param name="filePath">
	///     Path to the file.
	/// </param>
	/// <param name="parsedData">
	///     IniData to be saved as an INI file.
	/// </param>
	[Obsolete("Please use WriteFile method instead of this one as is more semantically accurate")]
	public void SaveFile(string filePath, IniData parsedData)
	{
		WriteFile(filePath, parsedData, Encoding.UTF8);
	}

	/// <summary>
	///     Writes INI data to a text file.
	/// </summary>
	/// <param name="filePath">
	///     Path to the file.
	/// </param>
	/// <param name="parsedData">
	///     IniData to be saved as an INI file.
	/// </param>
	/// <param name="fileEncoding">
	///     Specifies the encoding used to create the file.
	/// </param>
	public void WriteFile(string filePath, IniData parsedData, Encoding fileEncoding = null)
	{
		if (fileEncoding == null)
		{
			fileEncoding = Encoding.UTF8;
		}
		if (string.IsNullOrEmpty(filePath))
		{
			throw new ArgumentException("Bad filename.");
		}
		if (parsedData == null)
		{
			throw new ArgumentNullException("parsedData");
		}
		using FileStream stream = File.Open(filePath, FileMode.Create, FileAccess.Write);
		using StreamWriter writer = new StreamWriter(stream, fileEncoding);
		WriteData(writer, parsedData);
	}
}
