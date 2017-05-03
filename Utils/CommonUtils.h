//
//  CommonUtils.h
//  Layouts
//
//  Created by Joseph Nguyen on 4/29/17.
//  Copyright © 2017 Joseph Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>
@class AppDelegate;

@interface CommonUtils : NSObject
+ (CommonUtils *)sharedUtils;
- (AppDelegate *)getAppDelegate;

+(UIColor*)navigationBarBackGroundColor;
+(UIButton*)setupNavigationBar:(UIViewController *)controller;

- (NSString *)hostInfo;
- (void)setHostInfo:(NSString *)key;
- (NSNumber*)userId;
- (void)setUserId:(NSInteger)value;
- (NSString *)token;
- (void)setToken:(NSString *)key;
- (NSString *)userName;
- (void)setUserName:(NSString *)key;
- (NSString *)password;
- (void)setPassword:(NSString *)key;
- (NSString *)ipAddress;
- (void)setIpAddress:(NSString *)key;


/**
 *  Validating functions
 *
 */
+ (BOOL) validateEmail: (NSString *) candidate;
+ (BOOL) validatePhone: (NSString *) candidate;
+ (BOOL) validateLoginString: (NSString *) candidate;

/**
 *  Popup, alert and progress view
 *
 */
+(MBProgressHUD*)createProgressViewInView:(UIView*)view;
+(MBProgressHUD*)createProgressViewInView:(UIView*)view duration:(NSInteger)duration;
+(MBProgressHUD*)createProgressViewWithTitle:(NSString*)msg duration:(float)duration inView:(UIView*)view;

+(int)getDeviceLanguageCode;
+(NSString*)getDeviceLanguageCodeString;
+(NSString*)getDeviceCountryString;
+(void)showConfirmAlertViewWithTitle:(NSString*)title message:(NSString*)message cancelButton:(NSString*)cancelBtn delegate:(id)delegate;


@end
