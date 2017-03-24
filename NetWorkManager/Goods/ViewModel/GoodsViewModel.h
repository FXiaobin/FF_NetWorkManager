//
//  GoodsViewModel.h
//  NetWorkManager
//
//  Created by fanxiaobin on 2017/3/24.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsViewModel : NSObject

@property (nonatomic,strong) NSMutableArray *dataArr;
-(void)setRequestWithScrollView:(UIScrollView *)scrollView Page:(NSInteger)page result:(void (^)(id obj))result failure:(void(^)(id error))failure;

@end
