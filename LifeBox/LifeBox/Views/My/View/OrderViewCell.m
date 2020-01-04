//
//  OrderViewCell.m
//  LifeBox
//
//  Created by Lucky on 2019/9/6.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "OrderViewCell.h"
#import "MultipleView.h"
#import "SingleView.h"

@implementation OrderViewCell {
    UIView *bottomView;
    UIView *lineView;
    UIView *lineView1;
    ///单个商品展示view
    SingleView *singleView;
    ///多个商品展示view
    MultipleView *multipleView;
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
    /*
     * 订单号
     */
    _orderNumLab = [[UILabel alloc] init];
    _orderNumLab.font = [UIFont systemFontOfSize:Scale750(30)];
    _orderNumLab.textColor = RGBColor(51, 51, 51);
    _orderNumLab.text = @"单号: 1000000000";
    [bottomView addSubview:_orderNumLab];
    /*
     * 时间
     */
    _timeLab = [[UILabel alloc] init];
    _timeLab.font = [UIFont systemFontOfSize:Scale750(24)];
    _timeLab.textColor = RGBColor(189, 189, 189);
    _timeLab.text = @"2019-09-08 00:00:00";
    [bottomView addSubview:_timeLab];
    /*
     * 状态Lab
     */
    _stateLab = [[UILabel alloc] init];
    _stateLab.font = [UIFont systemFontOfSize:Scale750(30)];
    _stateLab.textColor = S_COGreenText;
    _stateLab.text = @"待付款";
    [bottomView addSubview:_stateLab];
    /*
     * 状态图片
     */
    _stateImg = [[UIImageView alloc] init];
    _stateImg.layer.cornerRadius = Scale750(45);
    _stateImg.backgroundColor = [UIColor yellowColor];
    _stateImg.hidden = YES;
    [bottomView addSubview:_stateImg];
    /*
     * 上分割线
     */
    lineView = [[UIView alloc] init];
    lineView.backgroundColor = S_COBackground;
    [bottomView addSubview:lineView];
    /*
     * 单个商品展现View
     */
    singleView = [[SingleView alloc] init];
    singleView.backgroundColor = [UIColor whiteColor];
    [bottomView addSubview:singleView];
    [singleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView.mas_bottom).mas_offset(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(150));
    }];
    singleView.hidden = YES;
    /*
     * 多个商品展现View
     */
    multipleView = [[MultipleView alloc] init];
    multipleView.backgroundColor = [UIColor whiteColor];
    multipleView.dataArr = nil;
    [bottomView addSubview:multipleView];
    [multipleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView.mas_bottom).mas_offset(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(150));
    }];
    multipleView.hidden = NO;
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
    /*
     * 商品件数
     */
    _goodsAllNum = [[UILabel alloc] init];
    _goodsAllNum.font = [UIFont systemFontOfSize:Scale750(30)];
    _goodsAllNum.textColor = RGBColor(51, 51, 51);
    _goodsAllNum.text = @"共1件商品";
    [bottomView addSubview:_goodsAllNum];
    /*
     * 下分割线
     */
    lineView1 = [[UIView alloc] init];
    lineView1.backgroundColor = S_COBackground;
    [bottomView addSubview:lineView1];
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
    /*
     * 适配
     */
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(30));
        make.left.mas_equalTo(Scale750(20));
        make.right.mas_equalTo(-Scale750(20));
        make.height.mas_equalTo(Scale750(444));
    }];
    [_orderNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(15));
        make.left.mas_equalTo(Scale750(20));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    [_timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_orderNumLab.mas_bottom).mas_offset(Scale750(10));
        make.left.mas_equalTo(self->_orderNumLab);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    [_stateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-Scale750(20));
        make.centerY.mas_equalTo(self->_orderNumLab.mas_bottom);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    [_stateImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-Scale750(20));
        make.centerY.mas_equalTo(self->_orderNumLab.mas_bottom);
        make.width.height.mas_equalTo(Scale750(90));
    }];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_timeLab.mas_bottom).mas_offset(Scale750(15));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    [_allPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->singleView.mas_bottom).mas_offset(Scale750(15));
        make.right.mas_equalTo(-Scale750(20));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    [_goodsAllNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self->_allPrice.mas_left).mas_offset(-Scale750(30));
        make.bottom.mas_equalTo(self->_allPrice.mas_bottom).mas_offset(-Scale750(2));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_goodsAllNum.mas_bottom).mas_offset(Scale750(20));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView1.mas_bottom).mas_offset(Scale750(20));
        make.right.mas_equalTo(-Scale750(20));
        make.width.mas_equalTo(Scale750(170));
        make.height.mas_equalTo(Scale750(60));
    }];
    [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_rightBtn);
        make.right.mas_equalTo(self->_rightBtn.mas_left).mas_offset(-Scale750(20));
        make.width.mas_equalTo(Scale750(170));
        make.height.mas_equalTo(Scale750(60));
    }];
    [_otherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView1.mas_bottom).mas_offset(Scale750(20));
        make.right.mas_equalTo(-Scale750(20));
        make.width.mas_equalTo(Scale750(120));
        make.height.mas_equalTo(Scale750(60));
    }];
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
