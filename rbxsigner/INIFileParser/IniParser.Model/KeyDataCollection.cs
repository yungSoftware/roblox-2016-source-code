using System;
using System.Collections;
using System.Collections.Generic;

namespace IniParser.Model;

/// <summary>
///     Represents a collection of Keydata.
/// </summary>
public class KeyDataCollection : ICloneable, IEnumerable<KeyData>, IEnumerable
{
	private IEqualityComparer<string> _searchComparer;

	/// <summary>
	/// Collection of KeyData for a given section
	/// </summary>
	private readonly Dictionary<string, KeyData> _keyData;

	/// <summary>
	///     Gets or sets the value of a concrete key.
	/// </summary>
	/// <remarks>
	///     If we try to assign the value of a key which doesn't exists,
	///     a new key is added with the name and the value is assigned to it.
	/// </remarks>
	/// <param name="keyName">
	///     Name of the key
	/// </param>
	/// <returns>
	///     The string with key's value or null if the key was not found.
	/// </returns>
	public string this[string keyName]
	{
		get
		{
			if (_keyData.ContainsKey(keyName))
			{
				return _keyData[keyName].Value;
			}
			return null;
		}
		set
		{
			if (!_keyData.ContainsKey(keyName))
			{
				AddKey(keyName);
			}
			_keyData[keyName].Value = value;
		}
	}

	/// <summary>
	///     Return the number of keys in the collection
	/// </summary>
	public int Count => _keyData.Count;

	/// <summary>
	///     Initializes a new instance of the <see cref="T:IniParser.Model.KeyDataCollection" /> class.
	/// </summary>
	public KeyDataCollection()
		: this(EqualityComparer<string>.Default)
	{
	}

	/// <summary>
	///     Initializes a new instance of the <see cref="T:IniParser.Model.KeyDataCollection" /> class with a given
	///     search comparer
	/// </summary>
	/// <param name="searchComparer">
	///     Search comparer used to find the key by name in the collection
	/// </param>
	public KeyDataCollection(IEqualityComparer<string> searchComparer)
	{
		_searchComparer = searchComparer;
		_keyData = new Dictionary<string, KeyData>(_searchComparer);
	}

	/// <summary>
	///     Initializes a new instance of the <see cref="T:IniParser.Model.KeyDataCollection" /> class
	///     from a previous instance of <see cref="T:IniParser.Model.KeyDataCollection" />.
	/// </summary>
	/// <remarks>
	///     Data from the original KeyDataCollection instance is deeply copied
	/// </remarks>
	/// <param name="ori">
	///     The instance of the <see cref="T:IniParser.Model.KeyDataCollection" /> class 
	///     used to create the new instance.
	/// </param>
	public KeyDataCollection(KeyDataCollection ori, IEqualityComparer<string> searchComparer)
		: this(searchComparer)
	{
		foreach (KeyData item in ori)
		{
			if (_keyData.ContainsKey(item.KeyName))
			{
				_keyData[item.KeyName] = (KeyData)item.Clone();
			}
			else
			{
				_keyData.Add(item.KeyName, (KeyData)item.Clone());
			}
		}
	}

	public bool AddKey(string keyName)
	{
		if (!_keyData.ContainsKey(keyName))
		{
			_keyData.Add(keyName, new KeyData(keyName));
			return true;
		}
		return false;
	}

	[Obsolete("Pottentially buggy method! Use AddKey(KeyData keyData) instead (See comments in code for an explanation of the bug)")]
	public bool AddKey(string keyName, KeyData keyData)
	{
		if (AddKey(keyName))
		{
			_keyData[keyName] = keyData;
			return true;
		}
		return false;
	}

	/// <summary>
	///     Adds a new key to the collection
	/// </summary>
	/// <param name="keyData">
	///     KeyData instance.
	/// </param>
	/// <returns>
	///     <c>true</c> if the key was added  <c>false</c> if a key with the same name already exist 
	///     in the collection
	/// </returns>
	public bool AddKey(KeyData keyData)
	{
		if (AddKey(keyData.KeyName))
		{
			_keyData[keyData.KeyName] = keyData;
			return true;
		}
		return false;
	}

	/// <summary>
	///     Adds a new key with the specified name and value to the collection
	/// </summary>
	/// <param name="keyName">
	///     Name of the new key to be added.
	/// </param>
	/// <param name="keyValue">
	///     Value associated to the key.
	/// </param>
	/// <returns>
	///     <c>true</c> if the key was added  <c>false</c> if a key with the same name already exist 
	///     in the collection.
	/// </returns>
	public bool AddKey(string keyName, string keyValue)
	{
		if (AddKey(keyName))
		{
			_keyData[keyName].Value = keyValue;
			return true;
		}
		return false;
	}

	/// <summary>
	///     Clears all comments of this section
	/// </summary>
	public void ClearComments()
	{
		using IEnumerator<KeyData> enumerator = GetEnumerator();
		while (enumerator.MoveNext())
		{
			enumerator.Current.Comments.Clear();
		}
	}

	/// <summary>
	/// Gets if a specifyed key name exists in the collection.
	/// </summary>
	/// <param name="keyName">Key name to search</param>
	/// <returns><c>true</c> if a key with the specified name exists in the collectoin
	/// <c>false</c> otherwise</returns>
	public bool ContainsKey(string keyName)
	{
		return _keyData.ContainsKey(keyName);
	}

	/// <summary>
	/// Retrieves the data for a specified key given its name
	/// </summary>
	/// <param name="keyName">Name of the key to retrieve.</param>
	/// <returns>
	/// A <see cref="T:IniParser.Model.KeyData" /> instance holding
	/// the key information or <c>null</c> if the key wasn't found.
	/// </returns>
	public KeyData GetKeyData(string keyName)
	{
		if (_keyData.ContainsKey(keyName))
		{
			return _keyData[keyName];
		}
		return null;
	}

	public void Merge(KeyDataCollection keyDataToMerge)
	{
		foreach (KeyData item in keyDataToMerge)
		{
			AddKey(item.KeyName);
			GetKeyData(item.KeyName).Comments.AddRange(item.Comments);
			this[item.KeyName] = item.Value;
		}
	}

	/// <summary>
	/// 	Deletes all keys in this collection.
	/// </summary>
	public void RemoveAllKeys()
	{
		_keyData.Clear();
	}

	/// <summary>
	/// Deletes a previously existing key, including its associated data.
	/// </summary>
	/// <param name="keyName">The key to be removed.</param>
	/// <returns>
	/// <c>true</c> if a key with the specified name was removed 
	/// <c>false</c> otherwise.
	/// </returns>
	public bool RemoveKey(string keyName)
	{
		return _keyData.Remove(keyName);
	}

	/// <summary>
	/// Sets the key data associated to a specified key.
	/// </summary>
	/// <param name="data">The new <see cref="T:IniParser.Model.KeyData" /> for the key.</param>
	public void SetKeyData(KeyData data)
	{
		if (data != null)
		{
			if (_keyData.ContainsKey(data.KeyName))
			{
				RemoveKey(data.KeyName);
			}
			AddKey(data);
		}
	}

	/// <summary>
	/// Allows iteration througt the collection.
	/// </summary>
	/// <returns>A strong-typed IEnumerator </returns>
	public IEnumerator<KeyData> GetEnumerator()
	{
		foreach (string key in _keyData.Keys)
		{
			yield return _keyData[key];
		}
	}

	/// <summary>
	/// Implementation needed
	/// </summary>
	/// <returns>A weak-typed IEnumerator.</returns>
	IEnumerator IEnumerable.GetEnumerator()
	{
		return _keyData.GetEnumerator();
	}

	/// <summary>
	/// Creates a new object that is a copy of the current instance.
	/// </summary>
	/// <returns>
	/// A new object that is a copy of this instance.
	/// </returns>
	public object Clone()
	{
		return new KeyDataCollection(this, _searchComparer);
	}

	internal KeyData GetLast()
	{
		KeyData result = null;
		if (_keyData.Keys.Count <= 0)
		{
			return result;
		}
		foreach (string key in _keyData.Keys)
		{
			result = _keyData[key];
		}
		return result;
	}
}
