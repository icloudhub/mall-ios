//
//  HomeViewController.m
//  LifeBox
//
//  Created by Lucky on 2019/8/3.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "HomeViewController.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
#import "NoticeView.h"
#import "HomeToolCell.h"
#import "HomeGoodsCell.h"
#import "HomeProductdata.h"
#import "HomeData.h"
#import "SubjectData.h"
#import "GoodsDefViewController.h"
#import "WebViewController.h"
#import "GoodsListViewController.h"



#import "LoginViewController.h"

@interface HomeViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource> {
    ///按钮功能数据展示
    UICollectionView *collectionView;
    ///数据展示
    UITableView *tableView;
}

///轮播View
@property (strong, nonatomic) SDCycleScrollView *scrollView;
///通知View
@property (strong, nonatomic) NoticeView *notice;
@property (strong, nonatomic) NSArray *likeproducts;
@property (strong, nonatomic) HomeData *homedata;
@end

///HomeGoodsCellID
static NSString *homeGoodsCellID = @"HomeGoodsCellID";

@implementation HomeViewController

#pragma mark - 视图层
- (void)viewDidLoad {
//     self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [self recommendProduct];
    [self homePageDataRequest];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    [self.view endEditing:YES];
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 商品展示tableView
     */
    tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellEditingStyleNone;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    /*
     * 属性设置
     */
    if (@available(iOS 11.0, *)) {
        tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    /*
     * 顶部View
     */
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, Scale750(790))];
    topView.backgroundColor = S_COBackground;
    tableView.tableHeaderView = topView;
   

    /*
     * 搜索View
     */
    UIView *searchView = [[UIView alloc] init];
    searchView.backgroundColor = [UIColor whiteColor];
    [topView addSubview:searchView];
    [searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(SAFE_Top + Scale750(88));
    }];

    /*
     * 分享Btn
     */
    UIButton *shareBtn = [[UIButton alloc] init];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"ic_share"] forState:UIControlStateNormal];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"ic_share"] forState:UIControlStateHighlighted];
    [searchView addSubview:shareBtn];
    [shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-Scale750(30));
        make.bottom.mas_equalTo(-Scale750(20));
        make.width.height.mas_equalTo(Scale750(44));
    }];
    [shareBtn bk_addEventHandler:^(id sender) {
        [UIApplication gotoLoginCtl];
//        LoginViewController *ctl = [[LoginViewController alloc] init];
//        ctl.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:ctl animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    /*
     * 自定义搜索框
     */
    UIButton *searchBtn = [[UIButton alloc] init];
    searchBtn.layer.cornerRadius = Scale750(35);
    searchBtn.backgroundColor = S_COBackground;
    [searchBtn setImage:[UIImage imageNamed:@"ic_search"] forState:UIControlStateNormal];
    [searchBtn setImage:[UIImage imageNamed:@"ic_search"] forState:UIControlStateHighlighted];
    [searchBtn setTitle:@"土鸡蛋" forState:UIControlStateNormal];
    [searchBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    searchBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0,  0);
    searchBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(28)];
    [searchView addSubview:searchBtn];
    [searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(Scale750(30));
        make.centerY.mas_equalTo(shareBtn.mas_centerY);
        make.right.mas_equalTo(shareBtn.mas_left).mas_offset(-Scale750(30));
        make.height.mas_equalTo(Scale750(70));
    }];
    [searchBtn bk_addEventHandler:^(id sender) {
        GoodsListViewController *goodsListViewController = [GoodsListViewController new];
        goodsListViewController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:goodsListViewController animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];

    /*
     * 轮播View创建
     */
    _scrollView = [[SDCycleScrollView alloc] init];
    _scrollView.backgroundColor = S_COBackground;
    _scrollView.bannerImageViewContentMode = UIViewContentModeScaleToFill;
    _scrollView.autoScrollTimeInterval = 8;
    _scrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
   
    [_scrollView ug_radius:S_Panding_MID];

    [topView addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(searchView.mas_bottom);
        make.left.mas_equalTo(SPanding_MIN);
        make.right.mas_equalTo(-SPanding_MIN);
        make.height.mas_equalTo(Scale750(330));
    }];
    /*
     * 通知View
     */
    self.notice = [[NoticeView alloc] init];
    _notice.backgroundColor = [UIColor whiteColor];
    [topView addSubview:_notice];
    [_notice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_scrollView.mas_bottom);
        make.left.mas_equalTo(SPanding_MIN);
        make.right.mas_equalTo(-SPanding_MIN);
        make.height.mas_equalTo(Scale750(90));
    }];
    
    [_notice addGestureRecognizer:[UITapGestureRecognizer bk_recognizerWithHandler:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
        HomeNotiData *temdata = self->_homedata.notiArr.firstObject;
        [self subjectDef:temdata.id];
    }]];
    /*
     * 可点击数据区域
     */
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.scrollEnabled = YES;
    collectionView.pagingEnabled = YES;
    collectionView.bounces = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.backgroundColor = [UIColor whiteColor];
    [collectionView registerClass:[HomeToolCell class] forCellWithReuseIdentifier:@"HomeToolCellID"];
    [topView addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.notice.mas_bottom).mas_offset(0);
        make.left.mas_equalTo(SPanding_MIN);
        make.right.mas_equalTo(-SPanding_MIN);
        make.bottom.mas_equalTo(topView).mas_offset(-8);
    }];
    tableView.tableHeaderView = topView;

}

-(void)reloadUI{
    //轮播图
     NSMutableArray *temp = [NSMutableArray new];
    [_homedata.bannerArr enumerateObjectsUsingBlock:^(HomeBannerData * obj, NSUInteger idx, BOOL * stop) {
         [temp addObject:obj.pic];
    }];
     _scrollView.imageURLStringsGroup = temp;
    //
    [collectionView reloadData];
    //通知
    [_notice reload:_homedata.notiArr];
    
}
#pragma mark - CollectionView代理
//设置CollectionCell的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeToolCell *cell = (HomeToolCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"HomeToolCellID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    HomeToolData *cellData = [_homedata.toolArr objectAtIndex:indexPath.row];
    [cell reloadCellUIWithData:cellData];
    
    return cell;
}

//设置CollectionView的组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//设置CollectionView每组所包含的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

//定义每个UICollectionView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((Screen_width-10)/4, Scale750(180));
}

//定义整个CollectionViewCell与整个View的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);//（上、左、下、右）
}

//定义每个UICollectionView的横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

//定义每个UICollectionView的纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeToolData *cellData = [_homedata.toolArr objectAtIndex:indexPath.row];
    GoodsListViewController *goodsListViewController = [GoodsListViewController new];
    goodsListViewController.brandId = cellData.id;
    goodsListViewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:goodsListViewController animated:YES];
}

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeGoodsCell *goodsCell = [tableView dequeueReusableCellWithIdentifier:homeGoodsCellID];
    if (goodsCell == nil) {
        goodsCell = [[HomeGoodsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:homeGoodsCellID];
        goodsCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    HomeProductdata *data = [_likeproducts objectAtIndex:indexPath.row];
    goodsCell.addBtn.tag = indexPath.row;
    [goodsCell reloadHomeGoodsCellUIWith:data];
    return goodsCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _likeproducts.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return Scale750(210);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GoodsDefViewController *goodsDefViewController = [GoodsDefViewController new];
    HomeProductdata *data = [_likeproducts objectAtIndex:indexPath.row];
    goodsDefViewController.productid = data.id;
    goodsDefViewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:goodsDefViewController animated:YES];
}

#pragma mark - 首页数据接口
- (void)homePageDataRequest {
//    [self.view ug_starloading];
    [[[NetWorkRequest alloc] init] getHomeInfoendblock:^(NSDictionary * _Nonnull result, NSError * _Nonnull error) {
        if (error) {
            [self.view ug_msg:error.domain];
        }else{
            self.homedata = [HomeData modelWithJSON:result];
            [self reloadUI];
        }
    }];
}

#pragma mark - 为你推荐接口
- (void)recommendProduct{
    [[[NetWorkRequest alloc] init] recommendProductListblock:^(NSDictionary * _Nonnull result, NSError * _Nonnull error) {
        if (error) {
            [self.view ug_msg:error.domain];
        }else{
            self.likeproducts = [NSArray modelArrayWithClass:[HomeProductdata class] json:result];
            [self->tableView reloadData];
        }
    }];
}

#pragma mark - 去专题详情
-(void)subjectDef:(NSString*)subjectid{
  
    WebViewController *vc = [WebViewController new];
    NSString* tocken = Global_Variable.shared.token;
    NSString* str = [NSString stringWithFormat:@"%@:15677/#/subject?loginToken=%@",Global_Variable.shared.serviceIP, tocken];
    vc.url = UG_URL(str);
    [vc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];
    return;
 
}

@end
