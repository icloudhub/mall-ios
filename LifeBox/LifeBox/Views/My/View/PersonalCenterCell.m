//
//  PersonalCenterCell.m
//  LifeBox
//
//  Created by Lucky on 2019/8/22.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "PersonalCenterCell.h"

@implementation PersonalCenterCell

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createCellUI];
    }
    return self;
}

#pragma mark - 创建UI
- (void)createCellUI {
    _img = [[UIImageView alloc] init];
    [self addSubview:_img];
    [_img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self.mas_centerY).mas_offset(-Scale750(15));
        make.width.height.mas_equalTo(Scale750(60));
    }];
    _title = [[UILabel alloc] init];
    _title.font = [UIFont systemFontOfSize:Scale750(28)];
    _title.textColor = [UIColor grayColor];
    [self addSubview:_title];
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self->_img.mas_bottom).mas_offset(Scale750(10));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
}

#pragma mark - 刷新UI
- (void)reloadCellUIWithData:(PersonIconData *)data {
    _img.image = [UIImage imageNamed:data.imgStr];
    _title.text = data.titleStr;
}

@end
