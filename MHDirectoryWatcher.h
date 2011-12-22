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
+ (MHDirectoryWatcher *)watchFolderWithPath:(NSString *)watchPath;
+ (MHDirectoryWatcher *)watchFolderWithPath:(NSString *)watchPath startImmediately:(BOOL)startImmediately;

- (void)stopWatching;
- (BOOL)startWatching;

@end
