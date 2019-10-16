//
//  RegisterView.h
//  LifeBox
//
//  Created by xiaoqy on 2019/10/14.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LogInInputView.h"
#import "VerCodeInputView.h"
NS_ASSUME_NONNULL_BEGIN

@interface RegisterView : UIView

@property(strong, nonatomic) LogInInputView *usernameView;

@property(strong, nonatomic) LogInInputView *passwordView;

@property(strong, nonatomic) VerCodeInputView *verCodeInputView;


@end

NS_ASSUME_NONNULL_END
