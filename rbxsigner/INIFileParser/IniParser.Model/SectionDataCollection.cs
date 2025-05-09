using System;
using System.Collections;
using System.Collections.Generic;

namespace IniParser.Model;

/// <summary>
/// <para>Represents a collection of SectionData.</para>
/// </summary>
public class SectionDataCollection : ICloneable, IEnumerable<SectionData>, IEnumerable
{
	private IEqualityComparer<string> _searchComparer;

	/// <summary>
	/// Data associated to this section
	/// </summary>
	private readonly Dictionary<string, SectionData> _sectionData;

	/// <summary>
	/// Returns the number of SectionData elements in the collection
	/// </summary>
	public int Count => _sectionData.Count;

	/// <summary>
	/// Gets the key data associated to a specified section name.
	/// </summary>
	/// <value>An instance of as <see cref="T:IniParser.Model.KeyDataCollection" /> class 
	/// holding the key data from the current parsed INI data, or a <c>null</c>
	/// value if the section doesn't exist.</value>
	public KeyDataCollection this[string sectionName]
	{
		get
		{
			if (_sectionData.ContainsKey(sectionName))
			{
				return _sectionData[sectionName].Keys;
			}
			return null;
		}
	}

	/// <summary>
	/// Initializes a new instance of the <see cref="T:IniParser.Model.SectionDataCollection" /> class.
	/// </summary>
	public SectionDataCollection()
		: this(EqualityComparer<string>.Default)
	{
	}

	/// <summary>
	/// Initializes a new instance of the <see cref="T:IniParser.Model.SectionDataCollection" /> class.
	/// </summary>
	/// <param name="searchComparer">
	///     StringComparer used when accessing section names
	/// </param>
	public SectionDataCollection(IEqualityComparer<string> searchComparer)
	{
		_searchComparer = searchComparer;
		_sectionData = new Dictionary<string, SectionData>(_searchComparer);
	}

	/// <summary>
	/// Initializes a new instance of the <see cref="T:IniParser.Model.SectionDataCollection" /> class
	/// from a previous instance of <see cref="T:IniParser.Model.SectionDataCollection" />.
	/// </summary>
	/// <remarks>
	/// Data is deeply copied
	/// </remarks>
	/// <param name="ori">
	/// The instance of the <see cref="T:IniParser.Model.SectionDataCollection" /> class 
	/// used to create the new instance.</param>
	public SectionDataCollection(SectionDataCollection ori, IEqualityComparer<string> searchComparer)
	{
		_searchComparer = searchComparer ?? EqualityComparer<string>.Default;
		_sectionData = new Dictionary<string, SectionData>(_searchComparer);
		foreach (SectionData item in ori)
		{
			_sectionData.Add(item.SectionName, (SectionData)item.Clone());
		}
	}

	/// <summary>
	/// Creates a new section with empty data.
	/// </summary>
	/// <remarks>
	/// <para>If a section with the same name exists, this operation has no effect.</para>
	/// </remarks>
	/// <param name="keyName">Name of the section to be created</param>
	/// <return><c>true</c> if the a new section with the specified name was added,
	/// <c>false</c> otherwise</return>
	/// <exception cref="T:System.ArgumentException">If the section name is not valid.</exception>
	public bool AddSection(string keyName)
	{
		if (!ContainsSection(keyName))
		{
			_sectionData.Add(keyName, new SectionData(keyName, _searchComparer));
			return true;
		}
		return false;
	}

	/// <summary>
	///     Adds a new SectionData instance to the collection
	/// </summary>
	/// <param name="data">Data.</param>
	public void Add(SectionData data)
	{
		if (ContainsSection(data.SectionName))
		{
			SetSectionData(data.SectionName, new SectionData(data, _searchComparer));
		}
		else
		{
			_sectionData.Add(data.SectionName, new SectionData(data, _searchComparer));
		}
	}

	/// <summary>
	/// Removes all entries from this collection
	/// </summary>
	public void Clear()
	{
		_sectionData.Clear();
	}

	/// <summary>
	/// Gets if a section with a specified name exists in the collection.
	/// </summary>
	/// <param name="keyName">Name of the section to search</param>
	/// <returns>
	/// <c>true</c> if a section with the specified name exists in the
	///  collection <c>false</c> otherwise
	/// </returns>
	public bool ContainsSection(string keyName)
	{
		return _sectionData.ContainsKey(keyName);
	}

	/// <summary>
	/// Returns the section data from a specify section given its name.
	/// </summary>
	/// <param name="sectionName">Name of the section.</param>
	/// <returns>
	/// An instance of a <see cref="T:IniParser.Model.SectionData" /> class 
	/// holding the section data for the currently INI data
	/// </returns>
	public SectionData GetSectionData(string sectionName)
	{
		if (_sectionData.ContainsKey(sectionName))
		{
			return _sectionData[sectionName];
		}
		return null;
	}

	public void Merge(SectionDataCollection sectionsToMerge)
	{
		foreach (SectionData item in sectionsToMerge)
		{
			if (GetSectionData(item.SectionName) == null)
			{
				AddSection(item.SectionName);
			}
			this[item.SectionName].Merge(item.Keys);
		}
	}

	/// <summary>
	/// Sets the section data for given a section name.
	/// </summary>
	/// <param name="sectionName"></param>
	/// <param name="data">The new <see cref="T:IniParser.Model.SectionData" />instance.</param>
	public void SetSectionData(string sectionName, SectionData data)
	{
		if (data != null)
		{
			_sectionData[sectionName] = data;
		}
	}

	/// <summary>
	///
	/// </summary>
	/// <param name="keyName"></param>
	/// <return><c>true</c> if the section with the specified name was removed, 
	/// <c>false</c> otherwise</return>
	public bool RemoveSection(string keyName)
	{
		return _sectionData.Remove(keyName);
	}

	/// <summary>
	/// Returns an enumerator that iterates through the collection.
	/// </summary>
	/// <returns>
	/// A <see cref="T:System.Collections.Generic.IEnumerator`1" /> that can be used to iterate through the collection.
	/// </returns>
	public IEnumerator<SectionData> GetEnumerator()
	{
		foreach (string key in _sectionData.Keys)
		{
			yield return _sectionData[key];
		}
	}

	/// <summary>
	/// Returns an enumerator that iterates through a collection.
	/// </summary>
	/// <returns>
	/// An <see cref="T:System.Collections.IEnumerator" /> object that can be used to iterate through the collection.
	/// </returns>
	IEnumerator IEnumerable.GetEnumerator()
	{
		return GetEnumerator();
	}

	/// <summary>
	/// Creates a new object that is a copy of the current instance.
	/// </summary>
	/// <returns>
	/// A new object that is a copy of this instance.
	/// </returns>
	public object Clone()
	{
		return new SectionDataCollection(this, _searchComparer);
	}
}
