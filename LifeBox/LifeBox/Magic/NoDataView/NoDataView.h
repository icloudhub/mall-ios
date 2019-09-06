//
//  NoDataView.h
//  LifeBox
//
//  Created by Lucky on 2019/9/1.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^BtnClickBlock)(void);

@interface NoDataView : UIView

#pragma mark - 属性
///图片名称
@property (strong, nonatomic) NSString *imgName;

///标题
@property (strong, nonatomic) NSString *titleStr;

///btn文字
@property (strong, nonatomic) NSString *btnStr;

///block
@property (strong, nonatomic) BtnClickBlock btnBlock;

@end

NS_ASSUME_NONNULL_END
