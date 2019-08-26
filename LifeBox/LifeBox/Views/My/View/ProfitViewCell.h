//
//  ProfitViewCell.h
//  LifeBox
//
//  Created by Lucky on 2019/8/25.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProfitViewCell : UITableViewCell

#pragma mark - 属性
///标题
@property (strong, nonatomic) UILabel *titleLab;

///时间
@property (strong, nonatomic) UILabel *timeLab;

///收益
@property (strong, nonatomic) UILabel *profitLab;

@end

NS_ASSUME_NONNULL_END
