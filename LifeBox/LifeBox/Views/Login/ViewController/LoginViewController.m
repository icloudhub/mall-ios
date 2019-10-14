//
//  LoginViewController.m
//  LifeBox
//
//  Created by admin on 2019/8/13.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "LoginViewController.h"
#import "NetWorkRequest+Login.h"
#import "Userinfo.h"
#import "LoginPWView.h"
@interface LoginViewController ()

@property(strong, nonatomic) UIButton *loginBtn;

@property(strong, nonatomic) LoginPWView * loginPWView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    _loginPWView.usernameView.inputTF.text = @"test";
    _loginPWView.passwordView.inputTF.text = @"123456";
}

-(void)configUI{
    //登陆输入框
    self.loginPWView = [LoginPWView new];
    [self.view addSubview:_loginPWView];
    
    //登陆按钮
    self.loginBtn = [UIButton new];
    [_loginBtn setBackgroundColor:UIColor.ug_random];
    [_loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [self.view addSubview:_loginBtn];
    [_loginBtn bk_addEventHandler:^(id sender) {
        NSString *username = self->_loginPWView.usernameView.inputTF.text;
        NSString *password = self->_loginPWView.passwordView.inputTF.text;
        
        [[NetWorkRequest new] passlogin:username passwd:password block:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
            if (error) {
                [self.view ug_msg:error.domain];
            }else{
               
                [self.view ug_msg:@"登陆成功"];
                [[NSUserDefaults standardUserDefaults]setObject:dataDict forKey:@"LoginUserInfo"];
                [self.view ug_msg:[Global_Variable shared].token];
               
                
            }
        }];
    } forControlEvents:UIControlEventTouchUpInside];
}
-(void)viewLayoutMarginsDidChange{
    
    [super viewLayoutMarginsDidChange];

    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(SPanding_DEF);
        make.right.mas_equalTo(-SPanding_DEF);
        make.top.mas_equalTo(self.view.center.y);
        make.height.mas_equalTo(44);
    }];
    [_loginPWView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(SPanding_DEF);
        make.right.mas_equalTo(self.view).offset(-SPanding_DEF);
        make.height.mas_equalTo(135);
        make.bottom.mas_equalTo(self.loginBtn.mas_top).offset(-SPanding_DEF);
    }];
    
}
@end
