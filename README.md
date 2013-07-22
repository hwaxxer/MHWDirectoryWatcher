# MHWDirectoryWatcher
`MHWDirectoryWatcher` is a lightweight class that uses GCD to monitor a given path for changes.
When any change to the directory occurs, `MHWDirectoryWatcher` starts polling the monitored path, making sure that file transfers are finished before posting notifications.

### Installing (without CocoaPods)
Copy MHWDirectoryWatcher.h+m into your project.

### Usage via NSNotificationCenter
Get an instance of `MHWDirectoryWatcher` using factory method `+directoryWatcherAtPath` and it will start monitoring immediately.

Add an observer for the notification name `MHWDirectoryDidFinishChangesNotification` to be notified when changes have been made to the directory.
Optionally add an observer for the notification name `MHWDirectoryDidStartChangesNotification` to be notified when changes are about to happen.

Call `-stopWatching` / `-startWatching` to pause/resume.

### Usage via Blocks
Get an instance of `MHWDirectoryWatcher` using factory method `+directoryWatcherAtPath:callback:` and it will start monitoring immediately calling callback as soon as a file did finish changing (this corresponds to `MHWDirectoryDidFinishChangesNotification`)

Example:

```objective-c
_dirWatcher = [MHWDirectoryWatcher directoryWatcherAtPath:kDocumentsFolder callback:^{
            		// Actions which sould be performed as file did finish to change
            		
        	   }];

```
