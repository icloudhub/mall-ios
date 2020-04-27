//
//  SetPasswordController.m
//  LifeBox
//
//  Created by Lucky on 2019/9/23.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "SetPasswordController.h"

@interface SetPasswordController () {
    ///新密码
    UILabel *newPwLab;
    ///确认密码
    UILabel *surePwLab;
    ///新密码输入
    UITextField *newPwTF;
    ///确认密码输入
    UITextField *surePwTF;
    ///提示
    UILabel *titleLab;
    ///确定
    UIButton *sureBtn;
}

@end

@implementation SetPasswordController

#pragma mark - 视图层
- (void)viewDidLoad {
    [super viewDidLoad];
    if ([_typeStr isEqualToString:@"0"]) {
        [self setTitle:@"设置密码"];
    }else{
        [self setTitle:@"修改密码"];
    }
    self.view.backgroundColor = S_COBackground;
    [self createUI];
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 底部View
     */
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(90));
    }];
    /*
     * 新密码提示
     */
    newPwLab = [[UILabel alloc] init];
    newPwLab.font = [UIFont systemFontOfSize:Scale750(30)];
    newPwLab.textColor = RGBColor(51, 51, 51);
    newPwLab.text = @"新密码";
    [topView addSubview:newPwLab];
    [newPwLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(topView);
        make.left.mas_equalTo(Scale750(30));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 新密码输入
     */
    newPwTF = [[UITextField alloc] init];
    newPwTF.borderStyle = UITextBorderStyleNone;
    newPwTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    newPwTF.textColor = RGBColor(51, 51, 51);
    NSString *newHolder = @"请输入密码";
    NSMutableAttributedString *placeNew = [[NSMutableAttributedString alloc] initWithString:newHolder];
    [placeNew addAttribute:NSForegroundColorAttributeName
                        value:RGBColor(189, 189, 189)
                        range:NSMakeRange(0, newHolder.length)];
    [placeNew addAttribute:NSFontAttributeName
                        value:[UIFont boldSystemFontOfSize:Scale750(30)]
                        range:NSMakeRange(0, newHolder.length)];
    newPwTF.attributedPlaceholder = placeNew;
    [topView addSubview:newPwTF];
    [newPwTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(Scale750(220));
        make.right.mas_equalTo(-Scale750(20));
        make.height.mas_equalTo(Scale750(90));
    }];
    /*
     * 分割线
     */
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = S_COBackground;
    [topView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(topView);
        make.height.mas_equalTo(1);
    }];
    /*
     * 底部View
     */
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topView.mas_bottom).mas_offset(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(90));
    }];
    /*
     * 确认密码提示
     */
    surePwLab = [[UILabel alloc] init];
    surePwLab.font = [UIFont systemFontOfSize:Scale750(30)];
    surePwLab.textColor = RGBColor(51, 51, 51);
    surePwLab.text = @"确认新密码";
    [bottomView addSubview:surePwLab];
    [surePwLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(bottomView);
        make.left.mas_equalTo(Scale750(30));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 确认密码输入
     */
    surePwTF = [[UITextField alloc] init];
    surePwTF.borderStyle = UITextBorderStyleNone;
    surePwTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    surePwTF.textColor = RGBColor(51, 51, 51);
    NSString *sureHolder = @"请输入密码";
    NSMutableAttributedString *placeSure = [[NSMutableAttributedString alloc] initWithString:sureHolder];
    [placeSure addAttribute:NSForegroundColorAttributeName
                        value:RGBColor(189, 189, 189)
                        range:NSMakeRange(0, sureHolder.length)];
    [placeSure addAttribute:NSFontAttributeName
                        value:[UIFont boldSystemFontOfSize:Scale750(30)]
                        range:NSMakeRange(0, sureHolder.length)];
    surePwTF.attributedPlaceholder = placeSure;
    [bottomView addSubview:surePwTF];
    [surePwTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(Scale750(220));
        make.right.mas_equalTo(-Scale750(20));
        make.height.mas_equalTo(Scale750(90));
    }];
    /*
     * 提示
     */
    titleLab = [[UILabel alloc] init];
    titleLab.font = [UIFont systemFontOfSize:Scale750(24)];
    titleLab.textColor = RGBColor(189, 189, 189);
    titleLab.numberOfLines = 0;
    titleLab.text = @"密码由8—16位字符，字母或符号组成，至少含有2种及以上的字符";
    [self.view addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bottomView.mas_bottom).mas_offset(Scale750(20));
        make.left.mas_equalTo(Scale750(30));
        make.right.mas_equalTo(-Scale750(30));
        make.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 确认Btn
     */
    sureBtn = [[UIButton alloc] init];
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    sureBtn.layer.cornerRadius = Scale750(40);
    [sureBtn setBackgroundColor:S_COGreenBackNoClick];
    [sureBtn setTitle:@"确认" forState:UIControlStateNormal];
    [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:sureBtn];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLab.mas_bottom).mas_offset(Scale750(120));
        make.left.mas_equalTo(Scale750(30));
        make.right.mas_equalTo(-Scale750(30));
        make.height.mas_equalTo(Scale750(80));
    }];
}


@end
