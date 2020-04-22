//
//  GoodsListViewController.m
//  LifeBox
//  商品列表
//  Created by admin on 2020/4/13.
//  Copyright © 2020 Lucky. All rights reserved.
//

#import "GoodsListViewController.h"
#import "GoodsCollectionViewCell.h"
#import "NetWorkRequest+Goods.h"
#import "MJRefresh.h"
#import "GoodsDefViewController.h"

#import "HomeProductdata.h"

@interface GoodsListViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray* productList;
@property (strong, nonatomic) NSString* keyword;
@property (assign, nonatomic) NSInteger pageNum;
@end

@implementation GoodsListViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self setNaveItemWithView:nil];
    [self confitUI];
    [self seatchProduct];
}


-(void)confitUI{
    [self.view addSubview:self.collectionView];
}

-(UICollectionView *)collectionView{
    UG_WEAKSELF
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 0.f;
        flowLayout.minimumInteritemSpacing = 0.f;
        flowLayout.headerReferenceSize = CGSizeZero;
        flowLayout.footerReferenceSize = CGSizeZero;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = S_COBackground;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollsToTop = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[GoodsCollectionViewCell class] forCellWithReuseIdentifier:@"GoodsCollectionViewCell"];
        _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            weakSelf.pageNum = 0;
            [weakSelf.productList removeAllObjects];
            [self seatchProduct];
        }];
        
        // 上拉刷新
        _collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            
            weakSelf.pageNum ++;
            [self seatchProduct];
            
        }];
 
    }
    return _collectionView;
}
-(NSMutableArray *)productList{
    if (!_productList) {
        _productList = [NSMutableArray new];
    }
    return _productList;
}

-(void)seatchProduct{
    UG_WEAKSELF
    if (self.productList.count<=0) {
        [self.view ug_starloading];
    }
    [[NetWorkRequest new] productsearch:_keyword brandId:_brandId productCategoryId:@"" sort:@"" pageSize:@"10" pageNum:[NSString stringWithFormat:@"%zd",_pageNum] endBlock:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
        [self.view ug_stoploading];
        [self.collectionView.mj_header endRefreshing];
        [self.collectionView.mj_footer endRefreshing];
        if (!error) {
        
            [weakSelf.productList addObjectsFromArray: [NSArray modelArrayWithClass:[HomeProductdata class] json:dataDict[@"list"]]];
            [weakSelf.collectionView reloadData];
            if (weakSelf.productList.count>=[dataDict[@"total"] integerValue]) {
                [self.collectionView.mj_footer endRefreshingWithNoMoreData];
            }
         
        }else{
            [self.view ug_msg:error.domain];
        }
    }];
}

#pragma mark -- UICollectionView DataSource

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    NSInteger secontcount=1;
    return secontcount;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger secontcount = self.productList.count;
    return secontcount;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    GoodsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GoodsCollectionViewCell" forIndexPath:indexPath];
     HomeProductdata *data = [self.productList objectAtIndex:indexPath.row];
    [cell.imageView sd_setImageWithURL:UG_URL(data.pic)];
     cell.titleLab.text = data.name;
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return  CGSizeMake(Screen_width/2, 270);
}


#pragma mark -- UICollectionView Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    GoodsDefViewController *goodsDefViewController = [GoodsDefViewController new];
    HomeProductdata *data = [self.productList objectAtIndex:indexPath.row];
    goodsDefViewController.productid = data.id;
    goodsDefViewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:goodsDefViewController animated:YES];
 
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{

   
    return CGSizeZero;
}



#pragma mark 导航
-(void)setNaveItemWithView:(UIView*)view{
    
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Scale750(520), 44)];
    
    UGTextField * titleView = [[UGTextField alloc] initWithFrame:CGRectMake(0, 4, Scale750(520), 34)];
    [backView addSubview:titleView];
    titleView.placeholder = @"万物皆可搜～搜搜更健康";
    titleView.ug_maximumLimit = 20;
    [titleView ug_radius:17];
//    [titleView ug_borderColorColor:COLOREE width:1];
   
    titleView.offset = 8;
    titleView.font = FONT_SYS14;

    self.navigationItem.titleView = backView;
    
    /*
     * 导航栏返回Btn
     */
    UIButton *litemButtom = [UIButton  buttonWithType:UIButtonTypeCustom];
    [litemButtom setFrame:CGRectMake(0, 0, 30, 40)];
    [litemButtom setImage:[UIImage imageWithIcon:@"fa-angle-left" backgroundColor:UIColor.clearColor iconColor:COLOR23 andSize:CGSizeMake(25, 25)] forState:UIControlStateNormal];
    [litemButtom addTarget:self action:@selector(leftBarButtonItemClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *lbutton = [[UIBarButtonItem alloc]
                               initWithCustomView:litemButtom];
    [self.navigationItem setLeftBarButtonItem:lbutton];
    
    /*
     * 导航栏返回Btn
     */
    UIButton *itemButtom = [UIButton  buttonWithType:UIButtonTypeCustom];
    [itemButtom setFrame:CGRectMake(0, 0, 30, 40)];
    [itemButtom setImage:[UIImage imageWithIcon:@"fa-search" backgroundColor:UIColor.clearColor iconColor:COLOREE andSize:CGSizeMake(25, 25)] forState:UIControlStateNormal];
    UG_WEAKSELF
    [itemButtom ug_addEvents:UIControlEventTouchUpInside andBlock:^(id  _Nonnull sender) {
        [titleView endEditing:YES];
        weakSelf.pageNum = 0;
        [weakSelf.productList removeAllObjects];
        weakSelf.keyword = titleView.text;
        [self seatchProduct];
    }];
    UIBarButtonItem *button = [[UIBarButtonItem alloc]
                               initWithCustomView:itemButtom];
    [self.navigationItem setRightBarButtonItems:@[button]];

}



-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
}


@end
