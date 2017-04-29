//
//  ImageViewController.h
//  Layouts
//
//  Created by Joseph Nguyen on 3/10/17.
//  Copyright © 2017 Joseph Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)btnFill:(id)sender;
- (IBAction)btnAspectFit:(id)sender;
- (IBAction)btnAspectFill:(id)sender;

@end
