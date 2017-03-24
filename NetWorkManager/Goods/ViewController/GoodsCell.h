//
//  GoodsCell.h
//  NetWorkManager
//
//  Created by fanxiaobin on 2017/3/24.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GoodsModel;

@interface GoodsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *goodsIocn;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *cateLabel;


@property (weak, nonatomic) IBOutlet UILabel *likeLabel;


@property (nonatomic,strong) GoodsModel *model;





@end
