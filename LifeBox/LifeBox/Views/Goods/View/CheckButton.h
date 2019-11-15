//
//  CheckButton.h
//  LifeBox
//
//  Created by Lucky on 2019/11/15.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, CheckType) {
    top,
    left,
    right,
    bottom,
};

@interface CheckButton : UIButton

///图片名称
@property (strong, nonatomic) NSString *imgStr;

///文字
@property (strong, nonatomic) NSString *titleStr;

#pragma mark - 初始化
- (instancetype)initWithType:(CheckType)type;

@end

NS_ASSUME_NONNULL_END
