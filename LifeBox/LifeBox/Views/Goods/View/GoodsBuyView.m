//
//  GoodsBuyView.m
//  LifeBox
//
//  Created by admin on 2019/11/9.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "GoodsBuyView.h"

@implementation GoodsBuyView {
    ///上分割线
    UIView *topLine;
    ///填充View
    UIView *tempView1;
    ///填充View
    UIView *tempView2;
}

#pragma mark - 初始化
- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
        [self configUI];
    }
    return self;
}

#pragma mark - 创建UI
-(void)configUI {
    /*
     * 上分割线
     */
    topLine = [[UIView alloc] init];
    topLine.backgroundColor = S_COBackground;
    [self addSubview:topLine];
    /*
     * 填充View
     */
    tempView1 = [[UIView alloc] init];
    tempView1.backgroundColor = S_COGreenBack;
    [self addSubview:tempView1];
    /*
     * 立即购买Btn
     */
    _buyNowBtn = [[UIButton alloc] init];
    _buyNowBtn.backgroundColor = S_COGreenBack;
    _buyNowBtn.layer.cornerRadius = Scale750(30);
    _buyNowBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(26)];
    [_buyNowBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_buyNowBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    _buyNowBtn.tag = 1000;
    [_buyNowBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_buyNowBtn];
    /*
     * 填充View
     */
    tempView2 = [[UIView alloc] init];
    tempView2.backgroundColor = RGBColor(133, 222, 223);
    [self addSubview:tempView2];
    /*
     * 加入购物车
     */
    _addcarBtn = [[UIButton alloc] init];
    _addcarBtn.backgroundColor = RGBColor(133, 222, 223);
    _addcarBtn.layer.cornerRadius = Scale750(30);
    _addcarBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(26)];
    [_addcarBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_addcarBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
    _addcarBtn.tag = 1001;
    [_addcarBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_addcarBtn];
    /*
     * 去首页Btn
     */
//    _homeBtn = [[CheckButton alloc] initWithType:top];
//    _homeBtn.imgStr = @"ic_shop_home";
//    _homeBtn.titleStr = @"首页";
//    _homeBtn.tag = 1002;
//    [_homeBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:_homeBtn];
    /*
     * 购物车
     */
    _shopcarBtn = [[CheckButton alloc] initWithType:top];
    _shopcarBtn.imgStr = @"ic_shop_cart";
    _shopcarBtn.titleStr = @"购物车";
    _shopcarBtn.tag = 1002;
    [_shopcarBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_shopcarBtn];
    /*
     * 关注
     */
    _likeBtn = [[CheckButton alloc] initWithType:top];
    _likeBtn.imgStr = @"ic_shoucang_def";
    _likeBtn.titleStr = @"收藏";
    _likeBtn.tag = 1003;
    [_likeBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_likeBtn];
}

#pragma mark - UI适配
-(void)layoutSubviews {
    [super layoutSubviews];
    [topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    [tempView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(15));
        make.right.mas_equalTo(-Scale750(160));
        make.width.mas_equalTo(Scale750(30));
        make.height.mas_equalTo(Scale750(60));
    }];
    [_buyNowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(tempView1);
        make.width.mas_equalTo(Scale750(160));
        make.height.mas_equalTo(Scale750(60));
    }];
    [tempView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.height.mas_equalTo(tempView1);
        make.right.mas_equalTo(tempView1.mas_left);
    }];
    [_addcarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.mas_equalTo(tempView2);
        make.width.mas_equalTo(Scale750(170));
        make.height.mas_equalTo(Scale750(60));
    }];
//    [_homeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(0);
//        make.left.mas_equalTo(Scale750(20));
//        make.width.height.mas_equalTo(Scale750(90));
//    }];
    [_shopcarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(Scale750(20));
        make.width.height.mas_equalTo(Scale750(90));
    }];
    [_likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.height.mas_equalTo(_shopcarBtn);
        make.left.mas_equalTo(_shopcarBtn.mas_right).mas_offset(Scale750(10));
    }];
}

#pragma mark - 按钮事件
- (void)btnClicked:(UIButton *)btn {
    if ([_delegate respondsToSelector:@selector(buyViewBtnClicked:)]) {
        [_delegate buyViewBtnClicked:btn.tag];
    }
}

@end
