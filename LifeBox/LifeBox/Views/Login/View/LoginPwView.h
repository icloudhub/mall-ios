//
//  LoginPwView.h
//  LifeBox
//
//  Created by Lucky on 2019/11/13.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^InPutBlock)(UITextField *textField, NSInteger count);

@interface LoginPwView : UIView<UITextFieldDelegate>

///帐号输入框
@property (strong, nonatomic) BaseTextField *phoneTF;
///密码输入框
@property (strong, nonatomic) BaseTextField *passwTF;
///输入回调
@property (strong, nonatomic) InPutBlock inPutBlock;

@end

NS_ASSUME_NONNULL_END
