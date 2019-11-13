//
//  LoginPwView.m
//  LifeBox
//
//  Created by Lucky on 2019/11/13.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "LoginPwView.h"

@implementation LoginPwView

#pragma mark - 初始化
- (instancetype)init {
    self = [super init];
    if (self) {
        [self createUI];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 分割线1
     */
    UIView *line1 = [[UIView alloc] init];
    line1.backgroundColor = COLOREE;
    [self addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(130));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    /*
     * 手机号码输入
     */
    _phoneTF = [[BaseTextField alloc] init];
    _phoneTF.borderStyle = UITextBorderStyleNone;
    _phoneTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _phoneTF.keyboardType = UIKeyboardTypeDefault;
    _phoneTF.font = [UIFont systemFontOfSize:Scale750(30)];
    _phoneTF.placeholder = @"请输入手机号";
    _phoneTF.delegate = self;
    [self addSubview:_phoneTF];
    [_phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(line1.mas_top);
        make.left.mas_equalTo(Scale750(10));
        make.right.mas_equalTo(-Scale750(10));
        make.height.mas_equalTo(Scale750(80));
    }];
    /*
     * 分割线2
     */
    UIView *line2 = [[UIView alloc] init];
    line2.backgroundColor = COLOREE;
    [self addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(line1.mas_bottom).mas_offset(Scale750(110));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    /*
     * 密码输入框
     */
    _passwTF = [[BaseTextField alloc] init];
    _passwTF.borderStyle = UITextBorderStyleNone;
    _passwTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _passwTF.keyboardType = UIKeyboardTypeDefault;
    _passwTF.font = [UIFont systemFontOfSize:Scale750(30)];
    _passwTF.placeholder = @"请输入登录密码";
    _passwTF.secureTextEntry = YES;
    _passwTF.delegate = self;
    [self addSubview:_passwTF];
    [_passwTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(line2.mas_top);
        make.left.mas_equalTo(Scale750(10));
        make.right.mas_equalTo(-Scale750(10));
        make.height.mas_equalTo(Scale750(80));
    }];
}

#pragma mark - 代理
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    //得到输入框的内容
    NSString *toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    //怕输入是否有空格
    if ([toBeString spaceJudgment]) {
        [LoginPwView ug_msg:@"不能输入空格"];
        return NO;
    }
    if (![string isEqualToString:@""]) {
        if ([string isEqualToString:@"\n"]) {
            return NO;
        }
        if (textField == _phoneTF) {
            if (![toBeString isPureInt]) {
                [LoginPwView ug_msg:@"手机号码格式有误"];
                return NO;
            }
            if (toBeString.length > 11) {
                return NO;
            }
        }
        if (textField == _passwTF) {
            if (toBeString.length > 15) {
                return NO;
            }
        }
    }
    if (_inPutBlock) {
        _inPutBlock(textField, toBeString.length);
    }
    return YES;
}


@end
