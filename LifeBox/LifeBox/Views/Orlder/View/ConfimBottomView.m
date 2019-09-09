//
//  ConfimBottomView.m
//  LifeBox
//
//  Created by admin on 2019/9/8.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "ConfimBottomView.h"

@implementation ConfimBottomView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}

-(void)configUI{
    self.commitBtn = [UIButton new];
    [self addSubview:_commitBtn];
    [_commitBtn setTitle:@"去支付" forState:UIControlStateNormal];
    
    self.amountLab = [UILabel new];
    [self addSubview:_amountLab];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.mas_equalTo(self);
        make.width.mas_equalTo(140);
    }];
    
    [_amountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.mas_equalTo(self);
        make.width.mas_equalTo(140);
    }];
}

@end
