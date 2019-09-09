//
//  DetailsPriceCell.h
//  LifeBox
//
//  Created by Lucky on 2019/9/7.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailsPriceCell : UITableViewCell

///商品总额描述
@property (strong, nonatomic) UILabel *titleLab;

///商品总额
@property (strong, nonatomic) UILabel *totalLab;

///需要支付金额
@property (strong, nonatomic) UILabel *needPay;

@end

NS_ASSUME_NONNULL_END
