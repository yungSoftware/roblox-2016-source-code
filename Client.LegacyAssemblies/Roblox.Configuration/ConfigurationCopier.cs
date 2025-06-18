using System;
using System.IO;

namespace Roblox.Configuration
{
    public class ConfigurationCopier
    {
        public enum Result
        {
            UpdatedFiles,
            NoUpdatesNeeded
        }

        public static Result CopyConfiguration(string source, DirectoryInfo destination)
        {
            var result = Result.NoUpdatesNeeded;

            if (string.IsNullOrEmpty(source))
                throw new InvalidOperationException("SharedConfigSource isn't specified.");

            var files = new DirectoryInfo(source).GetFiles("*.config");
            for (int i = 0; i < files.Length; i++)
            {
                var file = files[i];
                var destinationFile = new FileInfo(destination.FullName + file.Name);
                if (!destinationFile.Exists)
                {
                    file.CopyTo(destinationFile.FullName, true);
                    result = Result.UpdatedFiles;
                    continue;
                }

                if (destinationFile.LastWriteTimeUtc != file.LastWriteTimeUtc)
                {
                    file.CopyTo(destinationFile.FullName, true);
                    result = Result.UpdatedFiles;
                    continue;
                }
            }

            return result;
        }
    }
}
