//
//  CommonUtils.m
//  Layouts
//
//  Created by Joseph Nguyen on 4/29/17.
//  Copyright © 2017 Joseph Nguyen. All rights reserved.
//

#import "CommonUtils.h"
#import "AppConstant.h"
#import "AppDelegate.h"

#define colorWithRGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

@implementation CommonUtils

// Singleton instance
+ (CommonUtils *)sharedUtils{
    static dispatch_once_t predicate;
    static CommonUtils *instance = nil;
    dispatch_once(&predicate, ^{instance = [[self alloc] init];});
    return instance;
}

- (AppDelegate *)getAppDelegate{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

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

/*!
 *  Validate email string
 *
 *  @param candidate email string which need validated
 *
 *  @return YES if 'cadidate' is email string
 */
+ (BOOL) validateEmail: (NSString *) candidate{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:candidate];
}

/*!
 *  Validate phone string
 *
 *  @param candidate phone string which need validated
 *
 *  @return YES if 'cadidate' is phone string
 */
+ (BOOL) validatePhone: (NSString *) candidate{
    NSString *phoneRegex =  @"^[0-9 ]+$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    
    BOOL res = [phoneTest evaluateWithObject:candidate];
    return res;
}
+ (BOOL) validateLoginString: (NSString *) candidate{
    if ([[NSCharacterSet decimalDigitCharacterSet] characterIsMember:[candidate characterAtIndex:0]]==YES) {
        return NO;
    }
    NSString *loginRegex = @"[a-zA-Z0-9.#_-]*";
    NSPredicate *loginTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", loginRegex];
    
    return [loginTest evaluateWithObject:candidate];
}

- (NSNumber*)userId{
    return UDValue4Key(loginKeyUSERID);
}

- (NSString *)hostInfo{
    return UDValue4Key(baseURL);    
}
- (void)setHostInfo:(NSString *)value{
    UDSetValue4Key(value, domainURL);
}

- (void)setUserId:(NSInteger)value
{
    UDSetValue4Key([NSNumber numberWithInteger:value], loginKeyUSERID);
}

- (NSString *)token
{
    return UDValue4Key(loginKeyTOKEN);
}
- (void)setToken:(NSString *)key
{
    UDSetValue4Key(key, loginKeyTOKEN);
}

- (NSString *)userName
{
    return UDValue4Key(loginKeyUSERNAME);
}
- (void)setUserName:(NSString *)key
{
    UDSetValue4Key(key, loginKeyUSERNAME);
}

- (NSString *)password
{
    return UDValue4Key(loginKeyPASSWORD);
}
- (void)setPassword:(NSString *)key
{
    UDSetValue4Key(key, loginKeyPASSWORD);
}

- (NSString *)ipAddress{
    return UDValue4Key(loginKeyIPADDRESS);
}
//

+(void)tempTaskInTime:(NSNumber*)time{
    sleep([time floatValue]);
}

+(MBProgressHUD*)createProgressViewInView:(UIView*)view duration:(NSInteger)duration;
{
    // The hud will dispable all input on the view (use the higest view possible in the view hierarchy)
    //    if ([[gdrUtils sharedUtils] getAppDelegate].mainHUD!=nil) {
    //        [[[gdrUtils sharedUtils] getAppDelegate].mainHUD setHidden:YES];
    //    }
    
    if (view == nil) {
        view = [[CommonUtils sharedUtils] getAppDelegate].window.rootViewController.view;
    }
    MBProgressHUD* HUD = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:HUD];
    HUD.removeFromSuperViewOnHide = YES;
    // Show the HUD while the provided method executes in a new thread
    [HUD showWhileExecuting:@selector(tempTaskInTime:) onTarget:self withObject:[NSNumber numberWithFloat:duration] animated:YES];
    
    [[CommonUtils sharedUtils] getAppDelegate].mainHUD = HUD;
    
    return HUD;
}
+(MBProgressHUD*)createProgressViewInView:(UIView*)view
{
    return [self createProgressViewInView:view duration:60.0];
}
+(MBProgressHUD*)createProgressViewWithTitle:(NSString*)msg duration:(float)duration inView:(UIView*)view
{
    MBProgressHUD* HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    // Configure for text only and offset down
    HUD.mode = MBProgressHUDModeText;
    HUD.labelText = msg;
    
    HUD.removeFromSuperViewOnHide = YES;
    [HUD hide:YES afterDelay:duration];
    
    return HUD;
}

+(int)getDeviceLanguageCode{
    //get language code
    int langCode = langCodeEnglish;
    if ([[[NSLocale preferredLanguages] objectAtIndex:0] rangeOfString:@"vi"].location!=NSNotFound) {
        langCode = langCodeVietnam;
    }
    if ([[[NSLocale preferredLanguages] objectAtIndex:0] rangeOfString:@"th"].location!=NSNotFound) {
        langCode = langCodeThailan;
    }
    if ([[[NSLocale preferredLanguages] objectAtIndex:0] rangeOfString:@"zh-"].location!=NSNotFound) {
        langCode = langCodeChinese;
    }
    if ([[[NSLocale preferredLanguages] objectAtIndex:0] rangeOfString:@"fr"].location!=NSNotFound) {
        langCode = langCodeFrench;
    }
    if ([[[NSLocale preferredLanguages] objectAtIndex:0] rangeOfString:@"ru"].location!=NSNotFound) {
        langCode = langCodeRussia;
    }
    
    return langCode;
}
+(NSString*)getDeviceLanguageCodeString{
    //get language code
    if ([[[NSLocale preferredLanguages] objectAtIndex:0] rangeOfString:@"vi"].location!=NSNotFound) {
        return @"VN";
    }
    if ([[[NSLocale preferredLanguages] objectAtIndex:0] rangeOfString:@"th"].location!=NSNotFound) {
        return @"TH";
    }
    if ([[[NSLocale preferredLanguages] objectAtIndex:0] rangeOfString:@"zh-"].location!=NSNotFound) {
        return @"CN";
    }
    if ([[[NSLocale preferredLanguages] objectAtIndex:0] rangeOfString:@"fr"].location!=NSNotFound) {
        return @"FR";
    }
    if ([[[NSLocale preferredLanguages] objectAtIndex:0] rangeOfString:@"ru"].location!=NSNotFound) {
        return @"RU";
    }
    if ([[[NSLocale preferredLanguages] objectAtIndex:0] rangeOfString:@"en"].location!=NSNotFound) {
        return @"US";
    }
    
    return nil;
}
+(NSString*)getDeviceCountryString{
    //get language code
    if ([[[NSLocale preferredLanguages] objectAtIndex:0] rangeOfString:@"vi"].location!=NSNotFound) {
        return @"Viet Nam";
    }
    if ([[[NSLocale preferredLanguages] objectAtIndex:0] rangeOfString:@"th"].location!=NSNotFound) {
        return @"Thai Lan";
    }
    if ([[[NSLocale preferredLanguages] objectAtIndex:0] rangeOfString:@"zh-"].location!=NSNotFound) {
        return @"China";
    }
    if ([[[NSLocale preferredLanguages] objectAtIndex:0] rangeOfString:@"fr"].location!=NSNotFound) {
        return @"FR";
    }
    if ([[[NSLocale preferredLanguages] objectAtIndex:0] rangeOfString:@"ru"].location!=NSNotFound) {
        return @"RU";
    }
    
    return nil;
}

+(void)showConfirmAlertViewWithTitle:(NSString*)title message:(NSString*)message cancelButton:(NSString*)cancelBtn delegate:(id)delegate{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *yesButton = [UIAlertAction
                                actionWithTitle:@"Yes, please"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    [alert dismissViewControllerAnimated:YES completion:nil];                              }];
    
    [alert addAction:yesButton];
    
    
}

@end
