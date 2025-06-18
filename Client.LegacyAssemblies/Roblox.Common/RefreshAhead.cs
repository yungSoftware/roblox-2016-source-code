using System;
using System.Threading;
using Microsoft.Ccr.Core;

namespace Roblox.Common
{
    public class RefreshAhead<T> : IDisposable
    {
        private DateTime _LastRefresh = DateTime.MinValue;
        private readonly Timer _RefreshTimer = null;
        private T _Value = default(T);

        public TimeSpan IntervalSinceRefresh
        {
            get { return DateTime.Now.Subtract(_LastRefresh); }
        }
        public T Value
        {
            get { return _Value; }
        }

        private RefreshAhead(T initialValue, TimeSpan refreshInterval, Func<T> refreshDelegate)
        {
            int refreshIntervalInMilliseconds = (int)refreshInterval.TotalMilliseconds;

            _Value = initialValue;
            _LastRefresh = DateTime.Now;

            _RefreshTimer = new Timer(
                (stateInfo) => Refresh(refreshDelegate),
                null,
                refreshIntervalInMilliseconds,
                refreshIntervalInMilliseconds
            );
        }
        private RefreshAhead(T initialValue, TimeSpan refreshInterval, Action<PortSet<T, Exception>> refreshDelegate)
        {
            int refreshIntervalInMilliseconds = (int)refreshInterval.TotalMilliseconds;

            _Value = initialValue;
            _LastRefresh = DateTime.Now;

            _RefreshTimer = new Timer(
                (stateInfo) => Refresh(refreshDelegate),
                null,
                refreshIntervalInMilliseconds,
                refreshIntervalInMilliseconds
            );
        }

        public RefreshAhead(TimeSpan refreshInterval, Func<T> refreshDelegate)
        {
            int refreshIntervalInMilliseconds = (int)refreshInterval.TotalMilliseconds;

            _RefreshTimer = new Timer(
                (stateInfo) => Refresh(refreshDelegate),
                null,
                refreshIntervalInMilliseconds,
                refreshIntervalInMilliseconds
            );
        }

        private void Refresh(Func<T> refreshDelegate)
        {
            try
            {
                _Value = refreshDelegate();
                _LastRefresh = DateTime.Now;
            }
            catch (ThreadAbortException)
            {
                throw;
            }
            catch (Exception ex)
            {
                ExceptionHandler.LogException(ex);
            }
        }
        private void Refresh(Action<PortSet<T, Exception>> refreshDelegate)
        {
            try
            {
                var valueResult = new PortSet<T, Exception>();
                refreshDelegate(valueResult);
                CcrService.Singleton.Choice(
                    valueResult,
                    (value) =>
                    {
                        _Value = value;
                        _LastRefresh = DateTime.Now;
                    }
                );
            }
            catch (ThreadAbortException)
            {
                throw;
            }
            catch (Exception ex)
            {
                ExceptionHandler.LogException(ex);
            }
        }

        public static RefreshAhead<T> ConstructAndPopulate(TimeSpan refreshInterval, Func<T> refreshDelegate)
        {
            T value = refreshDelegate();
            var refreshAhead = new RefreshAhead<T>(value, refreshInterval, refreshDelegate);
            return refreshAhead;
        }
        public static void ConstructAndPopulate(TimeSpan refreshInterval, Action<PortSet<T, Exception>> refreshDelegate, PortSet<RefreshAhead<T>, Exception> result)
        {
            var valueResult = new PortSet<T, Exception>();
            refreshDelegate(valueResult);
            CcrService.Singleton.Choice<T, Exception>(
                valueResult,
                (value) =>
                {
                    var refreshAhead = new RefreshAhead<T>(value, refreshInterval, refreshDelegate);
                    result.Post(refreshAhead);
                },
                (ex) => result.Post(ex)
            );
        }

        #region IDisposable Members

        public void Dispose()
        {
            if (_RefreshTimer != null)
                _RefreshTimer.Dispose();
        }

        #endregion
    }
}