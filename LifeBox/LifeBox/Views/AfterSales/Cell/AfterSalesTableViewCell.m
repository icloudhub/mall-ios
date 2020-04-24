//
//  AfterSalesTableViewCell.m
//  LifeBox
//
//  Created by admin on 2020/4/23.
//  Copyright © 2020 Lucky. All rights reserved.
//

#import "AfterSalesTableViewCell.h"
@implementation AfterSalesTableViewHeader
-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self confitUI];
    }
    return self;
}

-(void)confitUI{
    self.backgroundColor = UIColor.clearColor;
    [self addSubview:self.backImageView];
    [self addSubview:self.titleLab];
    
}
-(UILabel *)titleLab{
    if (!_titleLab ) {
        _titleLab = [UILabel new];
        _titleLab.text = @"ceshi";
    }
    return _titleLab;
}
-(UIView *)backImageView{
    if (!_backImageView) {
        
        _backImageView = [UIView new];
        _backImageView.backgroundColor = UIColor.whiteColor;
    }
    return _backImageView;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.backImageView);
        make.left.mas_equalTo(self.backImageView).mas_offset(KPAND_DEF);
        make.right.mas_equalTo(self.backImageView);
        make.bottom.mas_equalTo(self.backImageView);
    }];
    
    [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).mas_offset(KPAND_MIN);
        make.left.mas_equalTo(self);
        make.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self);
    }];
    [_backImageView ug_radius:S_Radius_MIN addcorners:UIRectCornerTopLeft |UIRectCornerTopRight];
}

@end
@implementation AfterSalesTableViewFoter
-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self confitUI];
    }
    return self;
}

-(void)confitUI{
    self.backgroundColor = UIColor.ug_random;
    [self ug_radius:S_Radius_MIN addcorners:UIRectCornerBottomLeft |UIRectCornerBottomRight];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}

@end
@implementation AfterSalesTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configUI];
    }
    return self;
}

-(void)configUI{
    self.backgroundColor = UIColor.whiteColor;
    [self.contentView addSubview:self.imgView];
    [self.contentView addSubview:self.titleLab];
    [self.contentView addSubview:self.countLab];
    [self.contentView addSubview:self.clickBtn];
}

-(UIImageView *)imgView{
    if (!_imgView) {
        _imgView = [UIImageView new];
        _imgView.backgroundColor = UIColor.ug_random;
        [_imgView ug_radius:4];
    }
    return _imgView;
}
-(UILabel *)titleLab{
    
    if (!_titleLab) {
        _titleLab = [UILabel new];
        _titleLab.text = @"商品描述";
        _titleLab.font = FONT_SYS14;
        _titleLab.textColor = COLOR23;
    }
    return _titleLab;
}
-(UILabel *)countLab{
    
    if (!_countLab) {
        _countLab = [UILabel new];
        _countLab.text = @"数量：1";
        _countLab.font = FONT_SYS12;
        _countLab.textColor = COLOR23;
    }
    return _countLab;
}
-(UIButton *)clickBtn{
    if (!_clickBtn) {
        _clickBtn = [UIButton new];
        _clickBtn.titleLabel.font = FONT_SYS14;
        [_clickBtn ug_radius:4];
        [_clickBtn setTitle:@"申请售后" forState:UIControlStateNormal];
        [_clickBtn setTitleColor:COLORPRIMARY forState:UIControlStateNormal];
        [_clickBtn ug_borderColor:COLORPRIMARY width:1];
    }
    return _clickBtn;
}



-(void)layoutSubviews{
    [super layoutSubviews];
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(KPAND_DEF).mas_offset(KPAND_DEF);
        make.centerY.mas_equalTo(self.contentView).mas_equalTo(-KPAND_MID);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgView);
        make.left.mas_equalTo(self.imgView.mas_right).mas_offset(KPAND_MIN);
    }];
    [_countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.imgView);
        make.left.mas_equalTo(self.imgView.mas_right).mas_offset(KPAND_MIN);
    }];
    [_clickBtn  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-KPAND_MIN);
        make.right.mas_equalTo(self.mas_right).mas_offset(-KPAND_DEF);
        make.width.mas_equalTo(100);
    }];
}

@end
