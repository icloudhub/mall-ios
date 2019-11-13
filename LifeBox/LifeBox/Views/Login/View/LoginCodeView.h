//
//  LoginPwView.h
//  LifeBox
//
//  Created by Lucky on 2019/11/11.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^InPutBlock)(UITextField *textField, NSInteger count);

@interface LoginCodeView : UIView<UITextFieldDelegate>

///帐号输入框
@property (strong, nonatomic) BaseTextField *phoneTF;
///验证码输入框
@property (strong, nonatomic) BaseTextField *codeTF;
///获取验证码Btn
@property (strong, nonatomic) UIButton *codeBtn;
///输入回调
@property (strong, nonatomic) InPutBlock inPutBlock;

@end

NS_ASSUME_NONNULL_END
