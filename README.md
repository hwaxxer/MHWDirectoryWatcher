# MHDirectoryWatcher
MHDirectoryWatcher monitors a given path for changes, polling file sizes every second to make sure that file transfers are complete.

### Basic usage
Just copy the files into your project, start the watcher using +watchFolderWithPath:delegate:
The delegate will return -directoryDidChange: when file changes are complete.

=
MHDirectoryWatcher is based on the Apple sample project http://developer.apple.com/library/ios/#samplecode/DocInteraction/Introduction/Intro.html