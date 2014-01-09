# MHWDirectoryWatcher
`MHWDirectoryWatcher` is a lightweight class that uses GCD to monitor a given path for changes.
When any change to the directory occurs, `MHWDirectoryWatcher` starts polling the monitored path, making sure that file transfers are finished before posting notifications.

### Installing
Copy `MHWDirectoryWatcher.h+m` into your project.

(or use [CocoaPods](http://cocoapods.org))

### Usage via blocks
Get an instance of `MHWDirectoryWatcher` using the factory method `+directoryWatcherAtPath:callback:` and it will start monitoring the path immediately. Callback occurs after files have changed.

Example:

```objective-c
// Avoid a retain cycle
__weak typeof(self) weakSelf = self;
_dirWatcher = [MHWDirectoryWatcher directoryWatcherAtPath:kDocumentsFolder callback:^{
                  // Actions which should be performed when the files in the directory 
                  [weakSelf doSomethingNice];
        	   }];

```

Call `-stopWatching` / `-startWatching` to pause/resume.

---

Used in [Kobo](https://itunes.apple.com/se/app/kobo-books/id301259483?l=en&mt=8) and [Readmill](https://itunes.apple.com/se/app/readmill-book-reader-for-epub/id438032664?l=en&mt=8). 

If you like this repository and use it in your project, I'd love to hear about it!
