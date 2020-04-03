//
//  GoodsSpeSheet.h
//  LifeBox
//
//  Created by Lucky on 2019/9/27.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "BaseSheet.h"
#import "BlockCollectionView.h"
#import "ProductModel.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^GoodsSpeSheetSelectskuChange)(ProductSKUModel*selectsku);

@interface GoodsSpeSheet : BaseSheet

@property(strong, nonatomic) BlockCollectionView *collectionView;

@property(strong, nonatomic) ProductModel *product;

///选中规格
@property(strong, nonatomic) NSMutableDictionary *selectSpeDic;

///选中sku
@property(strong, nonatomic) ProductSKUModel *selectsku;

/// 加入购物车按钮
@property(strong, nonatomic) UIButton *addShop;

///选中规格
@property(copy, nonatomic) GoodsSpeSheetSelectskuChange selectskuChange;

@end

NS_ASSUME_NONNULL_END
