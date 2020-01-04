//
//  SingleView.m
//  LifeBox
//
//  Created by Lucky on 2019/12/29.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "SingleView.h"

@implementation SingleView {
    ///商品图片
    UIImageView *goodsImg;
    ///商品名称
    UILabel *goodsName;
}

#pragma mark - 初始化
- (instancetype)init {
    self = [super init];
    if (self) {
        [self createUI];
    }
    return self;
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 商品图片
     */
    goodsImg = [[UIImageView alloc] init];
    goodsImg.layer.borderColor = [S_COBackground CGColor];
    goodsImg.layer.borderWidth = 1;
    goodsImg.layer.cornerRadius = Scale750(4);
    goodsImg.backgroundColor = [UIColor yellowColor];
    [self addSubview:goodsImg];
    [goodsImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(15));
        make.left.mas_equalTo(Scale750(20));
        make.width.height.mas_equalTo(Scale750(120));
    }];
    /*
     * 商品名称
     */
    goodsName = [[UILabel alloc] init];
    goodsName.font = [UIFont systemFontOfSize:Scale750(30)];
    goodsName.textColor = RGBColor(51, 51, 51);
    goodsName.text = @"高山苹果 400g";
    [self addSubview:goodsName];
    [goodsName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(20));
        make.left.mas_equalTo(self->goodsImg.mas_right).mas_offset(Scale750(20));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    
}

@end
