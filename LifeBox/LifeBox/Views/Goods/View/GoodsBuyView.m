//
//  GoodsBuyView.m
//  LifeBox
//
//  Created by admin on 2019/11/9.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "GoodsBuyView.h"

@implementation GoodsBuyView


-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}
-(void)configUI{
    
    self.backgroundColor = UIColor.whiteColor;
    [self ug_Radius:S_Radius];
    [self ug_border:COLOREE white:1];
    self.homeBtn = [UIButton new];
    [self addSubview:_homeBtn];
     [_homeBtn setTitle:@"首页" forState:UIControlStateNormal];
    _homeBtn.titleLabel.font = FONT_SYS10;
    [_homeBtn setTitleColor:COLOR23 forState:UIControlStateNormal];
    
    self.shopcarBtn = [UIButton new];
    [self addSubview:_shopcarBtn];
    [_shopcarBtn setTitle:@"购物车" forState:UIControlStateNormal];
    _shopcarBtn.titleLabel.font = FONT_SYS10;
    [_shopcarBtn setTitleColor:COLOR23 forState:UIControlStateNormal];
    
    self.likeBtn = [UIButton new];
    [self addSubview:_likeBtn];
    [_likeBtn setTitle:@"关注" forState:UIControlStateNormal];
    _likeBtn.titleLabel.font = FONT_SYS10;
    [_likeBtn setImage:UG_IMAGE(@"ic_public_welfare") forState:UIControlStateNormal];
    [_likeBtn setTitleColor:COLOR23 forState:UIControlStateNormal];
    
    self.addcarBtn = [UIButton new];
    [self addSubview:_addcarBtn];
    [_addcarBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
     _addcarBtn.titleLabel.font = FONT_SYS14;
    self.buyNowBtn = [UIButton new];
    [self addSubview:_buyNowBtn];
    [_buyNowBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    _buyNowBtn.titleLabel.font = FONT_SYS14;
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.backgroundColor = UIColor.ug_random;
    }];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [_homeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(SPanding_DEF);
        make.centerY.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [_shopcarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(self.homeBtn.mas_right).mas_offset(SPanding_DEF);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [_likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(self.shopcarBtn.mas_right).mas_offset(SPanding_DEF);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [_addcarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(80, 40));
        make.right.mas_equalTo(self.buyNowBtn.mas_left);
    }];
    [_buyNowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.right.mas_equalTo(-SPanding_DEF);
        make.size.mas_equalTo(CGSizeMake(80, 40));
    }];
}
@end
