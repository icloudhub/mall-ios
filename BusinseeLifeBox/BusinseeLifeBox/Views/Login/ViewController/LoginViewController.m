//
//  LoginViewController.m
//  UGOCMagicbox
//
//  Created by MBA on 2019/11/26.
//  Copyright © 2019 UG. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistViewController.h"
#import "UGRemarkView.h"
#import "NetWorkRequest+Login.h"

@interface LoginViewController ()

@property(strong, nonatomic) UIImageView *logoImageView; // logo

@property(strong, nonatomic) UGRemarkView *usernameTF; // 用户名

@property(strong, nonatomic) UGRemarkView *passwordTF; // 密码

@property(strong, nonatomic) UIButton *commitBtn; // 登陆

@property(strong, nonatomic) UIButton *registBtn; // 注册
@property(strong, nonatomic) UIButton *forgetBtn; // 忘记密码
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self loadDebugData];
    
}

-(void)configUI{
    self.title = @"登陆";
    [self.navigationController setNavigationBarHidden:YES];
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self.view addSubview:self.logoImageView];
    
    self.usernameTF = [UGRemarkView new];
    [self.view addSubview:_usernameTF];
    _usernameTF.titlaLabel.text = @"用户名";
    _usernameTF.textView.text = [UserInfo share].name;
    
    self.passwordTF = [UGRemarkView new];
    [self.view addSubview:_passwordTF];
    _passwordTF.titlaLabel.text = @"密码";
    _passwordTF.text = [UserInfo share].password;
    
    [self.view addSubview:self.registBtn];
    [self.view addSubview:self.forgetBtn];
    
    self.commitBtn = [UIButton new];
    [self.view addSubview:_commitBtn];
    [_commitBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [_commitBtn setBackgroundColor:COLORDANGER];
    [_commitBtn ug_radius:5];
    if ([UserInfo share].islogin) {
        [_commitBtn setTitle:@"已登陆" forState:UIControlStateNormal];
    }
    UG_WEAKSELF
    [_commitBtn ug_addEvents:UIControlEventTouchUpInside andBlock:^(id  _Nonnull sender) {
        [UserInfo share].name = weakSelf.usernameTF.text;
        [UserInfo share].password = weakSelf.passwordTF.text;
        [[NetWorkRequest share] passwordLogin:weakSelf.usernameTF.text password:weakSelf.passwordTF.text block:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
            if (error) {
                [self.view ug_msg:error.domain];
                [[UserInfo share] clear];
            }else{
                [UserInfo share].token = [dataDict stringValueForKey:@"token" default:NULL];
                [[UIApplication sharedApplication] configTabBar];
            }
        }];
    }];
    
}
-(UIImageView *)logoImageView{
    if (!_logoImageView) {
        _logoImageView  = [UIImageView new];
        [_logoImageView ug_borderColor:COLOR_EE width:0.5];
    }
    return _logoImageView;
}

-(UIButton *)registBtn{
    if (!_registBtn) {
        _registBtn = [UIButton new];
        [_registBtn setTitle:@"快速注册" forState:UIControlStateNormal];
        [_registBtn setTitleColor:COLOR_23 forState:UIControlStateNormal];
        [_registBtn.titleLabel setFont:FONT_SYS12];
        [_registBtn ug_addEvents:UIControlEventTouchUpInside andBlock:^(id  _Nonnull sender) {
            
            [self.navigationController pushViewController:[RegistViewController new] animated:YES];
        }];
        
    }
    return _registBtn;
}
-(UIButton *)forgetBtn{
    if (!_forgetBtn) {
        _forgetBtn = [UIButton new];
        [_forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgetBtn setTintColor:COLOR_23];
        [_forgetBtn setTitleColor:COLOR_23 forState:UIControlStateNormal];
        [_forgetBtn.titleLabel setFont:FONT_SYS12];
    }
    return _forgetBtn;
}
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    [_logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).mas_offset(KAutoAcale(80) + KSAFE_Top);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.height.mas_equalTo(KAutoAcale(80));
        make.width.mas_equalTo(KAutoAcale(80));
    }];
    
    [_usernameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.logoImageView.mas_bottom).mas_offset(KPAND_MID);
        make.left.mas_equalTo(self.view).mas_offset(KPAND_DEF);
        make.right.mas_equalTo(self.view).mas_offset(-KPAND_DEF);
        make.height.mas_equalTo(68);
    }];
    [_passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.usernameTF.mas_bottom);
        make.left.mas_equalTo(self.view).mas_offset(KPAND_DEF);
        make.right.mas_equalTo(self.view).mas_offset(-KPAND_DEF);
        make.height.mas_equalTo(68);
    }];
    
    [_registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordTF.mas_bottom);
        make.left.mas_equalTo(self.view).mas_offset(KPAND_DEF);
        make.height.mas_equalTo(40);
    }];
    
    [_forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.registBtn.mas_centerY);
        make.right.mas_equalTo(self.view).mas_offset(-KPAND_DEF);
        make.height.mas_equalTo(40);
    }];
    
    
    [_commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.registBtn.mas_bottom).mas_offset(KPAND_MID);
        make.left.mas_equalTo(self.view).mas_offset(KPAND_DEF);
        make.right.mas_equalTo(self.view).mas_offset(-KPAND_DEF);
        make.height.mas_equalTo(40);
    }];
}

-(void)loadDebugData{
#ifdef DEBUG
    _passwordTF.textView.text = @"123456";
    _usernameTF.textView.text = @"13923497592";
#endif
}
@end
