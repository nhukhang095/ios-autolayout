//
//  LoginViewController.h
//  Layouts
//
//  Created by Joseph Nguyen on 5/2/17.
//  Copyright © 2017 Joseph Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginViewControllerDelegate <NSObject>
-(void)loginSuccess;
@end


@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) id<LoginViewControllerDelegate> delegate;

- (IBAction)btnForgotPasswordClick:(id)sender;
- (IBAction)btnRegisterClick:(id)sender;
- (IBAction)btnLoginClick:(id)sender;

@end
