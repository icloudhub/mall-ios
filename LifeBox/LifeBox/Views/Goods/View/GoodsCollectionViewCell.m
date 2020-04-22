//
//  GoodsCollectionViewCell.m
//  LifeBox
//
//  Created by admin on 2020/4/13.
//  Copyright © 2020 Lucky. All rights reserved.
//

#import "GoodsCollectionViewCell.h"

@implementation GoodsCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self confitUI];
    }
    return self;
}

-(void)confitUI{
    [self addSubview:self.bodyView];
    [self.bodyView addSubview:self.imageView];
    [self.bodyView addSubview:self.titleLab];
    [self.bodyView addSubview:self.priceLab];
}

-(UIView *)bodyView{
    if (!_bodyView) {
        _bodyView = [UIView new];
        [_bodyView ug_radius:S_Radius_MIN];
        _bodyView.backgroundColor = UIColor.whiteColor;
    }
    return _bodyView;
}

-(UIImageView *)imageView{
    if (!_imageView) {
        
        _imageView = [UIImageView new];
        _imageView.image = [UIImage imageWithIcon:@"fa-github" backgroundColor:UIColor.clearColor iconColor:UIColor.ug_random andSize:CGSizeMake(120, 120)];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_imageView ug_borderColor:COLOREE width:0.5];
//        [_imageView ug_shadowColor:COLOREE width:10];
    }
    return _imageView;
}

-(UILabel *)titleLab{
    
    if (!_titleLab) {
        _titleLab = [UILabel new];
        _titleLab.text = @"天热无公害，香水梨天热无公害，香水梨天热无公害，香水梨";
        _titleLab.textColor = COLOR23;
        _titleLab.numberOfLines = 2;
        _titleLab.font = FONT_SYS14;
    }
    return _titleLab;
}


-(UILabel *)priceLab{
    
    if (!_priceLab) {
        _priceLab = [UILabel new];
        _priceLab.text = @"¥ 0.99";
        _priceLab.textColor = UIColor.redColor;
        _priceLab.font = FONT_SYS16;
    }
    return _priceLab;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [_bodyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(SPanding_MIN);
        make.right.mas_equalTo(-SPanding_MIN);
        make.top.mas_equalTo(SPanding_MIN);
        make.bottom.mas_equalTo(0);
    }];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(Screen_width/2);
    }];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageView.mas_bottom).mas_offset(SPanding_MIN);
        make.right.mas_equalTo(-SPanding_MIN);
        make.left.mas_equalTo(SPanding_MIN);
    }];
    [_priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLab.mas_bottom).mas_offset(SPanding_MIN);
        make.right.mas_equalTo(-SPanding_MIN);
        make.left.mas_equalTo(SPanding_MIN);
        make.bottom.mas_equalTo(-SPanding_MIN);
    }];
}
@end
