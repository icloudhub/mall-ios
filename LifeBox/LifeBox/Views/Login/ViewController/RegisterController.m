//
//  RegisterController.m
//  LifeBox
//
//  Created by Lucky on 2019/11/13.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "RegisterController.h"

@interface RegisterController ()<UITextFieldDelegate> {
    ///设定倒计时Key
    NSString *keyStr;
}

///手机号码输入
@property (strong, nonatomic) BaseTextField *phoneTF;
///验证码输入
@property (strong, nonatomic) BaseTextField *codeTF;
///密码输入
@property (strong, nonatomic) BaseTextField *passwdTF;
///邀请码输入
@property (strong, nonatomic) BaseTextField *invitaTF;
///注册Btn
@property (strong, nonatomic) UIButton *registerBtn;
///获取验证码Btn
@property (strong, nonatomic) UIButton *codeBtn;

@end


@implementation RegisterController

#pragma mark - 视图层
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    /*
     * 初始化数据
     */
    keyStr = @"RegisterControllerKey";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationDoit) name:APPTIMEINFORMATION object:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.view endEditing:YES];
}

#pragma mark - 创建UI
-(void)createUI {
    /*
     * 关闭Btn
     */
    UIButton *clostBtn = [[UIButton alloc] init];
    [clostBtn setBackgroundImage:[UIImage imageNamed:@"ic_closeImage"] forState:UIControlStateNormal];
    [clostBtn setBackgroundImage:[UIImage imageNamed:@"ic_closeImage"] forState:UIControlStateHighlighted];
    [self.view addSubview:clostBtn];
    [clostBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(Scale750(50));
        make.top.mas_equalTo(SAFE_Top+ Scale750(20));
        make.width.height.mas_equalTo(Scale750(40));
    }];
    [clostBtn bk_addEventHandler:^(id sender) {
        [self.navigationController popViewControllerAnimated:NO];
    } forControlEvents:UIControlEventTouchUpInside];
    /*
     * 登录标题
     */
    UILabel *titlLab = [[UILabel alloc] init];
    titlLab.font = [UIFont systemFontOfSize:Scale750(60)];
    titlLab.textColor = RGBColor(51, 51, 51);
    titlLab.text = @"手机号注册";
    [self.view addSubview:titlLab];
    [titlLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(Scale750(60));
        make.top.mas_equalTo(clostBtn.mas_bottom).mas_offset(Scale750(130));
        make.width.height.mas_greaterThanOrEqualTo(10);
    }];
    /*
     * 分割线1
     */
    UIView *line1 = [[UIView alloc] init];
    line1.backgroundColor = COLOREE;
    [self.view addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titlLab.mas_bottom).mas_offset(Scale750(230));
        make.left.mas_equalTo(Scale750(60));
        make.right.mas_equalTo(-Scale750(60));
        make.height.mas_equalTo(1);
    }];
    /*
     * 手机号输入
     */
    _phoneTF = [[BaseTextField alloc] init];
    _phoneTF.borderStyle = UITextBorderStyleNone;
    _phoneTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _phoneTF.keyboardType = UIKeyboardTypeDefault;
    _phoneTF.font = [UIFont systemFontOfSize:Scale750(30)];
    _phoneTF.placeholder = @"请输入手机号码";
    _phoneTF.delegate = self;
    [self.view addSubview:_phoneTF];
    [_phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(line1.mas_top);
        make.left.mas_equalTo(line1.mas_left).mas_offset(Scale750(10));
        make.right.mas_equalTo(line1.mas_right).mas_offset(-Scale750(10));
        make.height.mas_equalTo(Scale750(80));
    }];
    /*
     * 分割线2
     */
    UIView *line2 = [[UIView alloc] init];
    line2.backgroundColor = COLOREE;
    [self.view addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(line1.mas_bottom).mas_offset(Scale750(110));
        make.left.right.height.mas_equalTo(line1);
    }];
    /*
     * 获取验证码按钮
     */
    _codeBtn = [[UIButton alloc] init];
    _codeBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(24)];
    [_codeBtn setTitleColor:RGBColor(51, 51, 51) forState:UIControlStateNormal];
    [_codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    _codeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self.view addSubview:_codeBtn];
    [_codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(line2.mas_top);
        make.right.mas_equalTo(line2.mas_right).mas_offset(-Scale750(10));
        make.width.mas_equalTo(Scale750(280));
        make.height.mas_equalTo(Scale750(80));
    }];
    [_codeBtn bk_addEventHandler:^(id sender) {
        [self.view endEditing:YES];
        if (self.phoneTF.text.length == 0) {
            return;
        }else{
            if (self.phoneTF.text.length < 11) {
                [self.view ug_msg:@"手机号码有误"];
                return;
            }
        }
        [self getCodeHttpWith:self->_phoneTF.text];
    } forControlEvents:UIControlEventTouchUpInside];
    /*
     * 验证码输入框
     */
    _codeTF = [[BaseTextField alloc] init];
    _codeTF.borderStyle = UITextBorderStyleNone;
    _codeTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _codeTF.keyboardType = UIKeyboardTypeNumberPad;
    _codeTF.font = [UIFont systemFontOfSize:Scale750(30)];
    _codeTF.placeholder = @"验证码";
    _codeTF.delegate = self;
    [self.view addSubview:_codeTF];
    [_codeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(line2.mas_top);
        make.left.mas_equalTo(line2.mas_left).mas_offset(Scale750(10));
        make.right.mas_equalTo(_codeBtn.mas_left).mas_offset(-Scale750(10));
        make.height.mas_equalTo(Scale750(80));
    }];
    /*
     * 分割线3
     */
    UIView *line3 = [[UIView alloc] init];
    line3.backgroundColor = COLOREE;
    [self.view addSubview:line3];
    [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(line2.mas_bottom).mas_offset(Scale750(110));
        make.left.right.height.mas_equalTo(line1);
    }];
    /*
     * 密码输入
     */
    _passwdTF = [[BaseTextField alloc] init];
    _passwdTF = [[BaseTextField alloc] init];
    _passwdTF.borderStyle = UITextBorderStyleNone;
    _passwdTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _passwdTF.keyboardType = UIKeyboardTypeDefault;
    _passwdTF.font = [UIFont systemFontOfSize:Scale750(30)];
    _passwdTF.placeholder = @"设置密码(6-15位数字与字母)";
    _passwdTF.secureTextEntry = YES;
    _passwdTF.delegate = self;
    [self.view addSubview:_passwdTF];
    [_passwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(line3.mas_top);
        make.left.mas_equalTo(line3.mas_left).mas_offset(Scale750(10));
        make.right.mas_equalTo(line3.mas_right).mas_offset(-Scale750(10));
        make.height.mas_equalTo(Scale750(80));
    }];
    /*
     * 分割线
     */
    UIView *line4 = [[UIView alloc] init];
    line4.backgroundColor = COLOREE;
    [self.view addSubview:line4];
    [line4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(line3.mas_bottom).mas_offset(Scale750(110));
        make.left.right.height.mas_equalTo(line1);
    }];
    /*
     * 邀请码输入
     */
    _invitaTF = [[BaseTextField alloc] init];
    _invitaTF.borderStyle = UITextBorderStyleNone;
    _invitaTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _invitaTF.keyboardType = UIKeyboardTypeDefault;
    _invitaTF.font = [UIFont systemFontOfSize:Scale750(30)];
    _invitaTF.placeholder = @"邀请码(选填)";
    _invitaTF.delegate = self;
    _invitaTF.text = @"9OKWQA";
    [self.view addSubview:_invitaTF];
    [_invitaTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(line4.mas_top);
        make.left.mas_equalTo(line4.mas_left).mas_offset(Scale750(10));
        make.right.mas_equalTo(line4.mas_right).mas_offset(-Scale750(10));
        make.height.mas_equalTo(Scale750(80));
    }];
    /*
     * 登录按钮
     */
    _registerBtn = [[UIButton alloc] init];
    _registerBtn.layer.cornerRadius = Scale750(45);
    _registerBtn.backgroundColor = RGBColor(172, 215, 187);
    [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [_registerBtn setTitleColor:RGBColor(216, 236, 223) forState:UIControlStateNormal];
    [_registerBtn addTarget:self action:@selector(registerBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    _registerBtn.enabled = NO;
    [self.view addSubview:_registerBtn];
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(line4.mas_bottom).mas_offset(Scale750(80));
        make.left.mas_equalTo(Scale750(60));
        make.right.mas_equalTo(-Scale750(60));
        make.height.mas_equalTo(Scale750(90));
    }];
    /*
     * 已有帐号
     */
    UIButton *existBtn = [[UIButton alloc] init];
    existBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(24)];
    [existBtn setTitleColor:S_COGreenText forState:UIControlStateNormal];
    [existBtn setTitle:@"已有帐号" forState:UIControlStateNormal];
    [self.view addSubview:existBtn];
    [existBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_registerBtn.mas_bottom).mas_offset(Scale750(30));
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(Scale750(160));
        make.height.mas_equalTo(Scale750(60));
    }];
    [existBtn bk_addEventHandler:^(id sender) {
        [self.navigationController popViewControllerAnimated:NO];
    } forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 注册Btn点击
- (void)registerBtnClicked {
    /*
     * 数据判断
     */
    if (![_passwdTF.text checkPassword]) {
        [self.view ug_msg:@"密码格式有误"];
        return;
    }
    [self getRegisteredHttp];
}

#pragma mark - 验证码监听
- (void)notificationDoit {
    NSInteger codeNum = [AppDelegate getimeIntervalBy:keyStr wirhMax:30];
    if (codeNum > 0) {
        _codeBtn.userInteractionEnabled = NO;
        [_codeBtn setTitle:[NSString stringWithFormat:@"重新获取(%ld)", (long)codeNum] forState:UIControlStateNormal];
    }else{
        _codeBtn.userInteractionEnabled = YES;
        [_codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [AppDelegate removeObjectKey:keyStr];
    }
}

#pragma mark - 验证码接口
- (void)getCodeHttpWith:(NSString *)phone {
    [self.view ug_loading];
    [[[NetWorkRequest alloc] init] getAuthCode:phone block:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
        [self.view ug_hiddenLoading];
        if (error) {
            [self.view ug_msg:error.domain];
        }else{
            [UIView ug_debugmsg:dataDict];
            [AppDelegate addObjectIndateDic:self->keyStr];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationDoit) name:APPTIMEINFORMATION object:nil];
        }
    }];
}

#pragma mark - 注册接口
- (void)getRegisteredHttp {
    [self.view ug_loading];
    NSString *timeStr = [NSString getCurrentTimeBySecond];
    NSString *tempStr = [timeStr substringFromIndex:timeStr.length - 6];
    NSString *nameStr = [NSString stringWithFormat:@"SHB%@", tempStr];
    [[[NetWorkRequest alloc] init] registerWithTel:_phoneTF.text passwd:[_passwdTF.text encryptionSha1] authCode:_codeTF.text reccode:_invitaTF.text username:nameStr block:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
        [self.view ug_hiddenLoading];
        if (error) {
            [self.view ug_msg:error.domain];
        }else{
            [self.view ug_msg:@"注册成功"];
            [self.navigationController popViewControllerAnimated:NO];
        }
    }];
}

#pragma mark - UITextField代理
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    //得到输入框的内容
    NSString *toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    //怕输入是否有空格
    if ([toBeString spaceJudgment]) {
        [self.view ug_msg:@"不能输入空格"];
        return NO;
    }
    if (![string isEqualToString:@""]) {
        if ([string isEqualToString:@"\n"]) {
            return NO;
        }
        if (textField == _phoneTF) {
            if (![toBeString isPureInt]) {
                [self.view ug_msg:@"手机号码格式有误"];
                return NO;
            }
            if (toBeString.length > 11) {
                return NO;
            }
            
        }
        if (textField == _codeTF) {
            if (![toBeString isPureInt]) {
                [self.view ug_msg:@"验证码格式有误"];
                return NO;
            }
            if (toBeString.length > 6) {
                return NO;
            }
        }
        if (textField == _passwdTF) {
            if (toBeString.length > 15) {
                return NO;
            }
        }
        if (textField == _invitaTF) {
            if (toBeString.length > 8) {
                return NO;
            }
        }
    }
    if (textField == _phoneTF) {
        if (toBeString.length < 11) {
            _registerBtn.enabled = NO;
            _registerBtn.backgroundColor = RGBColor(172, 215, 187);
            [_registerBtn setTitleColor:RGBColor(216, 236, 223) forState:UIControlStateNormal];
        }
        if (_codeTF.text.length == 6 && _passwdTF.text.length >= 6) {
            if (toBeString.length == 11) {
                _registerBtn.enabled = YES;
                _registerBtn.backgroundColor = S_COGreenBack;
                [_registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            }
        }
    }
    if (textField == _codeTF) {
        if (toBeString.length < 6) {
            _registerBtn.enabled = NO;
            _registerBtn.backgroundColor = RGBColor(172, 215, 187);
            [_registerBtn setTitleColor:RGBColor(216, 236, 223) forState:UIControlStateNormal];
        }
        if (_phoneTF.text.length == 11 && _passwdTF.text.length >= 6) {
            if (toBeString.length > 5) {
                _registerBtn.enabled = YES;
                _registerBtn.backgroundColor = S_COGreenBack;
                [_registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            }
        }
    }
    if (textField == _passwdTF) {
        if (toBeString.length < 6) {
            _registerBtn.enabled = NO;
            _registerBtn.backgroundColor = RGBColor(172, 215, 187);
            [_registerBtn setTitleColor:RGBColor(216, 236, 223) forState:UIControlStateNormal];
        }
        if (_codeTF.text.length == 6 && _phoneTF.text.length == 11) {
            if (toBeString.length >= 6) {
                _registerBtn.enabled = YES;
                _registerBtn.backgroundColor = S_COGreenBack;
                [_registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            }
        }
    }
    return YES;
}


@end
