//
//  LoginCodeView.m
//  LifeBox
//
//  Created by Lucky on 2019/11/11.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "LoginCodeView.h"

@implementation LoginCodeView

#pragma mark - 初始化
- (instancetype)init {
    self = [super init];
    if (self) {
        [self createUI];
      
    }
    return self;
}

#pragma mark - 创建UI
- (void)createUI {
    self.backgroundColor = UIColor.whiteColor;
    [self ug_radius:S_Radius_MIN];
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
     * 获取验证码按钮
     */
    _codeBtn = [[UIButton alloc] init];
    _codeBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(24)];
    [_codeBtn setTitleColor:RGBColor(51, 51, 51) forState:UIControlStateNormal];
    [_codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    _codeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self addSubview:_codeBtn];
    [_codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(line2.mas_top);
        make.right.mas_equalTo(-Scale750(10));
        make.width.mas_equalTo(Scale750(280));
        make.height.mas_equalTo(Scale750(80));
    }];
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
    [self addSubview:_codeTF];
    [_codeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(line2.mas_top);
        make.left.mas_equalTo(Scale750(10));
        make.right.mas_equalTo(_codeBtn.mas_left).mas_offset(-Scale750(10));
        make.height.mas_equalTo(Scale750(80));
    }];
}

#pragma mark - 代理
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    //得到输入框的内容
    NSString *toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    //怕输入是否有空格
    if ([toBeString spaceJudgment]) {
        [LoginCodeView ug_msg:@"不能输入空格"];
        return NO;
    }
    if (![string isEqualToString:@""]) {
        if ([string isEqualToString:@"\n"]) {
            return NO;
        }
        if (textField == _phoneTF) {
            if (![toBeString isPureInt]) {
                [LoginCodeView ug_msg:@"手机号码格式有误"];
                return NO;
            }
            if (toBeString.length > 11) {
                return NO;
            }
        }
        if (textField == _codeTF) {
            if (![toBeString isPureInt]) {
                [LoginCodeView ug_msg:@"验证码格式有误"];
                return NO;
            }
            if (toBeString.length > 6) {
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
