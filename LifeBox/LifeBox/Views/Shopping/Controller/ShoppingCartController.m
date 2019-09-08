//
//  ShoppingCartController.m
//  LifeBox
//
//  Created by Lucky on 2019/8/6.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "ShoppingCartController.h"
#import "ShoppingCarCell.h"
#import "NetWorkRequest+Shoping.h"
#import "CardItem.h"
#import <SDWebImage/SDWebImage.h>
#import "GoodsDefViewController.h"
#import "NoDataView.h"
#import "CarBottomView.h"
#import "ConfimOrderVC.h"
@interface ShoppingCartController ()<UITableViewDelegate, UITableViewDataSource, CellNumBtnDelegate> {
    ///数据展示
    UITableView *tableView;
}
@property(strong, nonatomic)NSArray *carItemlist;

// 底部结算view
@property(strong, nonatomic)CarBottomView *bottomView;

///无数据view
@property (strong, nonatomic) NoDataView *noView;

@end

static NSString *cellID = @"ShoppingCarCellID";

@implementation ShoppingCartController

#pragma mark - 视图层
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"购物车";
    UIImage *temBackImage = [UIImage imageNamed:@"navBackImage"];
    UIImage *backgroundImage = [temBackImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeStretch];
    [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    self.view.backgroundColor = S_COBackground;
    /*
     * 导航栏右边按钮
     */
    UIButton *editBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [editBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [editBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [editBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [editBtn addTarget:self action:@selector(editBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:editBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    [self createUI];
    [self loadData];
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 底部功能View
     */
    self.bottomView = [[CarBottomView alloc] init];
    _bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_bottomView];
    [_bottomView.settlementBtn ug_addEvents:UIControlEventTouchUpInside andBlock:^(id  _Nonnull sender) {
        [self dobuy];
    }];

    /*
     * 数据展示
     */
    tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = S_COBackground;
    tableView.separatorStyle = UITableViewCellEditingStyleNone;
    [self.view addSubview:tableView];

}

#pragma mark - 编辑按钮点击
- (void)editBtnClicked {
    _noView = [[NoDataView alloc] init];
    _noView.imgName = @"ic_gouwuchekong";
    _noView.titleStr = @"您的购物车空空如也～";
    _noView.btnStr = @"去逛逛";
    _noView.backgroundColor = [UIColor whiteColor];
    __weak __typeof(self) weakSelf = self;
    _noView.btnBlock = ^{
        [weakSelf.noView removeFromSuperview];
    };
    [self.view addSubview:_noView];
    [_noView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
}

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShoppingCarCell *goodsCell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (goodsCell == nil) {
        goodsCell = [[ShoppingCarCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        goodsCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    CardItem *data = [_carItemlist objectAtIndex:indexPath.row];
    goodsCell.addBtn.tag = indexPath.row;
    goodsCell.reduceBtn.tag = indexPath.row;
    goodsCell.delegate = self;
    [goodsCell.goodsImg sd_setImageWithURL:UG_URL(data.icon)];
    goodsCell.goodsName.text = data.pmsProduct.name;
    goodsCell.speciLab.text = data.spstr;
    goodsCell.goodsMoney.text = [NSString stringWithFormat:@"¥%.2f",data.pmsSkuStock.price];
    return goodsCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _carItemlist.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return Scale750(270);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GoodsDefViewController *goodsDefViewController = [GoodsDefViewController new];
    CardItem *data = [_carItemlist objectAtIndex:indexPath.row];
    goodsDefViewController.productid = data.productId;
    [self.navigationController pushViewController:goodsDefViewController animated:YES];
}
#pragma mark - 数量选择代理
- (void)addBtnClicked:(UIButton *)btn {
    DDLogVerbose(@"第%ld行Cell上，添加Btn被点击", (long)btn.tag);
}

- (void)reduceBtnClicked:(UIButton *)btn {
    DDLogVerbose(@"第%ld行Cell上，减少Btn被点击", (long)btn.tag);
}

-(void)loadData{
    [[[NetWorkRequest alloc]init] cartlistblock:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
        if (error) {
            [self.view ug_msg:error.domain];
        }else{
            self.carItemlist = [NSMutableArray yy_modelArrayWithClass:[CardItem class] json:dataDict];
            [self->tableView reloadData];
        }
    }];
}
//结算
-(void)dobuy{
    NSMutableArray *cars = [[NSMutableArray alloc]initWithCapacity:0];
    for ( CardItem *data in _carItemlist) {
        [cars addObject:[NSString stringWithFormat:@"%zd",data.id]];
    }
    NSString *remark = [cars componentsJoinedByString:@","];
    [[[NetWorkRequest alloc]init] confirmOrdertype:1 remark:remark block:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
        if (error) {
            [self.view ug_msg:error.domain];
        }else{
            ConfimOrderVC *vc = [ConfimOrderVC new];
            vc.confimid = [dataDict[@"id"] integerValue];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }];
}

-(void)viewLayoutMarginsDidChange{
    [super viewLayoutMarginsDidChange];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(90));
    }];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(self.bottomView.mas_top);
    }];
}

@end
