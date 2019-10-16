//
//  ShoppingCarCell.m
//  LifeBox
//
//  Created by Lucky on 2019/8/28.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "ShoppingCarCell.h"

@implementation ShoppingCarCell

#pragma mark - 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = S_COBackground;
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
    [self addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(240));
    }];
    /*
     * 选择Btn
     */
    _chooseBtn = [[UIButton alloc] init];
    _chooseBtn.layer.borderWidth = 1;
    _chooseBtn.layer.borderColor = [RGBColor(189, 189, 189) CGColor];
    _chooseBtn.layer.cornerRadius = Scale750(18);
    [bottomView addSubview:_chooseBtn];
    [_chooseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(Scale750(30));
        make.centerY.mas_equalTo(bottomView);
        make.width.height.mas_equalTo(Scale750(36));
    }];
    /*
     * 商品图片
     */
    _goodsImg = [[UIImageView alloc] init];
    _goodsImg.backgroundColor = [UIColor blueColor];
    [bottomView addSubview:_goodsImg];
    [_goodsImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->_chooseBtn.mas_right).mas_offset(Scale750(30));
        make.centerY.mas_equalTo(bottomView);
        make.width.height.mas_equalTo(Scale750(180));
    }];
    /*
     * 商品名称
     */
    _goodsName = [[UILabel alloc] init];
    _goodsName.textColor = RGBColor(51, 51, 51);
    _goodsName.font = [UIFont systemFontOfSize:Scale750(30)];
    _goodsName.numberOfLines = 1;
    _goodsName.text = @"高山苹果 200g";
    [bottomView addSubview:_goodsName];
    [_goodsName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_goodsImg);
        make.left.mas_equalTo(self->_goodsImg.mas_right).mas_offset(Scale750(30));
        make.right.mas_equalTo(self).mas_offset(-SPanding_DEF);
//        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 商品描述
     */
    _goodsTitle = [[UILabel alloc] init];
    _goodsTitle.textColor = RGBColor(189, 189, 189);
    _goodsTitle.font = [UIFont systemFontOfSize:Scale750(24)];
    _goodsTitle.numberOfLines = 2;
    _goodsTitle.text = @"果色艳丽，果肉鲜美";
    [bottomView addSubview:_goodsTitle];
    [_goodsTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->_goodsName);
        make.top.mas_equalTo(self->_goodsName.mas_bottom).mas_offset(Scale750(10));
        make.right.mas_equalTo(self).mas_offset(-SPanding_DEF);
//        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 规格
     */
    _speciLab = [[UILabel alloc] init];
    _speciLab.textColor = RGBColor(153, 153, 153);
    _speciLab.font = [UIFont systemFontOfSize:Scale750(20)];
    _speciLab.numberOfLines = 1;
    _speciLab.text = @"规格: 400/盒";
    [bottomView addSubview:_speciLab];
    /*
     * 货币符号
     */
    UILabel *symbolLab = [[UILabel alloc] init];
    symbolLab.textColor = RGBColor(235, 62, 49);
    symbolLab.text = @"¥";
    symbolLab.font = [UIFont systemFontOfSize:Scale750(26)];
    [bottomView addSubview:symbolLab];
    [symbolLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->_goodsName);
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
//        make.width.height.mas_greaterThanOrEqualTo(0);
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
     * 数量区域
     */
    UIView *numView = [[UIView alloc] init];
    numView.layer.borderColor = [RGBColor(229, 229, 229) CGColor];
    numView.layer.borderWidth = 0.5;
    [bottomView addSubview:numView];
    [numView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-Scale750(30));
        make.right.mas_equalTo(-Scale750(40));
        make.height.mas_equalTo(Scale750(44));
        make.width.mas_equalTo(Scale750(155));
    }];
    /*
     * 加号Btn
     */
    _addBtn = [[UIButton alloc] init];
    [_addBtn setBackgroundImage:[UIImage imageNamed:@"ic_plus"] forState:UIControlStateNormal];
    [_addBtn setBackgroundImage:[UIImage imageNamed:@"ic_plus"] forState:UIControlStateHighlighted];
    [_addBtn addTarget:self action:@selector(cellAddBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [numView addSubview:_addBtn];
    [_addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(numView);
        make.right.mas_equalTo(numView.mas_right);
        make.width.height.mas_equalTo(Scale750(44));
    }];
    /*
     * 减号Btn
     */
    _reduceBtn = [[UIButton alloc] init];
    [_reduceBtn setBackgroundImage:[UIImage imageNamed:@"ic_less"] forState:UIControlStateNormal];
    [_reduceBtn setBackgroundImage:[UIImage imageNamed:@"ic_less"] forState:UIControlStateHighlighted];
    [_reduceBtn addTarget:self action:@selector(cellReduceBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [numView addSubview:_reduceBtn];
    [_reduceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(numView);
        make.left.mas_equalTo(numView.mas_left);
        make.width.height.mas_equalTo(Scale750(44));
    }];
    /*
     * 数量
     */
    _numLab = [[UILabel alloc] init];
    _numLab.textColor = RGBColor(51, 51, 51);
    _numLab.font = [UIFont systemFontOfSize:Scale750(30)];
    _numLab.textAlignment = NSTextAlignmentCenter;
    _numLab.text = @"10";
    [numView addSubview:_numLab];
    [_numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.height.mas_equalTo(numView);
        make.left.mas_equalTo(self->_reduceBtn.mas_right);
        make.right.mas_equalTo(self->_addBtn.mas_left);
    }];
}

#pragma mark - 添加Btn点击
- (void)cellAddBtnClicked:(UIButton *)sender {
    if ([_delegate respondsToSelector:@selector(addBtnClicked:)]) {
        [_delegate addBtnClicked:sender];
    }
}

#pragma mark - 减少Btn点击
- (void)cellReduceBtnClicked:(UIButton *)sender {
    int num = [_numLab.text intValue];
    if (num < 1) {
        return;
    }
    if ([_delegate respondsToSelector:@selector(reduceBtnClicked:)]) {
        [_delegate reduceBtnClicked:sender];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [_speciLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->_goodsName);
        make.bottom.mas_equalTo(self.goodsMoney.mas_top);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
}
@end
