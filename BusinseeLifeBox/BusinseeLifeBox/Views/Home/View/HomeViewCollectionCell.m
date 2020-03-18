//
//  HomeViewCollectionCell.m
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/18.
//  Copyright © 2020 admin. All rights reserved.
//

#import "HomeViewCollectionCell.h"

@implementation RemarkLabView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self confitUI];
    }
    return self;
}

-(void)confitUI{
    [self addSubview:self.titleLab];
    [self addSubview:self.valueLab];
}
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [UILabel new];
        _titleLab.textColor = [UIColor whiteColor];
        _titleLab.font = FONT_SYS12;
    }
    return _titleLab;
}
-(UILabel *)valueLab{
    if (!_valueLab) {
        _valueLab = [UILabel new];
        _valueLab.textColor = [UIColor whiteColor];
        _valueLab.font = FONT_SYS12;
    }
    return _valueLab;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.mas_centerY).mas_offset(-KPAND_MIN);
        make.left.mas_equalTo(self);
    }];
    [_valueLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_centerY).mas_offset(KPAND_MIN);
        make.left.mas_equalTo(self);
        make.width.mas_equalTo(self);
        
    }];
}
@end

@implementation HomeViewCollectionCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self confitUI];
    }
    return self;
}

-(void)confitUI{
    self.backgroundColor = COLOR_DEF;
    [self ug_radius:5];
    [self ug_shadowColor:[UIColor ug_hexString:@"0x000000"] width:4];
    [self.contentView addSubview:self.amountaView];
    [self.contentView addSubview:self.visitorView];
    [self.contentView addSubview:self.addvisitorView];
    [self.contentView addSubview:self.orderView];
}

-(RemarkLabView *)amountaView{
    if (!_amountaView) {
        _amountaView = [RemarkLabView new];
        _amountaView.titleLab.text = @"今日交易额(元)";
        _amountaView.valueLab.text = @"0.00";
        _amountaView.titleLab.font = FONT_SYS14;
        _amountaView.valueLab.font = FONT_BSYS20;
    }
    return _amountaView;
}
-(RemarkLabView *)visitorView{
    if (!_visitorView) {
        _visitorView = [RemarkLabView new];
        _visitorView.titleLab.text = @"今日访客";
        _visitorView.valueLab.text = @"0";
    }
    return _visitorView;
}
-(RemarkLabView *)addvisitorView{
    if (!_addvisitorView) {
        _addvisitorView = [RemarkLabView new];
        _addvisitorView.titleLab.text = @"新增关注";
        _addvisitorView.valueLab.text = @"0";
    }
    return _addvisitorView;
}
-(RemarkLabView *)orderView{
    if (!_orderView) {
        _orderView = [RemarkLabView new];
        _orderView.titleLab.text = @"7日订单";
        _orderView.valueLab.text = @"0";
    }
    return _orderView;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [_amountaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).mas_offset(KAutoAcale(10));
        make.left.mas_equalTo(self.contentView).mas_offset(KAutoAcale(10));
        make.height.mas_equalTo(100);
    }];
    [_visitorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView).mas_offset(KAutoAcale(-10));
        make.left.mas_equalTo(self.contentView).mas_offset(KAutoAcale(10));
        make.height.mas_equalTo(60);
        make.width.lessThanOrEqualTo(@180);
        make.width.greaterThanOrEqualTo(@80);
    }];
    [_addvisitorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView).mas_offset(KAutoAcale(-10));
        make.centerX.mas_equalTo(self.contentView);
        make.height.mas_equalTo(60);
        make.width.lessThanOrEqualTo(@180);
        make.width.greaterThanOrEqualTo(@80);
    }];
    [_orderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView).mas_offset(KAutoAcale(-10));
        make.right.mas_equalTo(self.contentView).mas_offset(KAutoAcale(-10));
        make.height.mas_equalTo(60);
        make.width.lessThanOrEqualTo(@180);
        make.width.greaterThanOrEqualTo(@80);
    }];
}
@end

@implementation HomeViewCollectionToDoCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self confitUI];
    }
    return self;
}

-(void)confitUI{
    [self ug_borderColor:COLOR_EE width:0.5];
    [self ug_radius:5];
    [self ug_shadowColor:[UIColor ug_hexString:@"0x000000"] width:4];
    [self addSubview:self.titleLab];
    [self addSubview:self.valueLab];
}
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [UILabel new];
        _titleLab.textColor = COLOR_23;
        _titleLab.font = FONT_SYS12;
        _titleLab.text = @"待办事项";
    }
    return _titleLab;
}
-(UILabel *)valueLab{
    if (!_valueLab) {
        _valueLab = [UILabel new];
        _valueLab.textColor = COLOR_23;
        _valueLab.font = FONT_SYS12;
        _valueLab.text = @"0";
    }
    return _valueLab;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.left.mas_equalTo(self).mas_offset(KPAND_DEF);
    }];
    [_valueLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.titleLab);
        make.left.mas_equalTo(self.titleLab.mas_right).mas_offset(KPAND_MIN);
    }];
}
@end

@implementation HomeViewCollectionBandleCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self confitUI];
    }
    return self;
}

-(void)confitUI{
    [self ug_borderColor:COLOR_EE width:0.5];
    [self.contentView ug_radius:5];
//    [self ug_shadowColor:[UIColor ug_hexString:@"0x000000"] width:4];
    [self.contentView addSubview:self.imageView];

}
-(UILabel *)imageView{
    if (!_imageView) {
        _imageView = [UIImageView new];

    }
    return _imageView;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
}


@end
