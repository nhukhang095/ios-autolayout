//
//  ImageViewController.m
//  Layouts
//
//  Created by Joseph Nguyen on 3/10/17.
//  Copyright © 2017 Joseph Nguyen. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

-(void)openLeftMenu:(id)sender{
    [self.viewDeckController openSide:IIViewDeckSideLeft animated:YES];
}

- (void)setupNavigationBar {
    //create back bar button item
    UIButton *backButton = [CommonUtils setupNavigationBar:self withTitle:NSLocalizedString(@"image_view", nil)];
    [backButton addTarget:self action:@selector(openLeftMenu:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
    NSAssert(self.imageView, @"self.imageView is nill Check your IBOulet connections");
    self.imageView.clipsToBounds = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnFill:(id)sender {
    self.imageView.contentMode = UIViewContentModeScaleToFill;
}

- (IBAction)btnAspectFit:(id)sender {
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}

- (IBAction)btnAspectFill:(id)sender {
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
}

@end
