//
//  AppDelegate.m
//  PuzzleDemo
//
//  Created by 乔杰 on 2018/11/5.
//  Copyright © 2018年 乔杰. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController: [[HomeViewController alloc] init]];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    
}
@end
