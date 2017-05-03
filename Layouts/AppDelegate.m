//
//  AppDelegate.m
//  Layouts
//
//  Created by Joseph Nguyen on 3/9/17.
//  Copyright © 2017 Joseph Nguyen. All rights reserved.
//

#import "AppDelegate.h"
#import "IIViewDeckController.h"
#import "LoginViewController.h"

@interface AppDelegate ()<LoginViewControllerDelegate>

@end

@implementation AppDelegate

-(void)changeRootViewController{
    UIStoryboard *leftMenuStory = [UIStoryboard storyboardWithName:@"Leftmenu" bundle:nil];
    UIViewController *leftController = [[UINavigationController alloc] initWithRootViewController:[leftMenuStory instantiateViewControllerWithIdentifier:@"LeftMenuController"]];
    
    UIStoryboard *centerStory = [UIStoryboard storyboardWithName:@"ImageView" bundle:nil];
    UIViewController *centerController = [[UINavigationController alloc] initWithRootViewController:[centerStory instantiateViewControllerWithIdentifier:@"ImageViewController"]];
    
    IIViewDeckController* deckController =  [[IIViewDeckController alloc] initWithCenterViewController:centerController leftViewController:leftController];
    [self.window setRootViewController:deckController];
}

-(void)changeCenterViewController{
    if (![self.window.rootViewController isKindOfClass:[IIViewDeckController class]]) {
        [self changeRootViewController];
    }
    else{
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"ImageView" bundle:nil];
        UIViewController *centerController = [[UINavigationController alloc] initWithRootViewController:[story instantiateViewControllerWithIdentifier:@"ImageViewController"]];
        [((IIViewDeckController*)self.window.rootViewController) closeSide:NO];
        [((IIViewDeckController*)self.window.rootViewController) setCenterViewController:centerController];
    }
}


-(void)loginSuccess{
    [self changeRootViewController];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[CommonUtils sharedUtils] setHostInfo:@"http://rrm.fcv-etools.com/fcv-rl-web"];
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    
    NSNumber *userId = [CommonUtils sharedUtils].userId;    
    if ([userId integerValue] < 0 || [userId isKindOfClass:[NSNull class]] || userId == nil) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
        UIViewController *centerController = [[UINavigationController alloc] initWithRootViewController:[storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"]];
        //login.delegate = self;
        self.window.rootViewController = centerController;
    }else{
        [self changeRootViewController];
    }
    
    [self.window makeKeyAndVisible];    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
