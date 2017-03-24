//
//  GoodsModel.m
//  NetWorkManager
//
//  Created by fanxiaobin on 2017/3/24.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import "GoodsModel.h"

@implementation GoodsModel

+ (GoodsModel *)makeModelWithDic:(NSDictionary *)dic{
    GoodsModel *model = [GoodsModel new];
    //[model setValuesForKeysWithDictionary:dic];
    
    model.goodsName = dic[@"goodsName"];
    model.goodsThumb = dic[@"goodsThumb"];
    model.shopDiamonds = dic[@"shopDiamonds"];
    model.clickCount = dic[@"clickCount"];
    model.catName = dic[@"catName"];
    
    return model;
}

@end
