//
//  MSAppDelegate.m
//  WWDC2013App
//
//  Created by Michał Śmiałko on 24.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import "MSAppDelegate.h"

#import "MSProjectsViewController.h"
#import "MSMenuViewController.h"
#import "MSNavigationController.h"
#import "MSNavigationBar.h"

@implementation MSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    

    self.viewController = [[MSMenuViewController alloc] init];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithNavigationBarClass:[MSNavigationBar class] toolbarClass:nil];
    navController.viewControllers = @[self.viewController];
    
    [navController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    self.window.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgmenu"]];
    
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
