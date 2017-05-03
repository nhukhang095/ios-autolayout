//
//  AppDelegate.h
//  Layouts
//
//  Created by Joseph Nguyen on 3/9/17.
//  Copyright © 2017 Joseph Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) MBProgressHUD* mainHUD;

-(void)changeRootViewController;
-(void)changeCenterViewController;


@end

