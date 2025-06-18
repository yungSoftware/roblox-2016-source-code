using System;
using System.IO;
using System.Xml;
using System.Text;
using System.Collections;
using System.Collections.Generic;

namespace Roblox.Grid.Arbiter.Common
{
	public class ArbiterStats : IEnumerable<ArbiterStats.Stat>, IEnumerable
	{
		IEnumerator IEnumerable.GetEnumerator()
		{
			foreach (var stat in stats)
				yield return stat;
		}
		IEnumerator<Stat> IEnumerable<Stat>.GetEnumerator()
		{
			foreach (var stat in stats)
				yield return stat;
		}

		public ArbiterStats()
		{
			stats = new List<Stat>();
		}
		public ArbiterStats(string source) 
			: this()
		{
			var xmlReader = XmlReader.Create(new StringReader(source));
			while (xmlReader.Read())
			{
				if (!(xmlReader.Name != "Stat"))
				{
					var stat = default(Stat);
					xmlReader.MoveToFirstAttribute();
					do
					{
						if (xmlReader.Name == "Name")
							stat.name = xmlReader.Value;
						else if (xmlReader.Name == "Value")
							stat.value = xmlReader.Value;
					}
					while (xmlReader.MoveToNextAttribute());
					if (stat.name != null && stat.value != null)
						stats.Add(stat);
				}
			}
		}

		public void AddStat(string name, string value)
		{
			stats.Add(new ArbiterStats.Stat(name, value));
		}

		public void AddStat(string name, int value)
		{
			stats.Add(new ArbiterStats.Stat(name, value.ToString()));
		}

		public void AddStat(string name, long value)
		{
			stats.Add(new ArbiterStats.Stat(name, value.ToString()));
		}

		public void AddStat(string name, double value)
		{
			stats.Add(new ArbiterStats.Stat(name, value.ToString()));
		}

		public void AddStat(string name, bool value)
		{
			stats.Add(new ArbiterStats.Stat(name, value.ToString()));
		}

		public string GetStat(string name)
		{
			foreach (var stat in this)
				if (stat.name == name)
					return stat.value;
            
			throw new Exception("Stat " + name + " is missing");
		}

		public int GetStatInt(string name)
		{
			var stat = GetStat(name);
			if (int.TryParse(stat, out var result))
				return result;
            
			Console.WriteLine("Stat " + name + " was malformed: " + stat);
			return 0;
		}

		public long GetStatLong(string name)
		{
			var stat = GetStat(name);
			if (long.TryParse(stat, out var result))
				return result;
            
			Console.WriteLine("Stat " + name + " was malformed: " + stat);
			return 0;
		}

		public double GetStatDouble(string name)
		{
			var stat = GetStat(name);
			if (double.TryParse(stat, out var result))
				return result;
            
			Console.WriteLine("Stat " + name + " was malformed: " + stat);
			return 0;
		}

		public override string ToString()
		{
			var stringBuilder = new StringBuilder();
			foreach (var stat in this)
				stringBuilder.Append(stat.name + ": " + stat.value + "\r\n");
            
			return stringBuilder.ToString();
		}

		public string ToXml()
		{
			var stringBuilder = new StringBuilder();
			var xmlWriter = XmlWriter.Create(stringBuilder);
			xmlWriter.WriteStartElement("Stats");
			foreach (var stat in this)
				WriteStat(xmlWriter, stat);
			xmlWriter.WriteEndElement();
			xmlWriter.Close();
			return stringBuilder.ToString();
		}

		protected static void WriteStat(XmlWriter writer, ArbiterStats.Stat stat)
		{
			writer.WriteStartElement("Stat");
			writer.WriteStartAttribute("Name");
			writer.WriteString(stat.name);
			writer.WriteEndAttribute();
			writer.WriteStartAttribute("Value");
			writer.WriteString(stat.value);
			writer.WriteEndAttribute();
			writer.WriteEndElement();
		}

		private List<Stat> stats;

		public struct Stat
		{
			internal Stat(string name, string value)
			{
				this.name = name;
				this.value = value;
			}

			public string name;

			public string value;
		}
	}
}
