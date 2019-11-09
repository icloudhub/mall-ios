//
//  ChangePhoneController.m
//  LifeBox
//
//  Created by Lucky on 2019/9/24.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "ChangePhoneController.h"
#import "SetPhoneController.h"

@interface ChangePhoneController () {
    ///获取验证码Btn
    UIButton *codeBtn;
    ///验证码输入
    UITextField *codeTF;
    ///确认Btn
    UIButton *sureBtn;
    ///获取验证码Key
    NSString *keyStr;
}

@end

@implementation ChangePhoneController

#pragma mark - 视图层
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setWhiteNaviWithTitle:@"更改手机号"];
    self.view.backgroundColor = S_COBackground;
    keyStr = @"ChangePhoneControllerKey";
    [self createUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationDoit) name:APPTIMEINFORMATION object:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.view endEditing:YES];
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 提示Lab
     */
    UILabel *tipLab = [[UILabel alloc] init];
    tipLab.font = [UIFont systemFontOfSize:Scale750(24)];
    tipLab.textColor = S_CORedText;
    tipLab.text = @"提示: 手机号是我们联系您的主要方式，请谨慎填写";
    tipLab.numberOfLines = 0;
    [self.view addSubview:tipLab];
    [tipLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(30));
        make.left.mas_equalTo(Scale750(30));
        make.right.mas_equalTo(-Scale750(30));
        make.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 上边View
     */
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(tipLab.mas_bottom).mas_offset(Scale750(30));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(90));
    }];
    /*
     * 原手机号码
     */
    UILabel *oldLab = [[UILabel alloc] init];
    oldLab.font = [UIFont systemFontOfSize:Scale750(30)];
    oldLab.textColor = RGBColor(189, 189, 189);
    oldLab.text = @"原手机号";
    [topView addSubview:oldLab];
    [oldLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(topView);
        make.left.mas_equalTo(Scale750(30));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 手机号码
     */
    UILabel *phoneLab = [[UILabel alloc] init];
    phoneLab.font = [UIFont systemFontOfSize:Scale750(30)];
    phoneLab.textColor = RGBColor(51, 51, 51);
    phoneLab.text = [@"13812341234" stringByReplacingAsteriskWithRange:NSMakeRange(3, 4)];
    [topView addSubview:phoneLab];
    [phoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(topView);
        make.left.mas_equalTo(Scale750(220));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 分割线
     */
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = COLOREE;
    [topView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    /*
     * 底部View
     */
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(90));
    }];
    /*
     * 验证码
     */
    UILabel *verLab = [[UILabel alloc] init];
    verLab.font = [UIFont systemFontOfSize:Scale750(30)];
    verLab.textColor = RGBColor(189, 189, 189);
    verLab.text = @"验证码";
    [bottomView addSubview:verLab];
    [verLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(bottomView);
        make.left.mas_equalTo(Scale750(30));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 获取验证码Btn
     */
    codeBtn = [[UIButton alloc] init];
    codeBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    [codeBtn setTitleColor:S_COGreenText forState:UIControlStateNormal];
    [codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    codeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [bottomView addSubview:codeBtn];
    [codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(bottomView);
        make.right.mas_equalTo(-Scale750(30));
        make.width.mas_equalTo(Scale750(200));
        make.height.mas_greaterThanOrEqualTo(0);
    }];
    [codeBtn bk_addEventHandler:^(id sender) {
        [self codeBtnClicked];
    } forControlEvents:UIControlEventTouchUpInside];
    /*
     * 验证码输入
     */
    codeTF = [[UITextField alloc] init];
    codeTF.font = [UIFont systemFontOfSize:Scale750(30)];
    codeTF.keyboardType = UIKeyboardTypeNumberPad;
    codeTF.borderStyle = UITextBorderStyleNone;
    codeTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    codeTF.textColor = RGBColor(51, 51, 51);
    NSString *codeHolder = @"请输入验证码";
    NSMutableAttributedString *placeCode = [[NSMutableAttributedString alloc] initWithString:codeHolder];
    [placeCode addAttribute:NSForegroundColorAttributeName
                      value:RGBColor(189, 189, 189)
                      range:NSMakeRange(0, codeHolder.length)];
    [placeCode addAttribute:NSFontAttributeName
                      value:[UIFont boldSystemFontOfSize:Scale750(30)]
                      range:NSMakeRange(0, codeHolder.length)];
    codeTF.attributedPlaceholder = placeCode;
    [bottomView addSubview:codeTF];
    [codeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(bottomView);
        make.left.mas_equalTo(Scale750(220));
        make.right.mas_equalTo(codeBtn.mas_left).mas_offset(-Scale750(20));
        make.height.mas_equalTo(Scale750(90));
    }];
    /*
     * 确认按钮
     */
    sureBtn = [[UIButton alloc] init];
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    sureBtn.layer.cornerRadius = Scale750(40);
    [sureBtn setBackgroundColor:S_COGreenBackNoClick];
    [sureBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:sureBtn];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bottomView.mas_bottom).mas_offset(Scale750(120));
        make.left.mas_equalTo(Scale750(30));
        make.right.mas_equalTo(-Scale750(30));
        make.height.mas_equalTo(Scale750(80));
    }];
    [sureBtn bk_addEventHandler:^(id sender) {
        [self nextBtnClicked];
    } forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 获取验证码Btn点击
- (void)codeBtnClicked {
    [AppDelegate addObjectIndateDic:self->keyStr];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationDoit) name:APPTIMEINFORMATION object:nil];
}

#pragma mark - 下一步Btn点击
- (void)nextBtnClicked {
    SetPhoneController *setPhone = [[SetPhoneController alloc] init];
    [self.navigationController pushViewController:setPhone animated:YES];
}

#pragma mark - 验证码监听
- (void)notificationDoit {
    NSInteger codeNum = [AppDelegate getimeIntervalBy:keyStr wirhMax:30];
    if (codeNum > 0) {
        codeBtn.userInteractionEnabled = NO;
        [codeBtn setTitle:[NSString stringWithFormat:@"重新获取(%ld)", (long)codeNum] forState:UIControlStateNormal];
    }else{
        codeBtn.userInteractionEnabled = YES;
        [codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [AppDelegate removeObjectKey:keyStr];
    }
}

@end
