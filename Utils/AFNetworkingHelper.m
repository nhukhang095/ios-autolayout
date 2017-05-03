//
//  AFNetworkingHelper.m
//  Layouts
//
//  Created by Joseph Nguyen on 5/2/17.
//  Copyright © 2017 Joseph Nguyen. All rights reserved.
//

#import "AFNetworkingHelper.h"
#import "UrlManager.h"

@implementation AFNetworkingHelper
+ (AFNetworkingHelper *)sharedClient{
    static AFNetworkingHelper *_sharedClient = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        //session config
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
                NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:10 * 1024 * 1024 diskCapacity:50 * 1024 * 1024 diskPath:nil];
        [sessionConfiguration setURLCache:cache];
        sessionConfiguration.requestCachePolicy = NSURLRequestReturnCacheDataElseLoad;
        //end session config
        _sharedClient = [[self alloc] initWithSessionConfiguration:sessionConfiguration];
    });
    _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
    _sharedClient.requestSerializer = [AFJSONRequestSerializer serializer];
    [_sharedClient.operationQueue cancelAllOperations];
    return _sharedClient;
}

-(void)loginWithUsername:(NSString*)username password:(NSString*)password
                 success:(void(^)(NSURLSessionDataTask *task, id responseObject))success
                 failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure{
    NSString* path = [UrlManager loginURLString];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:@"1.0" forHTTPHeaderField:@"appVersion"];
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSDictionary *params = params = @{@"userName":username, @"password":password};
    NSMutableDictionary *dict =[NSMutableDictionary dictionaryWithDictionary:params];
    
    //Call request
    [manager POST:path parameters:dict progress:^(NSProgress *uploadProgress) {
        NSLog(@"Make request: %@", path);
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        if(success){
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(task,error);
        }
    }];
    
}
@end
