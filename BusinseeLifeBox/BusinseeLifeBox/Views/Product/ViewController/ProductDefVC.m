//
//  ProductDefVC.m
//  BusinseeLifeBox
//
//  Created by admin on 2020/4/27.
//  Copyright © 2020 admin. All rights reserved.
//

#import "ProductDefVC.h"
#import "ProductDefBaseCell.h"
#import "ProductDefSelectView.h"
#import "ProductCellData.h"


@interface ProductDefVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic) UICollectionViewFlowLayout* flowLayout;

@property(strong, nonatomic) UICollectionView* collectionView;

@property (nonatomic, strong) NSMutableArray * datalist;

@property (nonatomic, strong) ProductDefSelectView * defSelectView;

@property (nonatomic, assign) BOOL isBeganMove;

@end

@implementation ProductDefVC


- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

-(void)configUI{
    self.title = @"编辑商品详情";
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.collectionView];
}

-(NSMutableArray *)datalist{
    if (!_datalist) {
        _datalist = [@[] mutableCopy];
    }
    return _datalist;
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[ProductDefBaseCell class] forCellWithReuseIdentifier:@"ProductDefBaseCell"];
             [_collectionView registerClass:[ProductDefAddCell class] forCellWithReuseIdentifier:@"ProductDefAddCell"];
    }
    return _collectionView;
}
-(UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout = [UICollectionViewFlowLayout new];
    }
    return _flowLayout;
}

-(ProductDefSelectView *)defSelectView{
    if (!_defSelectView) {
        _defSelectView = [ProductDefSelectView new];
        _defSelectView.backgroundColor = UIColor.yellowColor;
        UG_WEAKSELF
        [_defSelectView setSelectclickBlock:^(ProductItem * _Nonnull item) {
            ProductCellData *data = [ProductCellData new];
            data.type = item.key;
            [weakSelf.datalist addObject:data];
            [weakSelf.collectionView reloadData];
            
            [weakSelf.defSelectView setFrame:CGRectMake(0, (KHeight/3)*2, KWidth, KHeight/3)];
            [UIView animateWithDuration:0.35 animations:^{
                [weakSelf.defSelectView setFrame:CGRectMake(0, KHeight, KWidth, KHeight/3)];
            } completion:^(BOOL finished) {
                [weakSelf.defSelectView removeFromSuperview];
            }];
        }];
    }
    return _defSelectView;
}

#pragma mark UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.datalist.count+1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //添加
    if (indexPath.row ==_datalist.count) {
        ProductDefAddCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProductDefAddCell" forIndexPath:indexPath];
        cell.backgroundColor = UIColor.ug_random;
        [cell ug_radius:4];
        return cell;
    }else{
        ProductDefBaseCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProductDefBaseCell" forIndexPath:indexPath];
        cell.backgroundColor = UIColor.ug_random;
        [cell ug_radius:4];
        ProductCellData *data = [_datalist objectAtIndex:indexPath.row];
        cell.typeLab.text = data.type;
        //添加长按手势
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(moveCollectionViewCell:)];
        [cell addGestureRecognizer:longPress];
        return cell;
    }

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(KWidth, 80);
    
}
-(void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    if (destinationIndexPath.row<_datalist.count) {
        NSString *selectModel = self.datalist[sourceIndexPath.row];
        [_datalist removeObject:selectModel];
        [_datalist insertObject:selectModel atIndex:destinationIndexPath.row];
    }else{
         [_collectionView reloadData];
    }
    

}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==_datalist.count) {
        [self.defSelectView setFrame:CGRectMake(0, KHeight, KWidth, KHeight/3)];
        [self.view addSubview:self.defSelectView];
        [UIView animateWithDuration:0.35 animations:^{
            [self.defSelectView setFrame:CGRectMake(0, (KHeight/3)*2, KWidth, KHeight/3)];
        }];
    }
}
#pragma mark - 手势事件
-(void)moveCollectionViewCell:(UILongPressGestureRecognizer *)gesture {
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan: {
            if (!self.isBeganMove) {
                self.isBeganMove = YES;
                //获取点击的cell的indexPath
                NSIndexPath *selectedIndexPath = [self.collectionView indexPathForItemAtPoint:[gesture locationInView:self.collectionView]];
                
                //开始移动对应的cell
                [self.collectionView beginInteractiveMovementForItemAtIndexPath:selectedIndexPath];
            }
            break;
        }
        case UIGestureRecognizerStateChanged: {
            //移动cell
            [self.collectionView updateInteractiveMovementTargetPosition:[gesture locationInView:self.collectionView]];
            break;
        }
        case UIGestureRecognizerStateEnded: {
            self.isBeganMove = false;
            //结束移动
            [self.collectionView endInteractiveMovement];
            break;
        }
        default:
            [self.collectionView cancelInteractiveMovement];
            break;
    }
}


-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
    }];
}


@end
