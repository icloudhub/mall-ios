//
//  RegistViewController.m
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/17.
//  Copyright © 2020 admin. All rights reserved.
//

#import "RegistViewController.h"
#import "NetWorkRequest+Login.h"

#import "UGRemarkView.h"

@interface RegistViewController ()

@property(strong, nonatomic) UIImageView *logoImageView; // logo

@property(strong, nonatomic) UGRemarkView *usernameTF; // 用户名

@property(strong, nonatomic) UGRemarkView *passwordTF; // 密码
@property(strong, nonatomic) UGRemarkView *autoCodeTF; // 密码

@property(strong, nonatomic) UIButton *commitBtn; // 登陆

@property(strong, nonatomic) UIButton *autoCodeBtn; // 登陆


@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self loadDebugData];
    
}

-(void)configUI{
    self.title = @"注册";
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self.view addSubview:self.logoImageView];
    
    self.usernameTF = [UGRemarkView new];
    [self.view addSubview:_usernameTF];
    _usernameTF.titlaLabel.text = @"手机号";
    _usernameTF.textView.text = [UserInfo share].name;
    
    self.passwordTF = [UGRemarkView new];
    [self.view addSubview:_passwordTF];
    _passwordTF.titlaLabel.text = @"密码";
    _passwordTF.text = [UserInfo share].password;
    
    [self.view addSubview:self.autoCodeTF];
    [self.view addSubview:self.autoCodeBtn];
    
    self.commitBtn = [UIButton new];
    [self.view addSubview:_commitBtn];
    [_commitBtn setTitle:@"注册" forState:UIControlStateNormal];
    [_commitBtn setBackgroundColor:COLORDANGER];
    [_commitBtn ug_radius:5];
  
    UG_WEAKSELF
    [_commitBtn ug_addEvents:UIControlEventTouchUpInside andBlock:^(id  _Nonnull sender) {

        [[NetWorkRequest share]register:weakSelf.usernameTF.text password:weakSelf.passwordTF.text authCode:weakSelf.autoCodeTF.text block:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
            if (error) {
                [self.view ug_msg:error.domain];
            }else{
                [UIView ug_msg:@"注册成功"];
                [self.navigationController popViewControllerAnimated:YES];
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

-(UGRemarkView *)autoCodeTF{
    if (!_autoCodeTF) {
        _autoCodeTF = [UGRemarkView new];
        _autoCodeTF.titlaLabel.text = @"验证码";
    }
    return _autoCodeTF;
}

-(UIButton *)autoCodeBtn{
    if (!_autoCodeBtn) {
        _autoCodeBtn = [UIButton new];
        [_autoCodeBtn setTitle:@"验证码" forState:UIControlStateNormal];
        [_autoCodeBtn setTitleColor:COLOR_23 forState:UIControlStateNormal];
        [_autoCodeBtn.titleLabel setFont:FONT_SYS12];
        [_autoCodeBtn setBackgroundColor:COLORDANGER];
        UG_WEAKSELF
        [_autoCodeBtn ug_addEvents:UIControlEventTouchUpInside andBlock:^(id  _Nonnull sender) {
            
            [[NetWorkRequest share] getAuthCode:weakSelf.usernameTF.text block:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
                
                if (error) {
                    [self.view ug_msg:error.domain];
                    [[UserInfo share] clear];
                }else{
                    _autoCodeTF.textView.text = [dataDict stringValueForKey:@"data" default:@"" ];
                }
                
            }];
            
        }];
    }
    return _autoCodeBtn;
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
    
    [_autoCodeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordTF.mas_bottom);
        make.left.mas_equalTo(self.view).mas_offset(KPAND_DEF);
        make.right.mas_equalTo(self.autoCodeBtn.mas_left);
        make.height.mas_equalTo(68);
    }];
    [_autoCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.autoCodeTF.mas_bottom).mas_offset(-KPAND_MIN);
        make.right.mas_equalTo(self.view).mas_offset(-KPAND_DEF);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(KAutoAcale(90));
    }];
    
    [_commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.autoCodeTF.mas_bottom).mas_offset(KPAND_MID);
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
