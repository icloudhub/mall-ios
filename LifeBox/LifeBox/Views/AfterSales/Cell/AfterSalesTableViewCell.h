//
//  AfterSalesTableViewCell.h
//  LifeBox
//
//  Created by admin on 2020/4/23.
//  Copyright © 2020 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface AfterSalesTableViewHeader : UIView

@property(strong, nonatomic) UIView *backImageView;
@property(strong, nonatomic) UILabel *titleLab;

@end
@interface AfterSalesTableViewFoter : UIView


@end

@interface AfterSalesTableViewCell : UITableViewCell

@property(strong, nonatomic) UIImageView *imgView; // 商品图片

@property(strong, nonatomic) UILabel *titleLab; // 标题

@property(strong, nonatomic) UILabel *countLab; // 数量

@property(strong, nonatomic) UIButton *clickBtn; // 申请售后按钮

@end

NS_ASSUME_NONNULL_END
