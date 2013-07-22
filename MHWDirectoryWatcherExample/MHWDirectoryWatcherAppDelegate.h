//
//  MHWDirectoryWatcherAppDelegate.h
//  MHWDirectoryWatcherExample
//
//  Created by Martin Hwasser on 7/22/13.
//  Copyright (c) 2013 Martin Hwasser. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MHWDirectoryWatcher;

@interface MHWDirectoryWatcherAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) MHWDirectoryWatcher *directoryWatcher;

@end
