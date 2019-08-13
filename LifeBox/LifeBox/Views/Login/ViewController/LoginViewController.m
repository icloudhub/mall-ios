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

@interface LoginViewController ()

@property(strong, nonatomic) UIButton *loginBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

-(void)configUI{
    //登陆按钮
    self.loginBtn = [UIButton new];
    [_loginBtn setBackgroundColor:UIColor.ug_random];
    [_loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [self.view addSubview:_loginBtn];
    [_loginBtn bk_addEventHandler:^(id sender) {
        [[NetWorkRequest new] passlogin:@"test" passwd:@"123456" block:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
            if (error) {
                [self.view ug_msg:error.domain];
            }else{
                NSString *tocker = dataDict[@"token"];
                Userinfo *userinfo = [Userinfo yy_modelWithJSON:dataDict[@"userinfo"]];
                DDLogVerbose(@"tocker:%@",tocker);
                DDLogVerbose(@"userinfo:%@",userinfo);
                
            }
        }];
    } forControlEvents:UIControlEventTouchUpInside];
}
-(void)viewLayoutMarginsDidChange{
    
    [super viewLayoutMarginsDidChange];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(10);
        make.right.mas_offset(-10);
        make.bottom.mas_offset(-50);
        make.height.mas_offset(44);
    }];
    
}
@end
