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
    self.view.backgroundColor = [UIColor ug_hexString:@"#eeeeee"];
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
        _flowLayout.minimumInteritemSpacing = 1;
        _flowLayout.minimumLineSpacing = 1;
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
    
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return self.datalist.count;
            break;
        case 1:
            return 1;
        break;
            
        default:
            break;
    }
    return 0;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //添加
    if (indexPath.section ==1) {
        ProductDefAddCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProductDefAddCell" forIndexPath:indexPath];
        cell.backgroundColor = UIColor.ug_random;
        [cell ug_radius:4];
        return cell;
    }else{
        ProductDefBaseCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProductDefBaseCell" forIndexPath:indexPath];
        cell.backgroundColor = UIColor.ug_random;
        [cell ug_radius:4];
        ProductCellData *data = [_datalist objectAtIndex:indexPath.row];
  
        [cell reload:data];
        UG_WEAKSELF
        [cell setCellHeightChangeBlock:^(ProductCellData * _Nonnull data) {
            [weakSelf.collectionView reloadItemsAtIndexPaths:@[indexPath]];
        }];
        //添加长按手势
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(moveCollectionViewCell:)];
        [cell addGestureRecognizer:longPress];
        return cell;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==1) {
        return CGSizeMake(KWidth,  80);
    }else{
        ProductCellData *data = [_datalist objectAtIndex:indexPath.row];
        return CGSizeMake(KWidth, data.fullHeigt>=80 ? data.fullHeigt: 80);
    }
}
-(void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    if (destinationIndexPath.section==0) {
        NSString *selectModel = self.datalist[sourceIndexPath.row];
        [_datalist removeObject:selectModel];
        
    }else{
        [self bk_performBlock:^(id obj) {
            [collectionView reloadData];
        } afterDelay:0.35];
    }
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==1) {
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
        make.left.mas_equalTo(self.view).mas_offset(KPAND_DEF);
        make.right.mas_equalTo(self.view).mas_offset(-KPAND_DEF);;
        make.top.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
    }];
}


@end
