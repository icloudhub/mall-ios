//
//  ProductDefSelectCell.m
//  BusinseeLifeBox
//
//  Created by admin on 2020/4/27.
//  Copyright © 2020 admin. All rights reserved.
//

#import "ProductDefSelectCell.h"

@implementation ProductDefSelectCell
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}

-(void)configUI{
    [self addSubview:self.clickBtn];
}
-(UIButton *)clickBtn{
    if (!_clickBtn) {
        _clickBtn = [UIButton new];
        _clickBtn.userInteractionEnabled = NO;
    }
    return _clickBtn;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [_clickBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}
@end
