//
//  OrderViewCell.m
//  LifeBox
//
//  Created by Lucky on 2019/9/6.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "OrderViewCell.h"

@implementation OrderViewCell {
    UIView *bottomView;
}

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
    bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor whiteColor];
    bottomView.layer.cornerRadius = Scale750(20);
    [self.contentView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(30));
        make.left.mas_equalTo(Scale750(20));
        make.right.mas_equalTo(-Scale750(20));
        make.height.mas_greaterThanOrEqualTo(100);
    }];
    /*
     * 订单号
     */
    _orderNumLab = [[UILabel alloc] init];
    _orderNumLab.font = [UIFont systemFontOfSize:Scale750(30)];
    _orderNumLab.textColor = RGBColor(51, 51, 51);
    _orderNumLab.text = @"单号: 1000000000";
    [bottomView addSubview:_orderNumLab];
    [_orderNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(15));
        make.left.mas_equalTo(Scale750(20));
        make.width.height.mas_greaterThanOrEqualTo(0);
//        make.height.mas_equalTo(Scale750(30));
    }];
    /*
     * 时间
     */
    _timeLab = [[UILabel alloc] init];
    _timeLab.font = [UIFont systemFontOfSize:Scale750(24)];
    _timeLab.textColor = RGBColor(189, 189, 189);
    _timeLab.text = @"2019-09-08 00:00:00";
    [bottomView addSubview:_timeLab];
    [_timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_orderNumLab.mas_bottom).mas_offset(Scale750(10));
        make.left.mas_equalTo(self->_orderNumLab);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 状态Lab
     */
    _stateLab = [[UILabel alloc] init];
    _stateLab.font = [UIFont systemFontOfSize:Scale750(30)];
    _stateLab.textColor = S_COGreenText;
    _stateLab.text = @"待付款";
    [bottomView addSubview:_stateLab];
    [_stateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-Scale750(20));
        make.centerY.mas_equalTo(self->_orderNumLab.mas_bottom);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 状态图片
     */
    _stateImg = [[UIImageView alloc] init];
    _stateImg.layer.cornerRadius = Scale750(45);
    _stateImg.backgroundColor = [UIColor yellowColor];
    _stateImg.hidden = YES;
    [bottomView addSubview:_stateImg];
    [_stateImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-Scale750(20));
        make.centerY.mas_equalTo(self->_orderNumLab.mas_bottom);
        make.width.height.mas_equalTo(Scale750(90));
    }];
    /*
     * 上分割线
     */
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = S_COBackground;
    [bottomView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_timeLab.mas_bottom).mas_offset(Scale750(15));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
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
        make.top.mas_equalTo(lineView.mas_bottom).mas_offset(Scale750(15));
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
        make.top.mas_equalTo(lineView.mas_bottom).mas_offset(Scale750(20));
        make.left.mas_equalTo(self->_goodsImg.mas_right).mas_offset(Scale750(20));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 商品购买数量
     */
    _goodsNum = [[UILabel alloc] init];
    _goodsNum.font = [UIFont systemFontOfSize:Scale750(24)];
    _goodsNum.textColor = RGBColor(189, 189, 189);
    _goodsNum.text = @"数量: 1";
    [bottomView addSubview:_goodsNum];
    [_goodsNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_goodsName.mas_bottom).mas_offset(Scale750(10));
        make.left.mas_equalTo(self->_goodsName);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 单个价格
     */
    _goodsPrice = [[UILabel alloc] init];
    _goodsPrice.font = [UIFont systemFontOfSize:Scale750(30)];
    _goodsPrice.textColor = RGBColor(51, 51, 51);
    _goodsPrice.text = @"¥1.99";
    [bottomView addSubview:_goodsPrice];
    [_goodsPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView.mas_bottom).mas_offset(Scale750(20));
        make.right.mas_equalTo(-Scale750(20));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 商品应付价格
     */
    _allPrice = [[UILabel alloc] init];
    _allPrice.font = [UIFont systemFontOfSize:Scale750(30)];
    _allPrice.textColor = RGBColor(51, 51, 51);
    _allPrice.textAlignment = NSTextAlignmentRight;
    NSString *tempStr = @"应付款: ¥1.99";
    _allPrice.attributedText = [tempStr strChangFlagWithStr:@"¥1.99" Color:RGBColor(51, 51, 51) Font:Scale750(38)];
    [bottomView addSubview:_allPrice];
    [_allPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_goodsImg.mas_bottom).mas_offset(Scale750(30));
        make.right.mas_equalTo(-Scale750(20));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 商品件数
     */
    _goodsAllNum = [[UILabel alloc] init];
    _goodsAllNum.font = [UIFont systemFontOfSize:Scale750(30)];
    _goodsAllNum.textColor = RGBColor(51, 51, 51);
    _goodsAllNum.text = @"共1件商品";
    [bottomView addSubview:_goodsAllNum];
    [_goodsAllNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self->_allPrice.mas_left).mas_offset(-Scale750(30));
        make.bottom.mas_equalTo(self->_allPrice.mas_bottom).mas_offset(-Scale750(2));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 下分割线
     */
    UIView *lineView1 = [[UIView alloc] init];
    lineView1.backgroundColor = S_COBackground;
    [bottomView addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_goodsAllNum.mas_bottom).mas_offset(Scale750(20));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    /*
     * 右边Btn
     */
    _rightBtn = [[UIButton alloc] init];
    _rightBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    _rightBtn.layer.cornerRadius = Scale750(30);
    _rightBtn.layer.borderWidth = 1;
    _rightBtn.hidden = YES;
    _rightBtn.layer.borderColor = [S_COGreenBack CGColor];
    [_rightBtn setTitleColor:S_COGreenText forState:UIControlStateNormal];
    [_rightBtn setTitle:@"去支付" forState:UIControlStateNormal];
    [bottomView addSubview:_rightBtn];
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView1.mas_bottom).mas_offset(Scale750(20));
        make.right.mas_equalTo(-Scale750(20));
        make.width.mas_equalTo(Scale750(170));
        make.height.mas_equalTo(Scale750(60));
    }];
    /*
     * 左边Btn
     */
    _leftBtn = [[UIButton alloc] init];
    _leftBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    _leftBtn.layer.cornerRadius = Scale750(30);
    _leftBtn.layer.borderWidth = 1;
    _leftBtn.hidden = YES;
    _leftBtn.layer.borderColor = [RGBColor(102, 102, 102) CGColor];
    [_leftBtn setTitleColor:RGBColor(102, 102, 102) forState:UIControlStateNormal];
    [_leftBtn setTitle:@"取消订单" forState:UIControlStateNormal];
    [bottomView addSubview:_leftBtn];
    [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_rightBtn);
        make.right.mas_equalTo(self->_rightBtn.mas_left).mas_offset(-Scale750(20));
        make.width.mas_equalTo(Scale750(170));
        make.height.mas_equalTo(Scale750(60));
    }];
    /*
     * 其他Btn
     */
    _otherBtn = [[UIButton alloc] init];
    _otherBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    _otherBtn.layer.cornerRadius = Scale750(30);
    _otherBtn.layer.borderWidth = 1;
    _otherBtn.layer.borderColor = [S_COGreenBack CGColor];
    [_otherBtn setTitleColor:S_COGreenText forState:UIControlStateNormal];
    [_otherBtn setTitle:@"删除" forState:UIControlStateNormal];
    [bottomView addSubview:_otherBtn];
    [_otherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView1.mas_bottom).mas_offset(Scale750(20));
        make.right.mas_equalTo(-Scale750(20));
        make.width.mas_equalTo(Scale750(120));
        make.height.mas_equalTo(Scale750(60));
    }];
    /*
     * 适配
     */
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(lineView1.mas_bottom).mas_offset(Scale750(100));
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top);
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.bottom.mas_equalTo(self->bottomView.mas_bottom);
    }];
}


@end
