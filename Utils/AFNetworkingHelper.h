//
//  AFNetworkingHelper.h
//  Layouts
//
//  Created by Joseph Nguyen on 5/2/17.
//  Copyright © 2017 Joseph Nguyen. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface AFNetworkingHelper : AFHTTPSessionManager
+ (AFNetworkingHelper *)sharedClient;
-(void)loginWithUsername:(NSString*)username password:(NSString*)password
                 success:(void(^)(NSURLSessionDataTask *task, id responseObject))success
                 failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
