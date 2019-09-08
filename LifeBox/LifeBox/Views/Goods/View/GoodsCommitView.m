//
//  GoodsCommitView.m
//  LifeBox
//
//  Created by admin on 2019/9/7.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "GoodsCommitView.h"

@implementation GoodsCommitView
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}

-(void)configUI{
    self.buybtn = [UIButton new];
    [self addSubview:_buybtn];
    [_buybtn setTitle:@"立即购买" forState:UIControlStateNormal];
    _buybtn.backgroundColor = UIColor.ug_random;
    self.addcarbtn = [UIButton new];
    [self addSubview:_addcarbtn];
    [_addcarbtn setTitle:@"加入购物车" forState:UIControlStateNormal];
    _addcarbtn.backgroundColor = UIColor.ug_random;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [_buybtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).mas_offset(-S_Defmargin);
        make.top.bottom.mas_equalTo(self);
        make.width.mas_equalTo(120);
    }];
    [_addcarbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.buybtn.mas_left);
        make.top.bottom.mas_equalTo(self);
        make.width.mas_equalTo(120);
    }];
}
@end
