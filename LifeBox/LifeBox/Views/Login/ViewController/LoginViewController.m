//
//  LoginViewController.m
//  LifeBox
//
//  Created by admin on 2019/8/13.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "LoginViewController.h"
#import "Userinfo.h"
#import "LoginCodeView.h"
#import "LoginPwView.h"
#import "NSString+WPAttributedMarkup.h"
#import "WPAttributedStyleAction.h"
#import "WPHotspotLabel.h"
#import "RegisterController.h"

@interface LoginViewController ()<UITextFieldDelegate> {
    ///设定倒计时Key
    NSString *keyStr;
}

///验证码登录View
@property (strong, nonatomic) LoginCodeView *codeView;
///密码登录View
@property (strong, nonatomic) LoginPwView *pwView;
///登录按钮
@property (strong, nonatomic) UIButton *loginBtn;
///选择按钮
@property (strong, nonatomic) UIButton *chooseBtn;
///协议Label
@property (strong, nonatomic) WPHotspotLabel *describeLaebl;

@end

@implementation LoginViewController

#pragma mark - 视图层
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    /*
     * 初始化数据
     */
    keyStr = @"LoginViewControllerKey";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"LoginUserInfo"];
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
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
    /*
     * 登录标题
     */
    UILabel *titlLab = [[UILabel alloc] init];
    titlLab.font = [UIFont systemFontOfSize:Scale750(60)];
    titlLab.textColor = RGBColor(51, 51, 51);
    titlLab.text = @"手机号快速登录";
    [self.view addSubview:titlLab];
    [titlLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(Scale750(60));
        make.top.mas_equalTo(clostBtn.mas_bottom).mas_offset(Scale750(130));
        make.width.height.mas_greaterThanOrEqualTo(10);
    }];
    /*
     * 验证码输入View
     */
    _codeView = [[LoginCodeView alloc] init];
    _codeView.hidden = YES;
    [self.view addSubview:_codeView];
    [_codeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titlLab.mas_bottom).mas_offset(Scale750(100));
        make.left.mas_equalTo(Scale750(60));
        make.right.mas_equalTo(-Scale750(60));
        make.height.mas_equalTo(Scale750(250));
    }];
    //根据输入数据变化UI
    UG_WEAKSELF
    _codeView.inPutBlock = ^(UITextField * _Nonnull textField, NSInteger count) {
        if (textField == weakSelf.codeView.phoneTF) {
            if (weakSelf.codeView.codeTF.text.length >= 6) {
                if (count == 11) {
                    weakSelf.loginBtn.backgroundColor = S_COGreenBack;
                    [weakSelf.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    weakSelf.loginBtn.enabled = YES;
                }
            }
            if (count < 11) {
                weakSelf.loginBtn.backgroundColor = RGBColor(172, 215, 187);
                [weakSelf.loginBtn setTitleColor:RGBColor(216, 236, 223) forState:UIControlStateNormal];
                weakSelf.loginBtn.enabled = NO;
            }
        }
        if (textField == weakSelf.codeView.codeTF) {
            if (weakSelf.codeView.phoneTF.text.length == 11) {
                if (count >= 6) {
                    weakSelf.loginBtn.backgroundColor = S_COGreenBack;
                    [weakSelf.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    weakSelf.loginBtn.enabled = YES;
                }
            }
            if (count < 6) {
                weakSelf.loginBtn.backgroundColor = RGBColor(172, 215, 187);
                [weakSelf.loginBtn setTitleColor:RGBColor(216, 236, 223) forState:UIControlStateNormal];
                weakSelf.loginBtn.enabled = NO;
            }
        }
    };
    /*
     * 验证码Btn事件
     */
    [_codeView.codeBtn addTarget:self action:@selector(codeBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    /*
     * 密码输入框
     */
    _pwView = [[LoginPwView alloc] init];
    _pwView.hidden = NO;
    [self.view addSubview:_pwView];
    [_pwView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titlLab.mas_bottom).mas_offset(Scale750(100));
        make.left.mas_equalTo(Scale750(60));
        make.right.mas_equalTo(-Scale750(60));
        make.height.mas_equalTo(Scale750(250));
    }];
    //根据输入数据变化UI
    _pwView.inPutBlock = ^(UITextField * _Nonnull textField, NSInteger count) {
        if (textField == self->_pwView.phoneTF) {
            if (weakSelf.pwView.passwTF.text.length >= 8) {
                if (count == 11) {
                    weakSelf.loginBtn.backgroundColor = S_COGreenBack;
                    [weakSelf.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    weakSelf.loginBtn.enabled = YES;
                }
            }
            if (count < 11) {
                weakSelf.loginBtn.backgroundColor = RGBColor(172, 215, 187);
                [weakSelf.loginBtn setTitleColor:RGBColor(216, 236, 223) forState:UIControlStateNormal];
                weakSelf.loginBtn.enabled = NO;
            }
        }
        if (textField == self->_pwView.passwTF) {
            if (weakSelf.pwView.phoneTF.text.length == 11) {
                if (count >= S_MINPassword) {
                    weakSelf.loginBtn.backgroundColor = S_COGreenBack;
                    [weakSelf.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    weakSelf.loginBtn.enabled = YES;
                }
            }
            if (count < S_MINPassword) {
                weakSelf.loginBtn.backgroundColor = RGBColor(172, 215, 187);
                [weakSelf.loginBtn setTitleColor:RGBColor(216, 236, 223) forState:UIControlStateNormal];
                weakSelf.loginBtn.enabled = NO;
            }
        }
    };
    /*
     * 登录按钮
     */
    _loginBtn = [[UIButton alloc] init];
    _loginBtn.layer.cornerRadius = Scale750(45);
    _loginBtn.backgroundColor = RGBColor(172, 215, 187);
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:RGBColor(216, 236, 223) forState:UIControlStateNormal];
    [_loginBtn addTarget:self action:@selector(loginBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    _loginBtn.enabled = NO;
    [self.view addSubview:_loginBtn];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titlLab.mas_bottom).mas_offset(Scale750(440));
        make.left.mas_equalTo(Scale750(60));
        make.right.mas_equalTo(-Scale750(60));
        make.height.mas_equalTo(Scale750(90));
    }];
    /*
     * 选择按钮
     */
    _chooseBtn = [[UIButton alloc] init];
    _chooseBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(24)];
    [_chooseBtn setTitleColor:RGBColor(102, 102, 102) forState:UIControlStateNormal];
    [_chooseBtn setTitle:@"验证码登录" forState:UIControlStateNormal];
    _chooseBtn.selected = NO;
    [_chooseBtn addTarget:self action:@selector(chooseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_chooseBtn];
    [_chooseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_loginBtn.mas_bottom).mas_offset(Scale750(20));
        make.right.mas_equalTo(_loginBtn.mas_right);
        make.width.mas_greaterThanOrEqualTo(10);
        make.height.mas_equalTo(Scale750(60));
    }];
    /*
     * 注册按钮
     */
    UIButton *registerBtn = [[UIButton alloc] init];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(24)];
    [registerBtn setTitleColor:RGBColor(102, 102, 102) forState:UIControlStateNormal];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [self.view addSubview:registerBtn];
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_loginBtn.mas_bottom).mas_offset(Scale750(20));
        make.left.mas_equalTo(_loginBtn.mas_left);
        make.width.mas_equalTo(Scale750(80));
        make.height.mas_equalTo(Scale750(60));
    }];
    [registerBtn bk_addEventHandler:^(id sender) {
        RegisterController *ctl = [[RegisterController alloc] init];
        [self.navigationController pushViewController:ctl animated:NO];
    } forControlEvents:UIControlEventTouchUpInside];
    /*
     * 协议Lable
     */
    _describeLaebl = [[WPHotspotLabel alloc] init];
    _describeLaebl.textAlignment = NSTextAlignmentCenter;
    _describeLaebl.backgroundColor = [UIColor clearColor];
    _describeLaebl.font = [UIFont systemFontOfSize:Scale750(24)];
    _describeLaebl.textColor = RGBColor(102, 102, 102);
    _describeLaebl.numberOfLines = 0;
    _describeLaebl.userInteractionEnabled = YES;
    [self.view addSubview:_describeLaebl];
    /*提示文字点击部分*/
    NSMutableDictionary *mudic = [[NSMutableDictionary alloc]initWithCapacity:0];
    [mudic setValue:[UIFont fontWithName:@"HelveticaNeue" size:Scale750(24)] forKey:@"body"];
    NSMutableString *textStr = [NSMutableString stringWithString:@"点击登录，即代表您已同意"];
    NSInteger i = 0;
    NSString* keystr = [NSString stringWithFormat:@"help%d",(int)i];
    [mudic setObject:[WPAttributedStyleAction styledActionWithAction:^{
        /*
         * 跳转协议
         */
        [self.view ug_msg:@"协议跳转"];
    }] forKey:keystr];
    NSString *nameStr = @"《用户协议》";
    NSString *temstr = [NSString stringWithFormat:@"<%@>%@</%@>",keystr,nameStr,keystr];
    [textStr appendString:temstr];
    NSString* keystr1 = [NSString stringWithFormat:@"help1"];
    [mudic setObject:[WPAttributedStyleAction styledActionWithAction:^{
        /*
         * 跳转协议
         */
        [self.view ug_msg:@"隐私保护协议跳转"];
    }] forKey:keystr1];
    NSString *nameStr1 = @"《隐私保护协议》";
    NSString *temstr1 = [NSString stringWithFormat:@"和<%@>%@</%@>",keystr1,nameStr1,keystr1];
    [textStr appendString:temstr1];
    [mudic setValue:@[S_COGreenText] forKey:@"link"];//@{NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle|NSUnderlinePatternSolid)},
    textStr = [NSMutableString stringWithString:[textStr substringToIndex:[textStr length]]];
    _describeLaebl.attributedText = [textStr attributedStringWithStyleBook:mudic];
    [_describeLaebl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-Scale750(40));
        make.left.mas_equalTo(Scale750(40));
        make.right.mas_equalTo(-Scale750(40));
        make.height.mas_equalTo(Scale750(80));
    }];
}

#pragma mark - 登录方式选择按钮点击
- (void)chooseBtnClick:(UIButton *)btn {
    [self.view endEditing:YES];
    if (btn.selected == NO) {
        //显示验证码登录
        _codeView.hidden = NO;
        _pwView.hidden = YES;
        [_chooseBtn setTitle:@"帐号密码登录" forState:UIControlStateNormal];
        _loginBtn.tag = 1000;
    }else{
        //显示密码登录
        _codeView.hidden = YES;
        _pwView.hidden = NO;
        [_chooseBtn setTitle:@"验证码登录" forState:UIControlStateNormal];
        _loginBtn.tag = 1001;
    }
    btn.selected = !btn.selected;
}

#pragma mark - 登录Btn点击
- (void)loginBtnClicked:(UIButton *)btn {
    if (btn.tag == 1000) {
        //验证码登录
        [self loginWithCodeHttp];
    }else{
        //密码登录
        [self loginWithPasswdHttp];
    }
}

#pragma mark - 获取验证码Btn点击
- (void)codeBtnClicked {
    [self.view endEditing:YES];
    if (self.codeView.phoneTF.text.length == 0) {
        return;
    }else{
        if (self.codeView.phoneTF.text.length < 11) {
            [self.view ug_msg:@"手机号码有误"];
            return;
        }
    }
    [self getCodeHttpWithPhone:self.codeView.phoneTF.text];
}

#pragma mark - 密码登录接口
- (void)loginWithPasswdHttp {
    [self.view ug_loading];
    [[NetWorkRequest new] passlogin:_pwView.phoneTF.text passwd:[_pwView.passwTF.text encryptionSha1] block:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
        [self.view ug_hiddenLoading];
        if (error) {
            [self.view ug_msg:error.domain];
        }else{
            [UIView animateWithDuration:1 animations:^{
                [self.view ug_msg:@"登陆成功"];
            } completion:^(BOOL finished) {
                [[NSUserDefaults standardUserDefaults]setObject:dataDict forKey:@"LoginUserInfo"];
                [self.navigationController dismissViewControllerAnimated:YES completion:nil];
            }];
        }
    }];
}

#pragma mark - 验证码登录接口
- (void)loginWithCodeHttp {
    [self.view ug_loading];
    [[NetWorkRequest new] loginWihtCode:_codeView.codeTF.text phone:_codeView.phoneTF.text endBlock:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
        [self.view ug_hiddenLoading];
        if (error) {
            [self.view ug_msg:error.domain];
        }else{
            [UIView animateWithDuration:1 animations:^{
                [self.view ug_msg:@"登陆成功"];
            } completion:^(BOOL finished) {
                [[NSUserDefaults standardUserDefaults]setObject:dataDict forKey:@"LoginUserInfo"];
                [self.navigationController dismissViewControllerAnimated:YES completion:nil];
            }];
        }
    }];
}

#pragma mark - 请求验证码接口
- (void)getCodeHttpWithPhone:(NSString *)phone {
    [self.view ug_loading];
    [[[NetWorkRequest alloc] init] getAuthCode:phone block:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
        [self.view ug_hiddenLoading];
        if (error) {
            [self.view ug_msg:error.domain];
        }else{
#ifdef DEBUG
            _codeView.codeTF.text = dataDict;
            _loginBtn.userInteractionEnabled = YES;
#endif
            [AppDelegate addObjectIndateDic:self->keyStr];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationDoit) name:APPTIMEINFORMATION object:nil];
        }
    }];
}

#pragma mark - 验证码监听
- (void)notificationDoit {
    NSInteger codeNum = [AppDelegate getimeIntervalBy:keyStr wirhMax:30];
    if (codeNum > 0) {
        _codeView.codeBtn.userInteractionEnabled = NO;
        [_codeView.codeBtn setTitle:[NSString stringWithFormat:@"重新获取(%ld)", (long)codeNum] forState:UIControlStateNormal];
    }else{
        _codeView.codeBtn.userInteractionEnabled = YES;
        [_codeView.codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [AppDelegate removeObjectKey:keyStr];
    }
}

@end
