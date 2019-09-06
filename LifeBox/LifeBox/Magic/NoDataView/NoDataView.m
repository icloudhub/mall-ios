//
//  NoDataView.m
//  LifeBox
//
//  Created by Lucky on 2019/9/1.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NoDataView.h"

@implementation NoDataView {
    ///图片
    UIImageView *imgView;
    ///标题
    UILabel *titleLab;
    ///按钮
    UIButton *btn;
}

#pragma mark - 初始化
//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self createNoDataView];
//    }
//    return self;
//}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self createNoDataView];
    }
    return self;
}

#pragma mark - 创建UI
- (void)createNoDataView {
    /*
     * 图片
     */
    imgView = [[UIImageView alloc] init];
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY).mas_equalTo(-Scale750(80));
        make.width.mas_equalTo(Scale750(320));
        make.height.mas_equalTo(Scale750(260));
    }];
    /*
     * 文字
     */
    titleLab = [[UILabel alloc] init];
    titleLab.numberOfLines = 2;
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.font = [UIFont systemFontOfSize:Scale750(30)];
    titleLab.textColor = [UIColor grayColor];
    [self addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->imgView.mas_bottom).mas_offset(Scale750(20));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(Scale750(520));
        make.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 按钮
     */
    btn = [[UIButton alloc] init];
    btn.titleLabel.font = [UIFont systemFontOfSize:Scale750(32)];
    [btn setBackgroundColor:S_COGreenBack];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.layer.cornerRadius = Scale750(30);
    btn.userInteractionEnabled = YES;
    [self addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->titleLab.mas_bottom).mas_offset(Scale750(50));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(Scale750(180));
        make.height.mas_equalTo(Scale750(60));
    }];
    [btn bk_addEventHandler:^(id sender) {
        if (self->_btnBlock) {
            self->_btnBlock();
        }
    } forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 赋值
- (void)setImgName:(NSString *)imgName {
    imgView.image = [UIImage imageNamed:imgName];
}

- (void)setTitleStr:(NSString *)titleStr {
    titleLab.text = titleStr;
}

- (void)setBtnStr:(NSString *)btnStr {
    [btn setTitle:btnStr forState:UIControlStateNormal];
}

@end
