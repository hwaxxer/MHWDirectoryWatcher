# MHWDirectoryWatcher
`MHWDirectoryWatcher` is a lightweight class that uses GCD to monitor a given path for changes.
When any change to the directory occurs, `MHWDirectoryWatcher` starts polling the monitored path, making sure that file transfers are finished before posting notifications.

### Installing (without CocoaPods)
Copy MHWDirectoryWatcher.h+m into your project.

### Usage via Blocks
Get an instance of `MHWDirectoryWatcher` using the factory method `+directoryWatcherAtPath:callback:` and it will start monitoring the path immediately, calling the callback when files have changed.

Example:

```objective-c
_dirWatcher = [MHWDirectoryWatcher directoryWatcherAtPath:kDocumentsFolder callback:^{
            		// Actions which should be performed when the files in the directory changes
            		
        	   }];

```

Call `-stopWatching` / `-startWatching` to pause/resume.
