using System;

namespace Roblox
{
    /// <summary>
    /// Guarantees a non-null instance of type T
    /// 
    /// http://docs.google.com/a/roblox.com/Doc?docid=0ATG2rw7nIIsFZGY4ZHcy725MTBnZG5qcDdmbQ&hl=en
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public struct NonNullable<T> where T : class
    {
        private readonly T _t;

        internal NonNullable(T t)
        {
            _t = t;
        }

        public T Value
        {
            get
            {
                if (_t == null)
                    throw new NullReferenceException("Uninitialized NonNullable of type " + typeof(T).Name);
                return _t;
            }
        }

        public override int GetHashCode()
        {
            return Value.GetHashCode();
        }

        /// <summary>
        /// Returns the text representation of the value of the current System.Nullable<T> object.
        /// </summary>
        public override string ToString()
        {
            return Value.ToString();
        }

        public static implicit operator T(NonNullable<T> n)
        {
            return n.Value;
        }

        public override bool Equals(object other)
        {
            // http://msdn.microsoft.com/en-us/library/ms173147(VS.80).aspx
            if (other == null)
                return false;
            return _t == other;
        }

        public bool Equals(T other)
        {
            // http://msdn.microsoft.com/en-us/library/ms173147(VS.80).aspx
            if (other == null)
                return false;
            return this._t == other;
        }

        public bool Equals(NonNullable<T> other)
        {
            // http://msdn.microsoft.com/en-us/library/ms173147(VS.80).aspx
            // Strictly speaking, _t should never be null,
            // but we are not allowed to throw in an equal call.
            // Instead, we follow the rule to return false if the
            // value compared against is null
            if (other._t == null)
                return false;
            return this._t == other._t;
        }

        public static bool operator ==(NonNullable<T> a, NonNullable<T> b)
        {
            return a._t == b._t;
        }

        public static bool operator !=(NonNullable<T> a, NonNullable<T> b)
        {
            return a._t != b._t;
        }

        public static NonNullable<T> ToNonNull(T t)
        {
            if (t == null)
                throw new NullReferenceException("Incorrect usage of NonNullable of type " + typeof(T).Name + ". Caller must check for null before calling ToNonNull.");
            return new NonNullable<T>(t);
        }
    }

    public static class NonNullExtensions
    {
        /// <summary>
        /// Safely and efficiently promotes NonNullable types to base classes
        /// </summary>
        public static NonNullable<TBase> Convert<T, TBase>(this NonNullable<T> t)
            where T : class, TBase
            where TBase : class
        {
            return new NonNullable<TBase>(t.Value);
        }

    }
}