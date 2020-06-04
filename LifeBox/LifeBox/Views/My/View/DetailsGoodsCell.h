//
//  DetailsGoodsCell.h
//  LifeBox
//
//  Created by Lucky on 2019/9/7.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailsGoodsCell : UITableViewCell

///商品图片
@property (strong, nonatomic) UIImageView *goodsImg;

///商品名称
@property (strong, nonatomic) UILabel *goodsName;

///商品数量
@property (strong, nonatomic) UILabel *goodsNum;

///商品价格
@property (strong, nonatomic) UILabel *goodsPrice;

///商品规格
@property (strong, nonatomic) UILabel *goodsAttLab;

@end

NS_ASSUME_NONNULL_END
