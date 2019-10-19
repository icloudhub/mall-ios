//
//  OrderPriceCell.m
//  LifeBox
//
//  Created by Lucky on 2019/10/15.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "OrderPriceCell.h"

@implementation OrderPriceCell

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
     * 价格lab
     */
    _priceLab = [[UILabel alloc] init];
    _priceLab.font = [UIFont systemFontOfSize:Scale750(30)];
    _priceLab.textColor = RGBColor(51, 51, 51);
    NSString *priceStr = @"小计: ¥12.90";
    _priceLab.attributedText = [priceStr strChangFlagWithStr:@"¥12.90" Color:RGBColor(250, 75, 37) Font:Scale750(30)];
    [self.contentView addSubview:_priceLab];
    [_priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-Scale750(30));
        make.centerY.mas_equalTo(self);
        make.width.height.mas_greaterThanOrEqualTo(10);
    }];
    /*
     * 数量
     */
    _numLab = [[UILabel alloc] init];
    _numLab.font = [UIFont systemFontOfSize:Scale750(30)];
    _numLab.textColor = RGBColor(153, 153, 153);
    _numLab.text = @"共1件,";
    [self.contentView addSubview:_numLab];
    [_numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.right.mas_equalTo(_priceLab.mas_left).mas_offset(-Scale750(10));
        make.width.height.mas_greaterThanOrEqualTo(10);
    }];
}

@end
