//
//  ProductDefSelectView.m
//  BusinseeLifeBox
//
//  Created by admin on 2020/4/27.
//  Copyright © 2020 admin. All rights reserved.
//

#import "ProductDefSelectView.h"
#import "ProductDefSelectCell.h"

@implementation ProductDefSelectView
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}


-(void)configUI{
    
    self.backgroundColor = UIColor.whiteColor;
    [self addSubview:self.collectionView];
}
-(NSMutableArray *)items{
    if (!_items) {
        _items = [self loadDefualItems];
    }
    return _items;
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[ProductDefSelectCell class] forCellWithReuseIdentifier:@"ProductDefSelectCell"];
        
    }
    return _collectionView;
}
-(UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout = [UICollectionViewFlowLayout new];
    }
    return _flowLayout;
}

#pragma mark UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ProductDefSelectCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProductDefSelectCell" forIndexPath:indexPath];
    cell.backgroundColor = UIColor.ug_random;
    ProductItem *item = [_items objectAtIndex:indexPath.row];
    [cell.clickBtn setImage:[UIImage imageWithIcon:item.icon backgroundColor:UIColor.clearColor iconColor:UIColor.ug_random fontSize:26] forState:UIControlStateNormal];
    [cell.clickBtn setTitle:item.title forState:UIControlStateNormal];
    [cell ug_radius:4];
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(KWidth/4, KWidth/4);
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (_selectclickBlock) {
        ProductItem *item = [_items objectAtIndex:indexPath.row];
        _selectclickBlock(item);
    }
}
-(NSMutableArray*)loadDefualItems{
    
    ProductItem *textitem = [ProductItem new];
    textitem.key = @"p";
    textitem.title = @"文字";
    textitem.icon = @"fa-github";
    
    ProductItem *imageitem = [ProductItem new];
    imageitem.key = @"img";
    imageitem.title = @"图片";
    imageitem.icon = @"fa-github";
    
    return [@[textitem,imageitem] mutableCopy];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self);
        make.right.mas_equalTo(self);
        make.top.mas_equalTo(self);
        make.bottom.mas_equalTo(self);
    }];
}


@end
