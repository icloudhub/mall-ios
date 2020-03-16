//
//  GoodsClassesVC.m
//  LifeBox
//
//  Created by admin on 2020/2/13.
//  Copyright © 2020 Lucky. All rights reserved.
//

#import "GoodsClassesVC.h"

#import "MJRefresh.h"

#import "BlockTableView.h"
#include "BlockCollectionView.h"
#import "CategoryModel.h"

@interface GoodsClassesVC ()

/// 左边列表
@property(strong, nonatomic) BlockTableView *leftTableView;

// 右边内容
@property(strong, nonatomic) BlockCollectionView *collectionView;

// 分类数组
@property(strong ,nonatomic) NSMutableArray *categoryList;

// 选中的分类
@property(strong ,nonatomic) CategoryModel *seleCtcategory;

// 商品数组
@property(strong ,nonatomic) NSMutableArray *productList;
@end

@implementation GoodsClassesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品分类";
    [self.view addSubview:self.leftTableView];
    [self.view addSubview:self.collectionView];
    [self getCategory];
    
   
}
-(void)setSeleCtcategory:(CategoryModel *)seleCtcategory{
    _seleCtcategory = seleCtcategory;
    [self.leftTableView.tableview reloadData];
    [self seatchProduct];
}

-(BlockTableView *)leftTableView{
    UG_WEAKSELF
    if (!_leftTableView) {
        _leftTableView = [BlockTableView new];
        _leftTableView.numberOfRowsInSection = ^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
            return weakSelf.categoryList.count;
        };
        _leftTableView.cellForRowAtIndexPath = ^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleValue1
                                              reuseIdentifier: @"defualcell"];
            }
            CategoryModel *data = [weakSelf.categoryList objectAtIndex:indexPath.row];
            if ([data isEqual:weakSelf.seleCtcategory]) {
                cell.backgroundColor = UIColor.redColor;
            }else{
                cell.backgroundColor = UIColor.whiteColor;
            }
            cell.textLabel.text = data.name;
            return cell;
        };
        _leftTableView.didSelectRowAtIndexPath = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
            CategoryModel *data = [weakSelf.categoryList objectAtIndex:indexPath.row];
            weakSelf.seleCtcategory = data;
      
        };
        
    }
    return _leftTableView;
}

-(BlockCollectionView *)collectionView{
    UG_WEAKSELF
    if (!_collectionView) {
        _collectionView = [BlockCollectionView new];
        _collectionView.flowLayout.minimumLineSpacing = 8.f;
         _collectionView.flowLayout.minimumInteritemSpacing = 8.f;

        _collectionView.ug_numberOfItemsInSection = ^NSInteger(UICollectionView * _Nonnull collectionView, NSInteger section) {
            return weakSelf.productList.count;
        };
        _collectionView.ug_cellForItemAtIndexPath = ^__kindof UICollectionViewCell * _Nonnull(UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
            BlockCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
            cell.backgroundColor = [UIColor yellowColor];
            NSDictionary *dic = [weakSelf.productList objectAtIndex:indexPath.row];
            cell.titleLab.text = dic[@"name"];
            [cell.imageView sd_setImageWithURL:UG_URL(dic[@"pic"])];
            return cell;
        };
        _collectionView.ug_sizeForItemAtIndexPath = ^CGSize(UICollectionView * _Nonnull collectionView, UICollectionViewLayout * _Nonnull layout, NSIndexPath * _Nonnull indexPath) {
            return CGSizeMake(120, 120);
        };
        _collectionView.ug_didSelectItemAtIndexPath = ^(UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
            
        };
        
        self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            NSInteger row = [weakSelf.categoryList  indexOfObject:weakSelf.seleCtcategory];
            row --;
            row = (row>=0)? row :0;
            weakSelf.seleCtcategory = [weakSelf.categoryList objectAtIndex:row];
         
        }];
        
        // 上拉刷新
        self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
       
            NSInteger row = [weakSelf.categoryList  indexOfObject:weakSelf.seleCtcategory];
            row ++;
            row = (row >=weakSelf.categoryList.count) ? weakSelf.categoryList.count-1 :row;
            weakSelf.seleCtcategory = [weakSelf.categoryList objectAtIndex:row];
      
        }];
    }
    return _collectionView;
}


#pragma mark --request
-(void)getCategory{
    UG_WEAKSELF
    [[NetWorkRequest new] categoryWithID:@"2" endBlock:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
        if (!error) {
            weakSelf.categoryList =[NSMutableArray arrayWithArray:[NSArray modelArrayWithClass:[CategoryModel class] json:dataDict]];
            weakSelf.seleCtcategory = [weakSelf.categoryList objectAtIndex:0];
            [weakSelf.leftTableView.tableview reloadData];
        }else{
            [self.view ug_msg:error.domain];
        }
    }];
}

-(void)seatchProduct{
    UG_WEAKSELF
    [[NetWorkRequest new] productsearch:NULL brandId:NULL productCategoryId:_seleCtcategory.id sort:NULL pageSize:@"10" pageNum:@"0" endBlock:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
        if (!error) {
            weakSelf.productList = [dataDict objectForKey:@"list"];
            [weakSelf.collectionView reloadData];
            [self.collectionView.mj_header endRefreshing];
            [self.collectionView.mj_footer endRefreshing];
        }else{
            [self.view ug_msg:error.domain];
        }
    }];
}


-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    [self.leftTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.width.mas_equalTo(120);
        make.top.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
    }];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.mas_equalTo(self.leftTableView.mas_right);
          make.right.mas_equalTo(self.view);
          make.top.mas_equalTo(self.view);
          make.bottom.mas_equalTo(self.view);
      }];
    
}


@end
