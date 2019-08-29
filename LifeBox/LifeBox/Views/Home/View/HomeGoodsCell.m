//
//  HomeGoodsCell.m
//  LifeBox
//
//  Created by Lucky on 2019/8/27.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "HomeGoodsCell.h"

@implementation HomeGoodsCell

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
     * 底部分割线
     */
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = S_COLine;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-1);
        make.height.mas_equalTo(1);
    }];
    /*
     * 商品图片
     */
    _goodsImg = [[UIImageView alloc] init];
    _goodsImg.backgroundColor = [UIColor redColor];
    [self addSubview:_goodsImg];
    [_goodsImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(Scale750(30));
        make.centerY.mas_equalTo(self);
        make.width.height.mas_equalTo(Scale750(170));
    }];
    /*
     * 商品名称
     */
    _goodsLab = [[UILabel alloc] init];
    _goodsLab.font = [UIFont systemFontOfSize:Scale750(30)];
    _goodsLab.numberOfLines = 1;
    _goodsLab.text = @"农家土养乌鸡";
    [self addSubview:_goodsLab];
    [_goodsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->_goodsImg.mas_right).mas_offset(Scale750(40));
        make.top.mas_equalTo(self->_goodsImg).mas_offset(Scale750(10));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 商品描述
     */
    _goodsTitle = [[UILabel alloc] init];
    _goodsTitle.font = [UIFont systemFontOfSize:Scale750(28)];
    _goodsTitle.textColor = RGBColor(189, 189, 189);
    _goodsTitle.numberOfLines = 1;
    _goodsTitle.text = @"规格: 1kg/只";
    [self addSubview:_goodsTitle];
    [_goodsTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->_goodsLab);
        make.top.mas_equalTo(self->_goodsLab.mas_bottom).mas_offset(Scale750(20));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 货币符号
     */
    UILabel *symbolLab = [[UILabel alloc] init];
    symbolLab.textColor = RGBColor(235, 62, 49);
    symbolLab.text = @"¥";
    symbolLab.font = [UIFont systemFontOfSize:Scale750(26)];
    [self addSubview:symbolLab];
    [symbolLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->_goodsTitle);
        make.bottom.mas_equalTo(self->_goodsImg.mas_bottom).mas_offset(0);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 商品价格
     */
    _goodsMoney = [[UILabel alloc] init];
    _goodsMoney.textColor = RGBColor(235, 62, 49);
    NSString *tempStr = @"8.00";
    _goodsMoney.font = [UIFont systemFontOfSize:Scale750(38)];
    _goodsMoney.attributedText = [tempStr strChangFlagWithStr:@".00" Color:RGBColor(235, 62, 49) Font:Scale750(24)];
    [self addSubview:_goodsMoney];
    [_goodsMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(symbolLab.mas_right).mas_offset(Scale750(5));
        make.bottom.mas_equalTo(symbolLab.mas_bottom).mas_offset(Scale750(3));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 原价
     */
    _original = [[UILabel alloc] init];
    _original.font = [UIFont systemFontOfSize:Scale750(22)];
    _original.textColor = RGBColor(189, 189, 189);
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle], NSForegroundColorAttributeName:RGBColor(189, 189, 189)};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc] initWithString:@"¥10.00" attributes:attribtDic];
    _original.attributedText = attribtStr;
    [self addSubview:_original];
    [_original mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->_goodsMoney.mas_right).mas_offset(Scale750(10));
        make.centerY.mas_equalTo(self->_goodsMoney.mas_centerY).mas_offset(Scale750(6));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 添加Btn
     */
    _addBtn = [[UIButton alloc] init];
    [_addBtn setBackgroundImage:[UIImage imageNamed:@"ic_add_to"] forState:UIControlStateNormal];
    [_addBtn setBackgroundImage:[UIImage imageNamed:@"ic_add_to"] forState:UIControlStateHighlighted];
    [self addSubview:_addBtn];
    [_addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-Scale750(40));
        make.bottom.mas_equalTo(-Scale750(30));
        make.width.height.mas_equalTo(Scale750(44));
    }];
}

@end
