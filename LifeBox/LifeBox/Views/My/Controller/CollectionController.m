//
//  CollectionController.m
//  LifeBox
//
//  Created by Lucky on 2019/9/3.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "CollectionController.h"
#import "CollectionCell.h"

@interface CollectionController ()<UITableViewDelegate, UITableViewDataSource, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
@property(strong,nonatomic) UITableView *tableView;
@property(strong,nonatomic) NSMutableArray *collections;

@end

static NSString *cellID = @"CollectionCellID";

@implementation CollectionController

#pragma mark - 视图层
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setWhiteNaviWithTitle:@"收藏"];
    self.view.backgroundColor = S_COBackground;
    [self createUI];
    [self getHttpRequest];
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 数据展示
     */
    self.tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.emptyDataSetSource = self;
    _tableView.emptyDataSetDelegate = self;
    _tableView.backgroundColor = S_COBackground;
    _tableView.separatorStyle = UITableViewCellEditingStyleNone;
    // 删除单元格分隔线的一个小技巧
    _tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
}
#pragma mark - get
-(NSMutableArray *)collections{
    if (!_collections) {
        _collections = [NSMutableArray new];
    }
    return _collections;
}
#pragma mark - 接口请求
- (void)getHttpRequest {
    [self.view ug_starloading];
    [[[NetWorkRequest alloc] init] getCommentlistWithMemberId:[Global_Variable shared].userid endBlock:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
        [self.view ug_stoploading];
        if (error) {
            [self.view ug_msg:error.domain];
        }else{
            self.collections = dataDict;
            [self.tableView reloadData];
        }
    }];
}

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[CollectionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSDictionary *dataDict = [self.collections objectAtIndex:indexPath.row];
    [cell.goodsImg sd_setImageWithURL:UG_URL(dataDict[@"productPic"])];
    cell.goodsLab.text = dataDict[@"productName"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.collections.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return Scale750(210);
}

#pragma mark - 空数据代理
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"ic_gouwuchekong"];
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *title = @"暂无收藏，快去逛逛吧";
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont boldSystemFontOfSize:Scale750(28)],
                                 NSForegroundColorAttributeName:[UIColor grayColor]
                                 };
    return [[NSAttributedString alloc] initWithString:title attributes:attributes];
}

@end
