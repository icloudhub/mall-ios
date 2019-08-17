//
//  LoginPWView.h
//  LifeBox
//
//  Created by admin on 2019/8/17.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LogInInputView.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginPWView : UIView

@property(strong, nonatomic) LogInInputView *usernameView;

@property(strong, nonatomic) LogInInputView *passwordView;

@end

NS_ASSUME_NONNULL_END
