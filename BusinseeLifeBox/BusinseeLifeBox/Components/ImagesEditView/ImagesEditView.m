//
//  ImagesEditView.m
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/20.
//  Copyright © 2020 admin. All rights reserved.
//

#import "ImagesEditView.h"

@implementation ImagesEditData
@end

@implementation ImagesEditViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {

        self.imageView = [UIImageView new];
        _imageView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_imageView];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
        [_imageView ug_radius:3];
  
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
 
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
    }];
    
    
}


@end

@implementation ImagesEditView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.maxCount = 6;
        [self confitUI];
    }
    return self;
}

-(void)confitUI{
    [self addSubview:self.collectionView];
}

-(BlockCollectionView *)collectionView{
    UG_WEAKSELF
    if (!_collectionView) {
        _collectionView = [BlockCollectionView new];
        _collectionView.flowLayout.minimumLineSpacing = 2.0;
        _collectionView.flowLayout.minimumInteritemSpacing = 8.f;
        _collectionView.flowLayout.cellType = AlignWithLeft;
        _collectionView.backgroundColor = UIColor.blueColor;
                        [_collectionView registerClass:[ImagesEditViewCell class] forCellWithReuseIdentifier:@"ImagesEditViewCell"];
        //                [_collectionView registerClass:[HomeViewCollectionToDoCell class] forCellWithReuseIdentifier:@"HomeViewCollectionToDoCell"];
        //                [_collectionView registerClass:[HomeViewCollectionBandleCell class] forCellWithReuseIdentifier:@"HomeViewCollectionBandleCell"];
        
        _collectionView.ug_numberOfSectionsInCollectionView = ^NSInteger(UICollectionView * _Nonnull collectionView) {
            return 1;
        };
        _collectionView.ug_numberOfItemsInSection = ^NSInteger(UICollectionView * _Nonnull collectionView, NSInteger section) {
            if (!weakSelf.images) {
                return 1;
            }
            NSInteger returncount = weakSelf.images.count<weakSelf.maxCount? weakSelf.images.count+1 : weakSelf.maxCount;
            return returncount;
        };
        _collectionView.ug_cellForItemAtIndexPath = ^__kindof UICollectionViewCell * _Nonnull(UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
            
            ImagesEditViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImagesEditViewCell" forIndexPath:indexPath];
            cell.backgroundColor = [UIColor whiteColor];
            if (indexPath.row == weakSelf.images.count) {
                cell.backgroundColor = COLOR_EE;
                cell.imageView.image = [UIImage imageWithIcon:@"fa-plus" backgroundColor:UIColor.clearColor iconColor:UIColor.whiteColor fontSize:40];
            }
            return cell;
        };
        
        _collectionView.ug_sizeForItemAtIndexPath = ^CGSize(UICollectionView * _Nonnull collectionView, UICollectionViewLayout * _Nonnull layout, NSIndexPath * _Nonnull indexPath) {
            CGFloat conwight = KSwidth-18;
            
            return CGSizeMake((conwight-14)/3, (conwight-14)/3);
            
            
        };
        _collectionView.ug_insetForSectionAtIndex = ^UIEdgeInsets(UICollectionView * _Nonnull collectionView, UICollectionViewLayout * _Nonnull collectionViewLayout, NSInteger section) {
            return UIEdgeInsetsMake(0, 8, 0, 8);
        };
        
        _collectionView.ug_referenceSizeForHeaderInSection = ^CGSize(UICollectionView * _Nonnull collectionView, UICollectionViewLayout * _Nonnull collectionViewLayout, NSInteger section) {
            return CGSizeMake(KSwidth, 5);
        };
        
        _collectionView.ug_didSelectItemAtIndexPath = ^(UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
            
        };
    }
    return _collectionView;
}


-(void)layoutSubviews{
    [super layoutSubviews];

    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.left.mas_equalTo(self);
        make.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self);
    }];
}

@end
