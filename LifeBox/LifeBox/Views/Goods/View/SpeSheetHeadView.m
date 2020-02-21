//
//  SpeSheetHeadView.m
//  LifeBox
//
//  Created by admin on 2020/2/18.
//  Copyright © 2020 Lucky. All rights reserved.
//

#import "SpeSheetHeadView.h"

@implementation SpeSheetHeadView



-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}

-(void)configUI{
    [self addSubview:self.titleLab];
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [UILabel new];
    }
    return _titleLab;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}

@end
