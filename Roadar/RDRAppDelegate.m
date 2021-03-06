//
//  RDRAppDelegate.m
//  Roadar
//
//  Created by Robin Hayward on 12/03/2014.
//  Copyright (c) 2014 Rob Hayward. All rights reserved.
//

#import "RDRAppDelegate.h"
#import "RDRNavigationController.h"
#import "RDRHomeViewController.h"
#import "RDRTransmitter.h"
#import "RDRReceiver.h"
#import "RDRConstants.h"
#import "RDRMotion.h"
#import "RDRUser.h"

@interface RDRAppDelegate ()

@property (strong, nonatomic) RDRMotion *motion;
@property (strong, nonatomic) RDRTransmitter *beacon;
@property (strong, nonatomic) RDRReceiver *receiver;
@property (strong, nonatomic) RDRNavigationController *navigationController;
@property (strong, nonatomic) RDRHomeViewController *homeViewController;
@property (strong, nonatomic) RDRUser *user;

@end

@implementation RDRAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.user = [[RDRUser alloc] init];
  self.user.identifier = @1;
  self.user.beaconIdentifier = @1;
  self.motion = [[RDRMotion alloc] init];
  self.beacon = [[RDRTransmitter alloc] initWithUUID:BEACON_UUID];
  self.receiver = [[RDRReceiver alloc] initWithUUID:BEACON_UUID];
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.homeViewController = [[RDRHomeViewController alloc] initWithNibName:nil bundle:nil];
  self.homeViewController.user = self.user;
  self.homeViewController.motion = self.motion;
  self.homeViewController.beacon = self.beacon;
  self.homeViewController.receiver = self.receiver;
  self.navigationController = [[RDRNavigationController alloc] initWithRootViewController:self.homeViewController];
  self.window.rootViewController = self.navigationController;
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
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
  // Saves changes in the application's managed object context before the application terminates.
}


@end
