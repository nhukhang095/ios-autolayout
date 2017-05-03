//
//  UrlManager.m
//  Layouts
//
//  Created by Joseph Nguyen on 5/2/17.
//  Copyright © 2017 Joseph Nguyen. All rights reserved.
//

#import "UrlManager.h"
#import "AppConstant.h"

@implementation UrlManager
+(NSString*) rootURl{
    return [[CommonUtils sharedUtils] hostInfo];
}

+(NSString*)loginURLString{
    return [[self rootURl] stringByAppendingString:loginPath];
}
@end
