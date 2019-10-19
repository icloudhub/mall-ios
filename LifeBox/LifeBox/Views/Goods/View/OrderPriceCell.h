//
//  OrderPriceCell.h
//  LifeBox
//
//  Created by Lucky on 2019/10/15.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrderPriceCell : UITableViewCell

///商品个数
@property (strong, nonatomic) UILabel *numLab;

///商品价格
@property (strong, nonatomic) UILabel *priceLab;

@end

NS_ASSUME_NONNULL_END
