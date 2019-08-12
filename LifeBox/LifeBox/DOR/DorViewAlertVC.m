//
//  DorViewAlertVC.m
//  LifeBox
//
//  Created by admin on 2019/8/12.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "DorViewAlertVC.h"
#import "BlockCollectionView.h"
@interface DorViewAlertVC ()
@property(strong, nonnull) BlockCollectionView *collectionView;
@end

@implementation DorViewAlertVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    
}
-(void)configUI{
    __weak typeof(self) weakSelf = self;
    self.collectionView = [BlockCollectionView new];
    [self.view addSubview:_collectionView];
    
    [_collectionView setUg_numberOfItemsInSection:^NSInteger(UICollectionView * _Nonnull collectionView, NSInteger section) {
        return 5;
    }];
    [_collectionView setUg_cellForItemAtIndexPath:^__kindof UICollectionViewCell * _Nonnull(UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
        
        BlockCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        cell.layer.borderWidth = 1;
        cell.layer.borderColor = UIColor.blackColor.CGColor;
        switch (indexPath.row) {
            case 0:
                cell.titleLab.text = @"msg(window)";
                break;
            case 1:
                cell.titleLab.text = @"msg(uiview)";
                break;
                
            default:
                break;
        }
        
        return cell;
        
    }];
    _collectionView.ug_sizeForItemAtIndexPath = ^CGSize(UICollectionView * _Nonnull collectionView, UICollectionViewLayout * _Nonnull layout, NSIndexPath * _Nonnull indexPath) {
        return CGSizeMake(self.view.bounds.size.width/4, self.view.bounds.size.width/4);
    };
    _collectionView.ug_didSelectItemAtIndexPath = ^(UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
        
        switch (indexPath.row) {
            case 0:
                [UIView ug_msg:@"测试：msg(window)"];
                break;
            case 1:
                [weakSelf.view ug_msg:@"测试：msg(UIView)"];
                break;
                
            default:
                break;
        }
        
    };
    
}

-(void)viewLayoutMarginsDidChange{
    [super viewLayoutMarginsDidChange];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}
@end
