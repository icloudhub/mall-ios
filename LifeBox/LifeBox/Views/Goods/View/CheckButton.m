//
//  CheckButton.m
//  LifeBox
//
//  Created by Lucky on 2019/11/15.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "CheckButton.h"

@implementation CheckButton {
    ///图片
    UIImageView *imgView;
    ///文字
    UILabel *title;
}

#pragma mark - 初始化
- (instancetype)initWithType:(CheckType)type {
    self = [super init];
    if (self) {
        [self createUIWith:type];
    }
    return self;
}

#pragma mark - 创建UI
- (void)createUIWith:(CheckType)type {
    if (type == top) {
        [self imgTopUI];
    }
}

#pragma mark - 图片在上
- (void)imgTopUI {
    /*
     * 图片
     */
    imgView = [[UIImageView alloc] init];
    [self addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.bottom.mas_equalTo(self.mas_centerY).mas_offset(Scale750(10));
        make.width.height.mas_equalTo(Scale750(44));
    }];
    /*
     * 文字
     */
    title = [[UILabel alloc] init];
    title.font = [UIFont systemFontOfSize:Scale750(20)];
    title.textColor = RGBColor(51, 51, 51);
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(imgView.mas_bottom).mas_offset(Scale750(3));
        make.width.height.mas_greaterThanOrEqualTo(Scale750(10));
    }];
}

#pragma mark - 赋值
- (void)setImgStr:(NSString *)imgStr {
    imgView.image = [UIImage imageNamed:imgStr];
}

- (void)setTitleStr:(NSString *)titleStr {
    title.text = titleStr;
}

@end
