//
//  AddressManagementController.m
//  LifeBox
//
//  Created by Lucky on 2019/9/9.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "AddressManagementController.h"
#import "AddressManageCell.h"
#import "AddressEditController.h"

@interface AddressManagementController ()<UITableViewDelegate, UITableViewDataSource> {
    ///数据展示UITableView
    UITableView *tableView;
}

@end

static NSString *cellID = @"AddressManageCellID";

@implementation AddressManagementController

#pragma mark - 视图层
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setWhiteNaviWithTitle:@"收货地址"];
    self.view.backgroundColor = S_COBackground;
    [self createUI];
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 导航栏右边按钮
     */
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [addBtn setTitle:@"新增收货地址" forState:UIControlStateNormal];
    [addBtn setTitleColor:S_COGreenText forState:UIControlStateNormal];
    [addBtn setTitleColor:S_COGreenText forState:UIControlStateHighlighted];
    [addBtn addTarget:self action:@selector(addBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:addBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    /*
     * 数据展示
     */
    tableView = [[UITableView alloc] init];
    tableView.backgroundColor = S_COBackground;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellEditingStyleNone;
    tableView.tableFooterView = [UIView new];
    [self.view addSubview:tableView];
}

#pragma mark - 适配
- (void)viewLayoutMarginsDidChange {
    [super viewLayoutMarginsDidChange];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
}

#pragma mark - 添加收货地址
- (void)addBtnClicked {
    AddressEditController *addCtl = [[AddressEditController alloc] init];
    addCtl.markStr = @"0";
    [self.navigationController pushViewController:addCtl animated:YES];
}

#pragma mark - 编辑收货地址
- (void)editBtnClicked:(UIButton *)btn {
    AddressEditController *addCtl = [[AddressEditController alloc] init];
    addCtl.markStr = @"1";
    [self.navigationController pushViewController:addCtl animated:YES];
}

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AddressManageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[AddressManageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.editBtn.tag = indexPath.row;
    [cell.editBtn addTarget:self action:@selector(editBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return Scale750(190);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
