//
//  ImagesEditView.h
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/20.
//  Copyright © 2020 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BlockCollectionView.h"

NS_ASSUME_NONNULL_BEGIN
@interface ImagesEditData : NSObject

@property(strong, nonatomic) NSString *imageurl; // 图片url
@property(strong, nonatomic) UIImage *image; //图片数据

@end


@interface ImagesEditViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIButton *deleteBtn;

@end

@interface ImagesEditView : UIView

@property(strong, nonatomic) BlockCollectionView *collectionView;

@property(strong, nonatomic) NSArray<ImagesEditData*> *images; //图片数组

@property(assign, nonatomic) NSInteger maxCount; //最大图片数量

@property(assign, readonly) CGFloat height;

@end

NS_ASSUME_NONNULL_END
