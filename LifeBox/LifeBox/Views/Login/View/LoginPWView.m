//
//  LoginPWView.m
//  LifeBox
//
//  Created by admin on 2019/8/17.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "LoginPWView.h"

@implementation LoginPWView

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
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    [_usernameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).mas_offset(S_Defmargin);
        make.left.mas_equalTo(self).mas_offset(S_Defmargin);
        make.right.mas_equalTo(self).mas_offset(-S_Defmargin);
        make.bottom.mas_equalTo(self.mas_centerY).mas_offset(-S_Defmargin/2);
    }];
    [_passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.mas_centerY).mas_offset(S_Defmargin/2);
        make.bottom.mas_equalTo(self).mas_offset(-S_Defmargin);
        make.left.mas_equalTo(self).mas_offset(S_Defmargin);
        make.right.mas_equalTo(self).mas_offset(-S_Defmargin);
   
    }];
    
}

@end