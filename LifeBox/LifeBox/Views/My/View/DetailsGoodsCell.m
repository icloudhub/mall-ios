//
//  DetailsGoodsCell.m
//  LifeBox
//
//  Created by Lucky on 2019/9/7.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "DetailsGoodsCell.h"

@implementation DetailsGoodsCell

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
        make.height.mas_equalTo(Scale750(180));
    }];
    /*
     * 商品图片
     */
    _goodsImg = [[UIImageView alloc] init];
    _goodsImg.layer.borderColor = [S_COBackground CGColor];
    _goodsImg.layer.borderWidth = 1;
    _goodsImg.layer.cornerRadius = Scale750(4);
    _goodsImg.backgroundColor = [UIColor yellowColor];
    [bottomView addSubview:_goodsImg];
    [_goodsImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(bottomView.mas_centerY);
        make.left.mas_equalTo(Scale750(20));
        make.width.height.mas_equalTo(Scale750(120));
    }];
    /*
     * 商品名称
     */
    _goodsName = [[UILabel alloc] init];
    _goodsName.font = [UIFont systemFontOfSize:Scale750(30)];
    _goodsName.textColor = RGBColor(51, 51, 51);
    _goodsName.text = @"高山苹果 400g";
    [bottomView addSubview:_goodsName];
    [_goodsName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_goodsImg);
        make.left.mas_equalTo(self->_goodsImg.mas_right).mas_offset(Scale750(20));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 数量
     */
    _goodsNum = [[UILabel alloc] init];
    _goodsNum.font = [UIFont systemFontOfSize:Scale750(24)];
    _goodsNum.textColor = RGBColor(102, 102, 102);
    _goodsNum.text = @"数量: 1";
    [bottomView addSubview:_goodsNum];
    [_goodsNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_goodsName.mas_bottom).mas_offset(Scale750(5));
        make.left.mas_equalTo(self->_goodsName);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 商品价格
     */
    _goodsPrice = [[UILabel alloc] init];
    _goodsPrice.font = [UIFont systemFontOfSize:Scale750(30)];
    _goodsPrice.textColor = RGBColor(51, 51, 51);
    _goodsPrice.text = @"¥100.99";
    [bottomView addSubview:_goodsPrice];
    [_goodsPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self->_goodsImg.mas_bottom);
        make.left.mas_equalTo(self->_goodsName);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 适配
     */
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(bottomView.mas_bottom).mas_offset(Scale750(20));
    }];
}

@end
