//
//  DetailsInfoCell.m
//  LifeBox
//
//  Created by Lucky on 2019/9/7.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "DetailsInfoCell.h"

@implementation DetailsInfoCell

#pragma mark - 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 底部View
     */
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor whiteColor];
    bottomView.layer.cornerRadius = Scale750(24);
    [self.contentView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(Scale750(20));
        make.right.mas_equalTo(-Scale750(20));
        make.height.mas_greaterThanOrEqualTo(Scale750(50));
    }];
    /*
     * 订单编号
     */
    _orderId = [[UILabel alloc] init];
    _orderId.font = [UIFont systemFontOfSize:Scale750(24)];
    _orderId.textColor = RGBColor(102, 102, 102);
    _orderId.text = @"订单编号:  1000000000";
    [bottomView addSubview:_orderId];
    [_orderId mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(30));
        make.left.mas_equalTo(Scale750(20));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 下单时间
     */
    _orderTime = [[UILabel alloc] init];
    _orderTime.font = [UIFont systemFontOfSize:Scale750(24)];
    _orderTime.textColor = RGBColor(102, 102, 102);
    _orderTime.text = @"下单时间:  2019-09-08 00:00:00";
    [bottomView addSubview:_orderTime];
    [_orderTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_orderId.mas_bottom).mas_offset(Scale750(20));
        make.left.mas_equalTo(self->_orderId);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 支付方式
     */
    _payType = [[UILabel alloc] init];
    _payType.font = [UIFont systemFontOfSize:Scale750(24)];
    _payType.textColor = RGBColor(102, 102, 102);
    _payType.text = @"支付方式:  微信支付";
    [bottomView addSubview:_payType];
    [_payType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_orderTime.mas_bottom).mas_offset(Scale750(20));
        make.left.mas_equalTo(self->_orderId);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 支付时间
     */
    _payTime = [[UILabel alloc] init];
    _payTime.font = [UIFont systemFontOfSize:Scale750(24)];
    _payTime.textColor = RGBColor(102, 102, 102);
    _payTime.text = @"支付时间:  2019-09-08 00:00:00";
    [bottomView addSubview:_payTime];
    [_payTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_payType.mas_bottom).mas_offset(Scale750(20));
        make.left.mas_equalTo(self->_orderId);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 适配
     */
    [bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self->_payTime.mas_bottom).mas_offset(Scale750(20));
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(bottomView.mas_bottom).mas_offset(Scale750(20));
    }];

}

@end
