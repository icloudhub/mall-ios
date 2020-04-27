//
//  ProductDefBaseCell.m
//  BusinseeLifeBox
//
//  Created by admin on 2020/4/27.
//  Copyright © 2020 admin. All rights reserved.
//

#import "ProductDefBaseCell.h"

@implementation ProductDefAddCell
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}

-(void)configUI{
    [self addSubview:self.icon];
}
-(UIImageView *)icon{
    if (!_icon) {
        _icon = [UIImageView new];
        _icon.contentMode = UIViewContentModeCenter;
        [_icon setImage:[UIImage imageWithIcon:@"fa-plus" backgroundColor:UIColor.clearColor iconColor:UIColor.ug_random fontSize:40]];
    }
    return _icon;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}
@end

@implementation ProductDefBaseCell


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}

-(void)configUI{
    [self addSubview:self.typeLab];
}
-(UILabel *)typeLab{
    if (!_typeLab) {
        _typeLab = [UILabel new];
    }
    return _typeLab;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [_typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self);
        make.top.mas_equalTo(self);
        
    }];
}
@end
