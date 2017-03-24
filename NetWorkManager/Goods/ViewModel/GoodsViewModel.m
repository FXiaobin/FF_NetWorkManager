 //
//  GoodsViewModel.m
//  NetWorkManager
//
//  Created by fanxiaobin on 2017/3/24.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>
#import "GoodsViewModel.h"
#import "NetWorkManager.h"
#import "GoodsModel.h"

@implementation GoodsViewModel

-(instancetype)init{
    if (self = [super init]) {
        self.dataArr = [NSMutableArray array];
    }
    return self;
}

-(void)setRequestWithScrollView:(UIScrollView *)scrollView Page:(NSInteger)page result:(void (^)(id obj))result failure:(void(^)(id error))failure{
    
    
    NetWorkManager *manager = [NetWorkManager manager];
    [manager networkReachabilityMonitoring];
    
    NSDictionary *par = @{@"currPage" : @(page), @"pageSize" : @"5"};
    [manager POST:@"http://118.178.114.80/eqMobile/delegateHandleRequest?OPT=7030" parameters:par success:^(id responseObject) {
        NSLog(@"--- 请求成功 ----");
        [self endRefrehingWithScrollView:scrollView];
        
        if (page == 1) {
            [self.dataArr removeAllObjects];
        }
        
        NSArray *exgoodsList = responseObject[@"exgoodsList"];
        for (NSDictionary *dic in exgoodsList) {
            GoodsModel *model = [GoodsModel makeModelWithDic:dic];
            [self.dataArr addObject:model];
        }
        
        result(self.dataArr);
        
    } failure:^(id error) {
        
        NSLog(@"--- 请求失败 ----");
        failure(error);
        [self endRefrehingWithScrollView:scrollView];
        
        
    } noNet:^(BOOL hasNet) {
        if (!hasNet) {
            NSLog(@"--- 没有网络 ----");
            NSError *error = [NSError errorWithDomain:@"没有网络" code:-100 userInfo:@{@"des" : @"没有网络"}];
            failure(error);
            
            [self endRefrehingWithScrollView:scrollView];
        }
        
    }];
    
    
    
}

- (void)endRefrehingWithScrollView:(UIScrollView *)scrollView{
    
    [scrollView.mj_header endRefreshing];
    [scrollView.mj_footer endRefreshing];
}


@end
