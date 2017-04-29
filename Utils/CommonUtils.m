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
@end
