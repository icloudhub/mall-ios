//
//  SingleView.h
//  LifeBox
//
//  Created by Lucky on 2019/12/29.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SingleView : UIView

///商品图片
@property(strong, nonatomic) UIImageView *goodsImg;
///商品名称
@property(strong, nonatomic) UILabel *goodsName;

@end

NS_ASSUME_NONNULL_END
