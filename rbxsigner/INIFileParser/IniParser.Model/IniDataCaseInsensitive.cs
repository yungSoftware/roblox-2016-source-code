using System;

namespace IniParser.Model;

/// <summary>
///     Represents all data from an INI file exactly as the <see cref="T:IniParser.Model.IniData" />
///     class, but searching for sections and keys names is done with
///     a case insensitive search.
/// </summary>
public class IniDataCaseInsensitive : IniData
{
	/// <summary>
	///     Initializes an empty IniData instance.
	/// </summary>
	public IniDataCaseInsensitive()
		: base(new SectionDataCollection(StringComparer.OrdinalIgnoreCase))
	{
		base.Global = new KeyDataCollection(StringComparer.OrdinalIgnoreCase);
	}

	/// <summary>
	///     Initializes a new IniData instance using a previous
	///     <see cref="T:IniParser.Model.SectionDataCollection" />.
	/// </summary>
	/// <param name="sdc">
	///     <see cref="T:IniParser.Model.SectionDataCollection" /> object containing the
	///     data with the sections of the file
	/// </param>
	public IniDataCaseInsensitive(SectionDataCollection sdc)
		: base(new SectionDataCollection(sdc, StringComparer.OrdinalIgnoreCase))
	{
		base.Global = new KeyDataCollection(StringComparer.OrdinalIgnoreCase);
	}

	/// <summary>
	/// Copies an instance of the <see cref="T:IniParser.Model.IniDataCaseInsensitive" /> class
	/// </summary>
	/// <param name="ori">Original </param>
	public IniDataCaseInsensitive(IniData ori)
		: this(new SectionDataCollection(ori.Sections, StringComparer.OrdinalIgnoreCase))
	{
		base.Global = (KeyDataCollection)ori.Global.Clone();
		base.Configuration = ori.Configuration.Clone();
	}
}
