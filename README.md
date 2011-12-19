#Introduction
MHDirectoryWatcher monitors a given path for changes, polling file sizes every second to make sure that file transfers are complete.

# How to use in your project

Just copy the files into your project, start the watcher using +watchFolderWithPath:delegate:

The delegate will return -directoryDidChange: when file changes are complete.

