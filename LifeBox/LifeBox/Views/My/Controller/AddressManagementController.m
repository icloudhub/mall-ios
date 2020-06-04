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
    /// 数据展示UITableView
    UITableView *tableView;
}
@property(strong, nonatomic) AddressManageFooter *footerView;
///地址数组
@property (strong, nonatomic) NSArray *addreddArr;

@end

static NSString *cellID = @"AddressManageCellID";

@implementation AddressManagementController

#pragma mark - 视图层
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"收货地址"];
    self.view.backgroundColor = S_COBackground;
    [self createUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self getAddressListHttp];
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
    
    [self.view addSubview:self.footerView];
}
-(AddressManageFooter *)footerView{
    if (!_footerView) {
        _footerView =[AddressManageFooter new];
    }
    return _footerView;
}

#pragma mark - 适配
- (void)viewLayoutMarginsDidChange {
    [super viewLayoutMarginsDidChange];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    [_footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
        make.height.mas_equalTo(44+SAFE_Bottom);
    }];
}

#pragma mark - 添加收货地址
- (void)addBtnClicked {
    AddressEditController *addCtl = [[AddressEditController alloc] init];
    [self.navigationController pushViewController:addCtl animated:YES];
}

#pragma mark - 编辑收货地址
- (void)editBtnClicked:(UIButton *)btn {
    AddressEditController *passCtl = [[AddressEditController alloc] init];
    passCtl.passData = [self.addreddArr objectAtIndex:btn.tag];
    [self.navigationController pushViewController:passCtl animated:YES];
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
    [cell reloadCellUIWith:[self.addreddArr objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.addreddArr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return Scale750(190);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_didselectAddress) {
        AddressData *selectData =  [self.addreddArr objectAtIndex:indexPath.row];
        _didselectAddress(selectData);
    }
}

#pragma mark - 获取地址列表接口
- (void)getAddressListHttp {
    [self.view ug_starloading];
    [[[NetWorkRequest alloc] init] getAddressListBlock:^(NSDictionary * _Nonnull result, NSError * _Nonnull error) {
        [self.view ug_stoploading];
        if (error) {
            [self.view ug_msg:error.domain];
        }else{
            self.addreddArr = [NSArray modelArrayWithClass:[AddressData class] json:result];
            [self->tableView reloadData];
        }
    }];
}


@end
