//
//  BlockCollectionView.h
//  AFNetworking
//
//  Created by MBA on 2019/5/18.
//

#import <UIKit/UIKit.h>
#import "BlockCollectionViewFlowLayout.h"
#import "BlockCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN


@interface BlockCollectionView : UICollectionView


@property (nonatomic, strong) BlockCollectionViewFlowLayout *flowLayout;


@property (assign, nonatomic) BOOL isSetcenten;//是否设置选中的内容正中间 defual=NO

@property(copy, nonatomic) NSInteger (^ug_numberOfItemsInSection)(UICollectionView*collectionView, NSInteger section);

@property(copy, nonatomic) NSInteger (^ug_numberOfSectionsInCollectionView)(UICollectionView*collectionView);



@property(copy, nonatomic) __kindof UICollectionViewCell *(^ug_cellForItemAtIndexPath)(UICollectionView*collectionView, NSIndexPath* indexPath);

@property(copy, nonatomic) void (^ug_didSelectItemAtIndexPath)(UICollectionView*collectionView, NSIndexPath* indexPath);

@property(copy, nonatomic) CGSize (^ug_sizeForItemAtIndexPath)(UICollectionView* collectionView, UICollectionViewLayout* layout, NSIndexPath* indexPath);

@property(copy, nonatomic) CGFloat (^ug_minimumLineSpacingForSectionAtIndex)(UICollectionView*collectionView);

@property(copy, nonatomic) CGSize (^ug_referenceSizeForHeaderInSection)(UICollectionView*collectionView,UICollectionViewLayout *collectionViewLayout, NSInteger section);

@property(copy, nonatomic) UICollectionReusableView * (^ug_viewForSupplementaryElementOfKind)(UICollectionView*collectionView, NSString* kind, NSIndexPath* indexPath);

@property(copy, nonatomic) UIEdgeInsets (^ug_insetForSectionAtIndex)(UICollectionView*collectionView,UICollectionViewLayout *collectionViewLayout, NSInteger section);

@end

NS_ASSUME_NONNULL_END
