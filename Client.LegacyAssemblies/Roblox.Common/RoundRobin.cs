using System.Collections.Generic;
using System.Linq;
using System.Threading;

namespace Roblox.Common
{
    public class RoundRobin<T>
    {
        private readonly T[] _Candidates;
        private int _CurrentIndex = 0;

        public RoundRobin(IEnumerable<T> elements)
        {
            _Candidates = elements.ToArray();
        }

        public T Next()
        {
            var index = Interlocked.Increment(ref _CurrentIndex);
            if(index >= _Candidates.Length)
            {
                _CurrentIndex = 0;  // always safe to set this to 0
                return _Candidates[0];
            }
            else
            {
                return _Candidates[index];
            }
        }
    }
}
