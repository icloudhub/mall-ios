//
//  GoodsCollectionViewCell.h
//  LifeBox
//
//  Created by admin on 2020/4/13.
//  Copyright © 2020 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GoodsCollectionViewCell : UICollectionViewCell


@property (nonatomic, strong) UIImageView *imageView; //图片

@property (nonatomic, strong) UILabel *titleLab; //标题

@property (nonatomic, strong) UILabel *priceLab; //价格

@property (nonatomic, strong) UIView *bodyView;
@end

NS_ASSUME_NONNULL_END
