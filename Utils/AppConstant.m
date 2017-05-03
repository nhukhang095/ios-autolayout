//
//  AppConstant.m
//  Layouts
//
//  Created by Joseph Nguyen on 5/2/17.
//  Copyright © 2017 Joseph Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppConstant.h"

id UDValue4Key(NSString *key) {    
    if (!key) return nil;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults valueForKey:key];
}

void UDSetValue4Key(id value, NSString *key) {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (value && key) {
        [defaults setValue:value forKey:key];
    }
    [defaults synchronize];
}
