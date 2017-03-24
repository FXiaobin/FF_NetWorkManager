//
//  NetWorkManager.h
//  NetWorkManager
//
//  Created by fanxiaobin on 2017/3/24.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkManager : NSObject

+ (NetWorkManager *)manager;

/// 网络监测
@property (nonatomic,copy) void (^noNetBlock) (BOOL);

- (void)networkReachabilityMonitoring;

/// POST
-(void)POST:(NSString *)urlString parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(id error))failure noNet:(void (^)(BOOL hasNet))noNet;

/// GET
-(void)GET:(NSString *)urlString parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(id error))failure  noNet:(void (^)(BOOL hasNet))noNet;


@end
