//
//  AppDelegate.m
//  PopularFood
//
//  Created by Zoe on 13-8-29.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import "AppDelegate.h"
#import "DetailViewController.h"
#import "DBConnection.h"
//#import <AdSupport/AdSupport.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    [DBConnection createEditableCopyOfDatabaseIfNeeded:NO];
    [DBConnection getSharedDatabase];

    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];    
    
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    [self.window setRootViewController:detailVC];
    [self.window makeKeyAndVisible];
    
//    NSString *uuid = [[NSUUID UUID] UUIDString];    
//    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];   
//    NSString *adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];   
//    NSLog(@"uuid%@",uuid);
//    NSLog(@"idfv%@",idfv);
//    NSLog(@"adId%@",adId);
//    uuid098B9F8C-AF57-4480-A180-4F4D641C8F31
//    2013-09-16 17:52:41.516 人气面食[8481:c07] idfv86820DC9-7EF5-4134-AD42-964612997434   /*同个应用同个设备相同*/
//    2013-09-16 17:52:41.516 人气面食[8481:c07] adId9D95D7BE-E0F1-4690-88EA-AAD93032141B   /*同个应用同个设备相同*/

    return YES;
}

+ (AppDelegate *)getAppdelegate{
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    return appDelegate;
}

//切换rootController
-(void)setRootController:(id)controller{
    self.window.rootViewController=nil;
    [self.window setRootViewController:(UIViewController *)controller];
    [self.window makeKeyAndVisible];

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
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
