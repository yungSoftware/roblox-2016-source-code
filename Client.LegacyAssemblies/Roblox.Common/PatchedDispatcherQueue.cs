using System.Reflection;
using Microsoft.Ccr.Core;

namespace Roblox
{
    /// <summary>
    /// http://social.msdn.microsoft.com/Forums/en-US/roboticsccr/thread/75f441b6-9eb0-4ce9-bbd2-49505ccb4152/
    /// </summary>
    public class PatchedDispatcherQueue : DispatcherQueue
    {
        private static FieldInfo _Next = typeof(TaskCommon).GetField("_next", BindingFlags.Instance | BindingFlags.NonPublic);
        private static FieldInfo _Previous = typeof(TaskCommon).GetField("_previous", BindingFlags.Instance | BindingFlags.NonPublic);

        public PatchedDispatcherQueue(string name, Dispatcher dispatcher)
            : base(name, dispatcher)
        {
        }

        public override bool TryDequeue(out ITask task)
        {
            bool result = base.TryDequeue(out task);

            if (result)
            {
                var taskCommon = task as TaskCommon;
                if (taskCommon != null)
                {
                    _Next.SetValue(taskCommon, null);
                    _Previous.SetValue(taskCommon, null);
                }
            }

            return result;
        }
    }
}
