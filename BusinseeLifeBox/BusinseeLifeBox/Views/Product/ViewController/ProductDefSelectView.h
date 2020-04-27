//
//  ProductDefSelectView.h
//  BusinseeLifeBox
//
//  Created by admin on 2020/4/27.
//  Copyright © 2020 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductItem.h"

NS_ASSUME_NONNULL_BEGIN


typedef void(^ProductDefSelectclickBlock)(ProductItem* item);

@interface ProductDefSelectView : UIView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

//可以提供选择的添加类型
@property(strong, nonatomic) NSMutableArray *items;

@property(strong, nonatomic) UICollectionViewFlowLayout* flowLayout;

@property(strong, nonatomic) UICollectionView* collectionView;

@property(copy, nonatomic) ProductDefSelectclickBlock selectclickBlock;

@end

NS_ASSUME_NONNULL_END
