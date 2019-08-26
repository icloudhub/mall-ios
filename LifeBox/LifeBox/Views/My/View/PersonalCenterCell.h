//
//  PersonalCenterCell.h
//  LifeBox
//
//  Created by Lucky on 2019/8/22.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonIconData.h"

NS_ASSUME_NONNULL_BEGIN

@interface PersonalCenterCell : UICollectionViewCell

#pragma mark - 属性
///图片
@property (strong, nonatomic) UIImageView *img;

///标题
@property (strong, nonatomic) UILabel *title;

#pragma mark - 方法
- (void)reloadCellUIWithData:(PersonIconData *)data;

@end

NS_ASSUME_NONNULL_END
