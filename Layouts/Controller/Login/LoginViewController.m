//
//  LoginViewController.m
//  Layouts
//
//  Created by Joseph Nguyen on 5/2/17.
//  Copyright © 2017 Joseph Nguyen. All rights reserved.
//

#import "LoginViewController.h"
#import <MBProgressHUD.h>
#import "AFNetworkingHelper.h"
#import "AppDelegate.h"

@interface LoginViewController ()
@property (nonatomic,strong) MBProgressHUD* HUD;
@end

@implementation LoginViewController


- (void)viewWillAppear:(BOOL)animated{
    // Hide navigationbar
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];        
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)hideUsernamePasswordKeyboard {
    [self.txtPassword resignFirstResponder];
    [self.txtUsername resignFirstResponder];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self hideUsernamePasswordKeyboard];
}

- (IBAction)btnForgotPasswordClick:(id)sender {
}

- (IBAction)btnRegisterClick:(id)sender {
}

- (IBAction)btnLoginClick:(id)sender {
    self.HUD = [CommonUtils createProgressViewInView:self.view];
        
    [[AFNetworkingHelper sharedClient] loginWithUsername:self.txtUsername.text password:self.txtPassword.text success:^(NSURLSessionDataTask *task, id responseObject) {
        [self.HUD setHidden:YES];
        
        NSDictionary *json = (NSDictionary*)responseObject;
        NSInteger userId = [json[@"userId"] intValue];
        [[CommonUtils sharedUtils] setToken:json[@"jwt"]];
        [[CommonUtils sharedUtils] setUserId: userId];
        
        if (self.delegate!=nil) {
            [self.delegate loginSuccess];
        }else{
            [[[CommonUtils sharedUtils] getAppDelegate] changeCenterViewController];
        }
        
        //hide this ViewController
        [self dismissViewControllerAnimated:NO completion:nil];
    }failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Failure -- %@", error.localizedDescription);
        [self.HUD setHidden:YES];
    }];
    
}
@end
