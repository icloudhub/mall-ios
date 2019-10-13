//
//  ChangeNameController.m
//  LifeBox
//
//  Created by Lucky on 2019/9/24.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "ChangeNameController.h"

@interface ChangeNameController () {
    ///输入View
    UIView *inputView;
    ///输入框
    UITextField *infoTF;
    ///提示Lab
    UILabel *titleLab;
    ///保存按钮
    UIButton *sureBtn;
}

@end

@implementation ChangeNameController

#pragma mark - 视图层
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setWhiteNaviWithTitle:@"修改姓名"];
    self.view.backgroundColor = S_COBackground;
    [self createUI];
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 输入View
     */
    inputView = [[UIView alloc] init];
    inputView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:inputView];
    /*
     * 输入框
     */
    infoTF = [[UITextField alloc] init];
    infoTF.borderStyle = UITextBorderStyleNone;
    infoTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    infoTF.textColor = RGBColor(51, 51, 51);
    NSString *nameHolder = @"请输入姓名";
    NSMutableAttributedString *placeName = [[NSMutableAttributedString alloc] initWithString:nameHolder];
    [placeName addAttribute:NSForegroundColorAttributeName
                        value:RGBColor(189, 189, 189)
                        range:NSMakeRange(0, nameHolder.length)];
    [placeName addAttribute:NSFontAttributeName
                        value:[UIFont boldSystemFontOfSize:Scale750(30)]
                        range:NSMakeRange(0, nameHolder.length)];
    infoTF.attributedPlaceholder = placeName;
    infoTF.font = [UIFont systemFontOfSize:Scale750(30)];
    [inputView addSubview:infoTF];
    /*
     * 提示
     */
    titleLab = [[UILabel alloc] init];
    titleLab.font = [UIFont systemFontOfSize:Scale750(24)];
    titleLab.textColor = RGBColor(189, 189, 189);
    titleLab.numberOfLines = 0;
    titleLab.text = @"姓名要求为2—15个汉字(简体中文)";
    [self.view addSubview:titleLab];
    /*
     * 确认Btn
     */
    sureBtn = [[UIButton alloc] init];
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    sureBtn.layer.cornerRadius = Scale750(40);
    [sureBtn setBackgroundColor:S_COGreenBackNoClick];
    [sureBtn setTitle:@"保存" forState:UIControlStateNormal];
    [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:sureBtn];
}

#pragma mark - 适配
- (void)viewLayoutMarginsDidChange {
    [super viewLayoutMarginsDidChange];
    [inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(90));
    }];
    [infoTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(Scale750(30));
        make.right.mas_equalTo(-Scale750(30));
        make.height.mas_equalTo(Scale750(90));
    }];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(inputView.mas_bottom).mas_offset(Scale750(20));
        make.left.mas_equalTo(Scale750(30));
        make.right.mas_equalTo(-Scale750(30));
        make.height.mas_greaterThanOrEqualTo(0);
    }];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLab.mas_bottom).mas_offset(Scale750(120));
        make.left.mas_equalTo(Scale750(30));
        make.right.mas_equalTo(-Scale750(30));
        make.height.mas_equalTo(Scale750(80));
    }];
}

@end
