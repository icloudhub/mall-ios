//
//  GenderSheet.m
//  LifeBox
//
//  Created by Lucky on 2019/9/24.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "GenderSheet.h"

@implementation GenderSheet {
    ///标题
    UILabel *titleLab;
    //男按钮
    UIButton *manBtn;
    //女按钮
    UIButton *womanBtn;
}

#pragma mark - 高度
- (NSInteger)viewHeight {
    return Scale750(280);
}

#pragma mark - 视图布局
- (void)makeSubview {
    /*
     * 标题
     */
    titleLab = [[UILabel alloc] init];
    titleLab.font = [UIFont systemFontOfSize:Scale750(32)];
    titleLab.text = @"性别";
    [self.bottomView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.bottomView);
        make.top.mas_equalTo(Scale750(30));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 男按钮
     */
    manBtn = [[UIButton alloc] init];
    [manBtn setBackgroundImage:[UIImage imageNamed:@"ic_zhishiqi_select"] forState:UIControlStateNormal];
    [manBtn setBackgroundImage:[UIImage imageNamed:@"ic_zhishiqi_select"] forState:UIControlStateHighlighted];
    manBtn.tag = 100;
    [manBtn addTarget:self action:@selector(chooseBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:manBtn];
    [manBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.bottomView.mas_centerX).mas_equalTo(-Scale750(10));
        make.top.mas_equalTo(titleLab.mas_bottom).mas_offset(Scale750(40));
        make.width.height.mas_equalTo(Scale750(35));
    }];
    /*
     * 男
     */
    UILabel *manLab = [[UILabel alloc] init];
    manLab.font = [UIFont systemFontOfSize:Scale750(32)];
    manLab.text = @"男";
    [self.bottomView addSubview:manLab];
    [manLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(manBtn);
        make.left.mas_equalTo(self.bottomView.mas_centerX).mas_equalTo(Scale750(10));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 女按钮
     */
    womanBtn = [[UIButton alloc] init];
    [womanBtn setBackgroundImage:[UIImage imageNamed:@"ic_zhishiqi"] forState:UIControlStateNormal];
    [womanBtn setBackgroundImage:[UIImage imageNamed:@"ic_zhishiqi"] forState:UIControlStateHighlighted];
    womanBtn.tag = 101;
    [womanBtn addTarget:self action:@selector(chooseBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:womanBtn];
    [womanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(manBtn.mas_bottom).mas_offset(Scale750(30));
        make.centerX.mas_equalTo(manBtn);
        make.width.height.mas_equalTo(Scale750(35));
    }];
    /*
     * 女
     */
    UILabel *womanLab = [[UILabel alloc] init];
    womanLab.font = [UIFont systemFontOfSize:Scale750(32)];
    womanLab.text = @"女";
    [self.bottomView addSubview:womanLab];
    [womanLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(manLab);
        make.centerY.mas_equalTo(womanBtn);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
}

#pragma mark - 选择Btn点击
- (void)chooseBtnClicked:(UIButton *)btn {
    if (btn.tag == 100) {
        [manBtn setBackgroundImage:[UIImage imageNamed:@"ic_zhishiqi_select"] forState:UIControlStateNormal];
        [manBtn setBackgroundImage:[UIImage imageNamed:@"ic_zhishiqi_select"] forState:UIControlStateHighlighted];
        [womanBtn setBackgroundImage:[UIImage imageNamed:@"ic_zhishiqi"] forState:UIControlStateNormal];
        [womanBtn setBackgroundImage:[UIImage imageNamed:@"ic_zhishiqi"] forState:UIControlStateHighlighted];
    }else{
        [manBtn setBackgroundImage:[UIImage imageNamed:@"ic_zhishiqi"] forState:UIControlStateNormal];
        [manBtn setBackgroundImage:[UIImage imageNamed:@"ic_zhishiqi"] forState:UIControlStateHighlighted];
        [womanBtn setBackgroundImage:[UIImage imageNamed:@"ic_zhishiqi_select"] forState:UIControlStateNormal];
        [womanBtn setBackgroundImage:[UIImage imageNamed:@"ic_zhishiqi_select"] forState:UIControlStateHighlighted];
    }
}

@end
