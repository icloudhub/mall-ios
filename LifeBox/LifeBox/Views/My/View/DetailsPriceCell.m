//
//  DetailsPriceCell.m
//  LifeBox
//
//  Created by Lucky on 2019/9/7.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "DetailsPriceCell.h"

@implementation DetailsPriceCell

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
        make.height.mas_greaterThanOrEqualTo(Scale750(40));
    }];
    /*
     * 商品总额描述
     */
    _titleLab = [[UILabel alloc] init];
    _titleLab.font = [UIFont systemFontOfSize:Scale750(24)];
    _titleLab.textColor = RGBColor(102, 102, 102);
    _titleLab.text = @"商品总额";
    [bottomView addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(30));
        make.left.mas_equalTo(Scale750(20));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 商品总价格
     */
    _totalLab = [[UILabel alloc] init];
    _totalLab.font = [UIFont systemFontOfSize:Scale750(24)];
    _totalLab.textColor = RGBColor(51, 51, 51);
    _totalLab.text = @"¥100.99";
    [bottomView addSubview:_totalLab];
    [_totalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->_titleLab);
        make.right.mas_equalTo(-Scale750(20));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 需要支付的价格
     */
    _needPay = [[UILabel alloc] init];
    _needPay.font = [UIFont systemFontOfSize:Scale750(24)];
    _needPay.textColor = RGBColor(51, 51, 51);
    NSString *tempStr = @"需要付款:    ¥100.99";
    _needPay.attributedText = [tempStr strChangFlagWithStr:@"¥100.99" Color:RGBColor(250, 75, 37) Font:Scale750(36)];
    [bottomView addSubview:_needPay];
    [_needPay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_totalLab.mas_bottom).mas_offset(Scale750(20));
        make.right.mas_equalTo(-Scale750(20));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 适配
     */
    [bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self->_needPay.mas_bottom).mas_offset(Scale750(20));
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(bottomView.mas_bottom).mas_offset(Scale750(20));
    }];
}
@end
