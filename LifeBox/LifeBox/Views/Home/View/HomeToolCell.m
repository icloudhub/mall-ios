//
//  HomeToolCell.m
//  LifeBox
//
//  Created by Lucky on 2019/8/26.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "HomeToolCell.h"

@implementation HomeToolCell

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 功能图片
     */
    _toolImg = [[UIImageView alloc] init];
    [self addSubview:_toolImg];
    [_toolImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self).mas_offset(-Scale750(20));
        make.width.height.mas_equalTo(Scale750(98));
    }];
    /*
     * 功能文字
     */
    _titleLab = [[UILabel alloc] init];
    _titleLab.font = [UIFont systemFontOfSize:Scale750(24)];
    _titleLab.textColor = RGBColor(51, 51, 51);
    [self addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_toolImg.mas_bottom).mas_offset(Scale750(10));
        make.centerX.mas_equalTo(self);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
}

#pragma mark - 刷新UI
- (void)reloadCellUIWithData:(HomeToolData *)data {

    [_toolImg sd_setImageWithURL:UG_URL(data.logo)];
    _titleLab.text = data.name;
}

@end
