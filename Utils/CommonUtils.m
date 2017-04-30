//
//  CommonUtils.m
//  Layouts
//
//  Created by Joseph Nguyen on 4/29/17.
//  Copyright © 2017 Joseph Nguyen. All rights reserved.
//

#import "CommonUtils.h"
#define colorWithRGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

@implementation CommonUtils
+(UIColor*)navigationBarBackGroundColor{
    return colorWithRGB(1, 157, 1);    
}

+(void)openLeftMenu:(id)sender withController:(UIViewController *) controller{
    [controller.viewDeckController openSide:IIViewDeckSideLeft animated:YES];
}

+(UIButton*)setupNavigationBar:(UIViewController *)controller {
    //create back bar button item
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"tabbar-More"] forState:UIControlStateNormal];
    [backButton sizeToFit];
    UIBarButtonItem* backButtonBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    controller.navigationItem.leftBarButtonItem = backButtonBarItem;
    
    [controller.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [controller.navigationController.navigationBar setBarTintColor:[CommonUtils navigationBarBackGroundColor]];
    controller.navigationController.navigationBar.topItem.title = NSLocalizedString(@"auto_layout", nil);
    
    [controller.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [controller.navigationController.navigationBar setTranslucent:NO];
    
    return backButton;
}
@end
