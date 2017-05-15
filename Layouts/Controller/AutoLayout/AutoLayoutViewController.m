//
//  AutoLayoutViewController.m
//  Layouts
//
//  Created by Joseph Nguyen on 4/30/17.
//  Copyright © 2017 Joseph Nguyen. All rights reserved.
//  https://www.raywenderlich.com/50317/beginning-auto-layout-tutorial-in-ios-7-part-1
//

#import "AutoLayoutViewController.h"

@interface AutoLayoutViewController ()

@end

@implementation AutoLayoutViewController

-(void)openLeftMenu:(id)sender{
    [self.viewDeckController openSide:IIViewDeckSideLeft animated:YES];
}

- (void)setupNavigationBar {    
    UIButton *backButton = [CommonUtils setupNavigationBar:self withTitle:NSLocalizedString(@"auto_layout", nil)];
    [backButton addTarget:self action:@selector(openLeftMenu:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
