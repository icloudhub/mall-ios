//
//  CarBottomView.h
//  LifeBox
//
//  Created by admin on 2019/9/7.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CarBottomView : UIView
/*
 * 全选Btn
 */
@property(strong, nonatomic) UIButton *allBtn ;
/*
 * 全选文字
 */
@property(strong, nonatomic) UILabel *allLab;
/*
 * 结算Btn
 */
@property(strong, nonatomic) UIButton *settlementBtn;
/*
 * 合计lab
 */
@property(strong, nonatomic) UILabel *combinedLab;
@end

NS_ASSUME_NONNULL_END
