//
//  SetInfoCell.h
//  LifeBox
//
//  Created by Lucky on 2019/9/7.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SetInfoCell : UITableViewCell

///标题
@property (strong, nonatomic) UILabel *titleLab;

///箭头
@property (strong, nonatomic) UIImageView *arrowImg;

#pragma mark - 刷新UI
- (void)reloadCellUIWith:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
