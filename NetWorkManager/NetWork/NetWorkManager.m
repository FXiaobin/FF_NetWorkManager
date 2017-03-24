//
//  NetWorkManager.m
//  NetWorkManager
//
//  Created by fanxiaobin on 2017/3/24.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import "NetWorkManager.h"
#import <AFNetworking/AFNetworking.h>

@interface NetWorkManager ()


@end

@implementation NetWorkManager

+ (NetWorkManager *)manager{
    NetWorkManager *manager = [[NetWorkManager alloc] init];
    
    return manager;
}

- (void)networkReachabilityMonitoring{
    
    __block BOOL hasNet = YES;
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusNotReachable) {
            hasNet = NO;
            //NSLog(@"--- 没有网络 ----");
        }else{
            hasNet = YES;
            //NSLog(@"--- has有网络 ----");
        }
        
        self.noNetBlock(hasNet);
    }];
    
    [manager startMonitoring];
}

- (void)initSessionWithSessionManager:(AFHTTPSessionManager *)sessionManager{
    
    sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [sessionManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    sessionManager.requestSerializer.timeoutInterval = 15.f;
    [sessionManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    NSSet *set = [NSSet setWithObjects:@"text/plain",@"text/html",@"application/json",@"application/json;charset=UTF-8", @"application/x-www-form-urlencoded", nil];
    sessionManager.responseSerializer.acceptableContentTypes = set;
}

-(void)POST:(NSString *)urlString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(id))failure noNet:(void (^)(BOOL))noNet{
    
    _noNetBlock = noNet;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [self initSessionWithSessionManager:manager];
    
    [manager POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}


-(void)GET:(NSString *)urlString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(id))failure noNet:(void (^)(BOOL))noNet{
    
    _noNetBlock = noNet;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [self initSessionWithSessionManager:manager];
    
    [manager GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}



@end
