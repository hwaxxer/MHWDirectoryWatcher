/*
 *  MHDirectoryWatcher.h
 *  Hacked by Martin Hwasser on 12/19/11.
 */

#import <Foundation/Foundation.h>

static NSString * const MHDirectoryDidStartChangesNotification = @"MHDirectoryDidStartChangesNotification";
static NSString * const MHDirectoryDidFinishChangesNotification = @"MHDirectoryDidFinishChangesNotification";

@interface MHDirectoryWatcher : NSObject

@property (nonatomic, copy) NSString *watchedPath;

// Does not start immediately by default
+ (MHDirectoryWatcher *)directoryWatcherAtPath:(NSString *)watchPath;

// Returns YES if started watching, NO if already is watching
- (BOOL)startWatching;
// Returns YES if stopped watching, NO if not watching
- (BOOL)stopWatching;


@end
