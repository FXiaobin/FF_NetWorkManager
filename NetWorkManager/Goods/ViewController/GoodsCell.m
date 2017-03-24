//
//  GoodsCell.m
//  NetWorkManager
//
//  Created by fanxiaobin on 2017/3/24.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import "GoodsCell.h"
#import "GoodsModel.h"
#import <UIImageView+WebCache.h>

@implementation GoodsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(GoodsModel *)model{
    
    [self.goodsIocn sd_setImageWithURL:[NSURL URLWithString:model.goodsThumb] placeholderImage:[UIImage imageNamed:@"placeholder_image@2x.jpg"]];
    self.titleLabel.text = model.goodsName;
    self.cateLabel.text = [NSString stringWithFormat:@"商品分类: %@",model.catName];
    self.likeLabel.text = [NSString stringWithFormat:@"商品价格: %@钻石",model.shopDiamonds];
    
}

@end
