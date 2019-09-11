//
//  DetailsInfoCell.h
//  LifeBox
//
//  Created by Lucky on 2019/9/7.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailsInfoCell : UITableViewCell

///订单编号
@property (strong, nonatomic) UILabel *orderId;

///下单时间
@property (strong, nonatomic) UILabel *orderTime;

///支付方式
@property (strong, nonatomic) UILabel *payType;

///支付时间
@property (strong, nonatomic) UILabel *payTime;

@end

NS_ASSUME_NONNULL_END
