using System;
using System.Collections.Generic;

namespace Roblox.Common
{
    public static class Converters
    {
        public static string ConvertIntegersToCSV(int[] integers)
            => string.Join(",", Array.ConvertAll(integers, ConvertIntegerToString));
        private static string ConvertIntegerToString(int integer) => integer.ToString();
        public static int[] ConvertCSVToIntegers(string[] strings) 
            => Array.ConvertAll(strings, ConvertStringToInteger);
        private static int ConvertStringToInteger(string s) => int.Parse(s);
        public static List<T> EnumToList<T>()
        {
            var typeFromHandle = typeof(T);
            if (typeFromHandle.BaseType != typeof(Enum)) 
				throw new ArgumentException("T must be of type System.Enum");

            var values = Enum.GetValues(typeFromHandle);
            var outList = new List<T>(values.Length);
            foreach (var value in values)
                outList.Add((T)Enum.Parse(typeFromHandle, ((int)value).ToString()));
            return outList;
        }
    }
}
