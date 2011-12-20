/*
 *  MHDirectoryWatcher.h
 *  Hacked by Martin Hwasser on 12/19/11.
 */

#import <Foundation/Foundation.h>

static NSString * const MHDirectoryDidChangeNotification = @"MHDirectoryDidChangeNotification";

@class MHDirectoryWatcher;

@protocol MHDirectoryWatcherDelegate <NSObject>
- (void)directoryDidChange:(MHDirectoryWatcher *)folderWatcher;
@end

@interface MHDirectoryWatcher : NSObject

@property (nonatomic, copy) NSString *watchedPath;

+ (MHDirectoryWatcher *)startWatchingFolderWithPath:(NSString *)watchPath;

- (void)stopWatching;
- (BOOL)startWatching;

@end
