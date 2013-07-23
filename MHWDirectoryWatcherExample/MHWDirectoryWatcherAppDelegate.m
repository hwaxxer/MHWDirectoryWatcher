//
//  MHWDirectoryWatcherAppDelegate.m
//  MHWDirectoryWatcherExample
//
//  Created by Martin Hwasser on 7/22/13.
//  Copyright (c) 2013 Martin Hwasser. All rights reserved.
//

#import "MHWDirectoryWatcherAppDelegate.h"
#import "MHWDirectoryWatcher.h"

@implementation MHWDirectoryWatcherAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];


    self.directoryWatcher = [MHWDirectoryWatcher directoryWatcherAtPath:[self pathToDocumentsDirectory]
                                                               callback:^{
                                                                   [self directoryDidChange];
                                                               }];
    return YES;
}

- (void)directoryDidChange
{
    NSLog(@"Files changed at: %@", self.directoryWatcher.watchedPath);
    self.window.backgroundColor = [self randomColor];
}

- (void)moveFiles
{
    static NSFileManager *fileManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fileManager = [NSFileManager new];
    });
    
    NSString *newFilePath = [[self pathToDocumentsDirectory] stringByAppendingPathComponent:@"file"];
    if ([fileManager fileExistsAtPath:newFilePath]) {
        [fileManager removeItemAtPath:newFilePath error:nil];
    } else {
        [fileManager createFileAtPath:newFilePath contents:nil attributes:nil];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [self.directoryWatcher stopWatching];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [self.directoryWatcher startWatching];

    [NSTimer scheduledTimerWithTimeInterval:3.0
                                     target:self
                                   selector:@selector(moveFiles)
                                   userInfo:nil repeats:YES];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (NSString *)pathToDocumentsDirectory
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

- (UIColor *)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}


@end
