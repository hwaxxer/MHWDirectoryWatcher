# MHDirectoryWatcher
MHDirectoryWatcher monitors a given path for changes, polling file sizes every second to make sure that file transfers are complete.

### Basic usage
Copy the files into your project.
Get an instance of MHDirectoryWatcher using factory method +directoryWatcherAtPath.
Call -startWatching to begin watchign the desired directory.

Add an observer for the notification name MHDirectoryDidFinishChangesNotification to be notified when changes have been made to the directory.
Optionally add an observer for the notification name MHDirectoryDidStartChangesNotification to be notified when changes are about to happen.

Call -stopWatching/-startWatching to pause/resume.
