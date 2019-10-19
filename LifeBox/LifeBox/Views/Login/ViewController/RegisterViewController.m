//
//  RegisterViewController.m
//  LifeBox
//
//  Created by admin on 2019/9/11.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
#import "NetWorkRequest+Login.h"
@interface RegisterViewController ()
@property(strong, nonatomic) UIButton *loginBtn;

@property(strong, nonatomic) RegisterView * registerView;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    _registerView.usernameView.inputTF.text = @"13923497592";
    _registerView.passwordView.inputTF.text = @"123456";
}

-(void)configUI{
    
    //登陆输入框
    self.registerView = [RegisterView new];
    [self.view addSubview:_registerView];
    
    //登陆按钮
    self.loginBtn = [UIButton new];
    [_loginBtn setBackgroundColor:UIColor.ug_random];
    [_loginBtn setTitle:@"注册" forState:UIControlStateNormal];
    [self.view addSubview:_loginBtn];
    //登陆
    [_loginBtn bk_addEventHandler:^(id sender) {
        NSString *username = self.registerView.usernameView.inputTF.text;
        NSString *password = self.registerView.passwordView.inputTF.text;
        NSString *vercode = self.registerView.verCodeInputView.inputTF.text;
        
        [[NetWorkRequest new] register:username passwd:password tel:username authCode:vercode reccode:nil block:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
            if (error) {
                [self.view ug_msg:error.domain];
            }else{
                
                [self.view ug_msg:@"注册成功"];
            }
        }];
    } forControlEvents:UIControlEventTouchUpInside];
    
    //获取验证码
    [_registerView.verCodeInputView.getVerBtn bk_addEventHandler:^(id sender) {
        NSString *username = self.registerView.usernameView.inputTF.text;
 
        [[NetWorkRequest new] getAuthCode:username block:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
            if (error) {
                [self.view ug_msg:error.domain];
            }else{
#ifdef DEBUG
                self.registerView.verCodeInputView.inputTF.text =[NSString stringWithFormat:@"%@",dataDict];
#endif
                [self.view ug_msg:@"验证码获取成功"];
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
    [_registerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(SPanding_DEF);
        make.right.mas_equalTo(self.view).offset(-SPanding_DEF);
        make.height.mas_equalTo(180);
        make.bottom.mas_equalTo(self.loginBtn.mas_top).offset(-SPanding_DEF);
    }];
    
}
@end
