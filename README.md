atch# MHDirectoryWatcher
`MHDirectoryWatcher` is a lightweight class that uses GCD to monitor a given path for changes.
When changes to the directory occurs, `MHDirectoryWatcher` starts polling file sizes every second to make sure that file transfers are finished.

### Installing
Copy MHDirectoryWatcher.h+m into your project.

### Usage
Get an instance of `MHDirectoryWatcher` using factory method `+directoryWatcherAtPath`.
Call `-startWatching` to begin watching the desired directory.

Add an observer for the notification name `MHDirectoryDidFinishChangesNotification` to be notified when changes have been made to the directory.
Optionally add an observer for the notification name `MHDirectoryDidStartChangesNotification` to be notified when changes are about to happen.

Call `-stopWatching` / `-startWatching` to pause/resume.
