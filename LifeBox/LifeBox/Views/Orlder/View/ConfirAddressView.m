//
//  ConfirAddressView.m
//  LifeBox
//
//  Created by admin on 2019/9/8.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "ConfirAddressView.h"

@implementation ConfirAddressView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}

-(void)configUI{
    self.addLab = [UILabel new];
    [self addSubview:_addLab];
    _addLab.numberOfLines = 0;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [_addLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}

@end

