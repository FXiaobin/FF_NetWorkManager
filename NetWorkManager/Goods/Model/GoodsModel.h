//
//  GoodsModel.h
//  NetWorkManager
//
//  Created by fanxiaobin on 2017/3/24.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsModel : NSObject

@property (nonatomic,copy) NSString *goodsName;
@property (nonatomic,copy) NSString *goodsThumb;
@property (nonatomic,copy) NSNumber *shopDiamonds;
@property (nonatomic,copy) NSNumber *clickCount;
@property (nonatomic,copy) NSString *catName;

+ (GoodsModel *)makeModelWithDic:(NSDictionary *)dic;

@end
