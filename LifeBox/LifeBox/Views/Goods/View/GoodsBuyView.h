//
//  GoodsBuyView.h
//  LifeBox
//
//  Created by admin on 2019/11/9.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckButton.h"

NS_ASSUME_NONNULL_BEGIN
 
@protocol BuyViewDelegate <NSObject>

- (void)buyViewBtnClicked:(NSInteger)tag;

@end

@interface GoodsBuyView : UIView

///返回首页Btn
@property(strong, nonatomic) CheckButton *homeBtn;
///去购物车按钮
@property(strong, nonatomic) CheckButton *shopcarBtn;
///收藏按钮
@property(strong, nonatomic) CheckButton *likeBtn;
///加入购物车
@property(strong, nonatomic) UIButton *addcarBtn;
///立即购买
@property(strong, nonatomic) UIButton *buyNowBtn;
///代理
@property (weak, nonatomic) id<BuyViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
