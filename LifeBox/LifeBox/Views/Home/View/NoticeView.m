//
//  NoticeView.m
//  LifeBox
//
//  Created by Lucky on 2019/8/26.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NoticeView.h"
#import "HomeData.h"
@implementation NoticeView

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
     * 广告喇叭
     */
    UIImageView *hornImg = [[UIImageView alloc] init];
    hornImg.image = [UIImage imageNamed:@"ic_notice"];
    [self addSubview:hornImg];
    [hornImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(Scale750(40));
        make.centerY.mas_equalTo(self);
        make.width.height.mas_equalTo(Scale750(48));
    }];
    /*
     * 更多Btn
     */
    UIButton *moreBtn = [[UIButton alloc] init];
    moreBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(24)];
    [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
    [moreBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    [moreBtn setTitleColor:S_COGreenText forState:UIControlStateNormal];
    [self addSubview:moreBtn];
    [moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(-Scale750(40));
        make.width.mas_equalTo(Scale750(80));
        make.height.mas_equalTo(self);
    }];
    /*
     * 通知内容
     */
    self.noticeLab = [[UILabel alloc] init];
    _noticeLab.font = [UIFont systemFontOfSize:Scale750(30)];
    _noticeLab.textColor = RGBColor(51, 51, 51);
    _noticeLab.text = @"最近农家新品蔬菜上市了";
    [self addSubview:_noticeLab];
    [_noticeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(hornImg.mas_right).mas_offset(Scale750(20));
        make.right.mas_equalTo(moreBtn.mas_left).mas_offset(-Scale750(20));
        make.centerY.mas_equalTo(self);
        make.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 分隔线
     */
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = S_COBackground;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-1);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
}

//刷新数据
-(void)reload:(NSArray*)arr{
    HomeNotiData *data = arr.firstObject;
    _noticeLab.text = data.title;
  
}
@end
