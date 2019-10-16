//
//  RegisterView.m
//  LifeBox
//
//  Created by xiaoqy on 2019/10/14.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "RegisterView.h"

@implementation RegisterView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        [self configView];
    }
    return self;
    
}

-(void)configView{
    [self ug_defborder];
    self.usernameView = [LogInInputView new];
    [self addSubview:_usernameView];
    
    self.passwordView = [LogInInputView new];
    [self addSubview:_passwordView];
    _usernameView.inputTF.placeholder = @"用户名/手机号码";
    _passwordView.inputTF.placeholder = @"6-16位密码";
    
    self.verCodeInputView = [VerCodeInputView new];
    [self addSubview:_verCodeInputView];
    _verCodeInputView.inputTF.placeholder = @"6位验证码";
    [_verCodeInputView.getVerBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    [_usernameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).mas_offset(SPanding_DEF);
        make.left.mas_equalTo(self).mas_offset(SPanding_DEF);
        make.right.mas_equalTo(self).mas_offset(-SPanding_DEF);
        make.height.mas_equalTo(44);
    }];
    [_passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.usernameView.mas_bottom).mas_offset(SPanding_DEF/2);
        make.height.mas_equalTo(44);
        make.left.mas_equalTo(self).mas_offset(SPanding_DEF);
        make.right.mas_equalTo(self).mas_offset(-SPanding_DEF);
   
    }];
    [_verCodeInputView mas_makeConstraints:^(MASConstraintMaker *make) {
           
           make.top.mas_equalTo(self.passwordView.mas_bottom).mas_offset(SPanding_DEF/2);
           make.height.mas_equalTo(44);
           make.left.mas_equalTo(self).mas_offset(SPanding_DEF);
           make.right.mas_equalTo(self).mas_offset(-SPanding_DEF);
      
       }];
    
}

@end
