//
//  GoodsCommentsController.m
//  LifeBox
//
//  Created by Lucky on 2019/9/26.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "GoodsCommentsController.h"
#import "CommentsCell.h"

@interface GoodsCommentsController ()<UITableViewDelegate, UITableViewDataSource> {
    ///评论数据展示
    UITableView *tableView;
}
@property(strong, nonatomic) NSArray* dataList;//数据源
@end

static NSString *cellID = @"CommentsCellID";

@implementation GoodsCommentsController

#pragma mark - 视图层
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setWhiteNaviWithTitle:@"商品评价(66)"];
    self.view.backgroundColor = S_COBackground;
    [self createUI];
    [self requestHttp];
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 数据展示
     */
    tableView = [[UITableView alloc] init];
    tableView.backgroundColor = S_COBackground;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
//    tableView.separatorStyle = UITableViewCellEditingStyleNone;
    tableView.estimatedRowHeight = 60;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.tableFooterView = [UIView new];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
}

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CommentsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[CommentsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    ProductCommentModel *data = [_dataList objectAtIndex:indexPath.row];
    [cell reloadUI:data];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataList.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(void)requestHttp{
    UG_WEAKSELF
    [[NetWorkRequest new] commentlist:_productId pageSize:10 pageNum:1 block:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
        if (error) {
            [self.view ug_msg:error.domain];
        }else{
            weakSelf.dataList = [NSArray yy_modelArrayWithClass:[ProductCommentModel class] json:dataDict];
            [self->tableView reloadData];
        }
    }];
}
@end
