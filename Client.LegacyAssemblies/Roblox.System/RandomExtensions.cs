using System;
using System.Security.Cryptography;

namespace Roblox
{
    /// <summary>
    /// Inspired by: http://blogs.msdn.com/pfxteam/archive/2009/02/19/9434171.aspx
    /// </summary>
    public static class SeededRandom
    {
        private static readonly Random Seeder = new Random();
        private static volatile int _seed = Seeder.Next();

        [ThreadStatic]
        private static Random _local;
        private static readonly Random Global = new Random();
        private static readonly RNGCryptoServiceProvider Crypto = new RNGCryptoServiceProvider();

        // TODO: How/When to dispose?
        private static readonly System.Threading.Timer Timer = new System.Threading.Timer(
            (o) => _seed = Seeder.Next(), null, 100, 100);

        /// <summary>
        /// Creates a seeded Random number generator.
        /// Avoids a clump of equally-seeded Random objects being created at the same time.
        /// Use this if you spawn multiple threads at the same time and each creates a Random.
        /// </summary>
        public static Random Create()
        {
            // We simply increase the seed by 1 every time.
            // The timer will change the seed to something more interesting in the future
            return new Random(System.Threading.Interlocked.Increment(ref _seed));
        }


        /// <summary>
        /// Creates and re-uses a single Random number object per thread.
        /// Best used in situations where you re-use threads a lot.
        /// </summary>
        /// <returns></returns>
        public static Random ThreadStaticCreate()
        {
            Random inst = _local;
            if (inst == null)
            {
                int seed;
                lock (Global)
                    seed = Global.Next();
                _local = inst = new Random(seed);
            }
            return inst;
        }


        /// <summary>
        /// An alternate approach to SeededRandom that uses Crypto and no lock
        /// TBD which one is faster
        /// </summary>
        public static Random CryptoThreadStaticCreate()
        {
            Random inst = _local;
            if (inst == null)
            {
                var buffer = new byte[4];
                Crypto.GetBytes(buffer);
                _local = inst = new Random(BitConverter.ToInt32(buffer, 0));
            }
            return inst;
        }
    }
}