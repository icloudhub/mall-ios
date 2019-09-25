//
//  ProfitViewCell.m
//  LifeBox
//
//  Created by Lucky on 2019/8/25.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "ProfitViewCell.h"

@implementation ProfitViewCell

#pragma mark - 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 标题
     */
    _titleLab = [[UILabel alloc] init];
    _titleLab.textColor = RGBColor(51, 51, 51);
    _titleLab.font = [UIFont systemFontOfSize:Scale750(26)];
    _titleLab.text = @"高额分享";
    [self addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(Scale750(30));
        make.bottom.mas_equalTo(self.mas_centerY).mas_offset(-Scale750(10));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 时间
     */
    _timeLab = [[UILabel alloc] init];
    _timeLab.textColor = RGBColor(153, 153, 153);
    _timeLab.font = [UIFont systemFontOfSize:Scale750(24)];
    _timeLab.text = @"2019-01-01 12:12:12";
    [self addSubview:_timeLab];
    [_timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->_titleLab);
        make.top.mas_equalTo(self.mas_centerY).mas_offset(Scale750(10));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 金额
     */
    _profitLab = [[UILabel alloc] init];
    _profitLab.textColor = RGBColor(232, 62, 49);
    _profitLab.font = [UIFont systemFontOfSize:Scale750(30)];
    _profitLab.text = @"+10.00";
    [self addSubview:_profitLab];
    [_profitLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-Scale750(30));
        make.centerY.mas_equalTo(self);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
}

@end
