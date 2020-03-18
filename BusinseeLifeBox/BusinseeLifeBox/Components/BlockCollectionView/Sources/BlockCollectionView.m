//
//  BlockCollectionView.m
//  AFNetworking
//
//  Created by MBA on 2019/5/18.
//

#import "BlockCollectionView.h"
#import "Masonry.h"


@interface BlockCollectionView() <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, assign) NSInteger indexOffset;

@end

@implementation BlockCollectionView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (!layout) {
        layout = self.flowLayout;
    }
    if (self ==[super initWithFrame:frame collectionViewLayout:layout]) {
            self.backgroundColor = UIColor.clearColor;
            self.delegate = self;
            self.dataSource = self;
            self.scrollsToTop = NO;
            self.pagingEnabled = YES;
            self.showsHorizontalScrollIndicator = NO;
            self.showsVerticalScrollIndicator = NO;
            [self registerClass:[BlockCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return self;
}
-(BlockCollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout = [[BlockCollectionViewFlowLayout alloc] init];
        _flowLayout.minimumLineSpacing = 0.f;
        _flowLayout.minimumInteritemSpacing = 0.f;
        _flowLayout.headerReferenceSize = CGSizeZero;
        _flowLayout.footerReferenceSize = CGSizeZero;
        _flowLayout.cellType = AlignWithCenter;
       
    }
    return _flowLayout;
}


#pragma mark -- UICollectionView DataSource

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    CGFloat count = _flowLayout.minimumInteritemSpacing;
    if (self.ug_minimumLineSpacingForSectionAtIndex != nil) {
        count = self.ug_minimumLineSpacingForSectionAtIndex(collectionView);
    }
    return count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    NSInteger secontcount=1;
    
    if (self.ug_numberOfSectionsInCollectionView != nil) {
        secontcount = self.ug_numberOfSectionsInCollectionView(collectionView);
    }
    return secontcount;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger secontcount=0;
    
    if (self.ug_numberOfItemsInSection != nil) {
        secontcount = self.ug_numberOfItemsInSection(collectionView,section);
    }
    return secontcount;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.ug_cellForItemAtIndexPath) {
        return self.ug_cellForItemAtIndexPath(collectionView,indexPath);
    }else{
        BlockCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.ug_sizeForItemAtIndexPath) {
        return self.ug_sizeForItemAtIndexPath(collectionView, collectionViewLayout,indexPath);
    }else{
        return _flowLayout.itemSize;
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (self.ug_referenceSizeForHeaderInSection) {
        return self.ug_referenceSizeForHeaderInSection(collectionView, collectionViewLayout,section);
    }else{
        return CGSizeZero;
    }
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (self.ug_insetForSectionAtIndex) {
        return self.ug_insetForSectionAtIndex(collectionView, collectionViewLayout,section);
    }else{
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
}

#pragma mark -- UICollectionView Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.ug_didSelectItemAtIndexPath) {
        self.ug_didSelectItemAtIndexPath(collectionView,indexPath);
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    if (!_isSetcenten) {
        return;
    }
    NSInteger index = [self currentIndex];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    [self scrollToItemAtIndexPath:indexPath atScrollPosition:[self scrollPosition]  animated:NO];
   
}

#pragma mark -- UIScrollViewDelegate Delegate
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    if (!_isSetcenten) {
        return;
    }
    NSInteger index = [self currentIndex];
    UICollectionViewScrollPosition position = [self scrollPosition];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    [self scrollToItemAtIndexPath:indexPath atScrollPosition:position animated:YES];
}

-(NSInteger)currentIndex
{
    NSInteger index = 0;
    switch (_flowLayout.scrollDirection) {
        case UICollectionViewScrollDirectionVertical:
            index = (self.contentOffset.y + (_flowLayout.itemSize.height + _flowLayout.minimumLineSpacing) / 2) / (_flowLayout.itemSize.height + _flowLayout.minimumLineSpacing);
            break;
        default:
            index = (self.contentOffset.x + (_flowLayout.itemSize.width + _flowLayout.minimumLineSpacing) / 2) / (_flowLayout.itemSize.width + _flowLayout.minimumLineSpacing);
            break;
    }
    return MAX(0, index);
}
//重新定位到中间
- (UICollectionViewScrollPosition)scrollPosition
{
    switch (_flowLayout.scrollDirection) {
        case UICollectionViewScrollDirectionVertical:
            return UICollectionViewScrollPositionCenteredVertically;
        default:
            return UICollectionViewScrollPositionCenteredHorizontally;
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];

}
@end
