//
//  HomeToolCell.h
//  LifeBox
//
//  Created by Lucky on 2019/8/26.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeToolData.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeToolCell : UICollectionViewCell

#pragma mark - 属性
///图片
@property (strong, nonatomic) UIImageView *toolImg;

///功能文字
@property (strong, nonatomic) UILabel *titleLab;

#pragma mark - 方法
- (void)reloadCellUIWithData:(HomeToolData *)data;

@end

NS_ASSUME_NONNULL_END
