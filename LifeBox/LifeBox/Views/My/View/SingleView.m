//
//  SingleView.m
//  LifeBox
//
//  Created by Lucky on 2019/12/29.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "SingleView.h"

@implementation SingleView {

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
    self.goodsImg = [[UIImageView alloc] init];
    _goodsImg.layer.borderColor = [S_COBackground CGColor];
    _goodsImg.layer.borderWidth = 1;
    _goodsImg.layer.cornerRadius = Scale750(4);
    _goodsImg.backgroundColor = [UIColor yellowColor];
    [self addSubview:_goodsImg];
    [_goodsImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(15));
        make.left.mas_equalTo(Scale750(20));
        make.width.height.mas_equalTo(Scale750(120));
    }];
    /*
     * 商品名称
     */
    self.goodsName = [[UILabel alloc] init];
    _goodsName.font = [UIFont systemFontOfSize:Scale750(30)];
    _goodsName.textColor = RGBColor(51, 51, 51);
    _goodsName.text = @"高山苹果 400g";
    [self addSubview:_goodsName];
    [_goodsName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(20));
        make.left.mas_equalTo(self.goodsName.mas_right).mas_offset(Scale750(20));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    
}

@end
