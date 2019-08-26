//
//  MyViewController.m
//  LifeBox
//
//  Created by Lucky on 2019/8/6.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "MyViewController.h"
#import "MyOrderCell.h"
#import "MyWalletCell.h"
#import "MyToolCell.h"
#import "ProfitViewController.h"

@interface MyViewController ()<UITableViewDelegate, UITableViewDataSource, OrderCellDelegate, WalletCellDelegate, TooltCellDelegate>

///数据展示
@property (strong, nonatomic) UITableView *tableView;

@end

///orderCellID
static NSString *orderCellID = @"OrderCellID";
///walletCellID
static NSString *walletCellID = @"WalletCellID";
///toolCellID
static NSString *toolCellID = @"ToolCellID";

@implementation MyViewController

#pragma mark - 视图层
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    [self.view endEditing:YES];
}

#pragma mark - 加载视图
- (void)createUI {
    /*
     * 创建数据展示TableView
     */
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = RGBColor(245, 245, 245);
    _tableView.separatorStyle = UITableViewCellEditingStyleNone;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    /*
     * 属性设置
     */
    if (@available(iOS 11.0, *)) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    _tableView.bounces = NO;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    /*
     * 头部View
     */
    UIImageView *headImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, Scale750(360) + SAFE_Top)];
    headImg.image = [UIImage imageNamed:@"my_background"];
    headImg.userInteractionEnabled = YES;
    _tableView.tableHeaderView = headImg;
    /*
     * 设置Btn
     */
    UIButton *setBtn = [[UIButton alloc] init];
    [setBtn setBackgroundImage:[UIImage imageNamed:@"ic_setting"] forState:UIControlStateNormal];
    [setBtn setBackgroundImage:[UIImage imageNamed:@"ic_setting"] forState:UIControlStateHighlighted];
    [headImg addSubview:setBtn];
    [setBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(SAFE_Top);
        make.right.mas_equalTo(-Scale750(50));
        make.width.height.mas_equalTo(Scale750(70));
    }];
    /*
     * 头像
     */
    UIButton *headBtn = [[UIButton alloc] init];
    [headBtn setBackgroundImage:[UIImage imageNamed:@"ic_avatarHeadImg"] forState:UIControlStateNormal];
    [headBtn setBackgroundImage:[UIImage imageNamed:@"ic_avatarHeadImg"] forState:UIControlStateHighlighted];
    [headImg addSubview:headBtn];
    [headBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(SAFE_Top + Scale750(80));
        make.centerX.mas_equalTo(headImg);
        make.width.height.mas_equalTo(Scale750(150));
    }];
    /*
     * 昵称
     */
    UILabel *nickLab = [[UILabel alloc] init];
    nickLab.font = [UIFont systemFontOfSize:Scale750(35)];
    nickLab.text = @"我就是个昵称";
    nickLab.textColor = [UIColor whiteColor];
    [headImg addSubview:nickLab];
    [nickLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(headBtn.mas_bottom).mas_offset(Scale750(20));
        make.centerX.mas_equalTo(headImg);
        make.width.height.mas_greaterThanOrEqualTo(10);
    }];
}

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    if (indexPath.row == 0) {
        MyOrderCell *orderCell = [tableView dequeueReusableCellWithIdentifier:orderCellID];
        if (orderCell == nil) {
            orderCell = [[MyOrderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderCellID];
        }
        orderCell.orderDelegate = self;
        orderCell.backgroundColor = RGBColor(245, 245, 245);
        orderCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return orderCell;
    }
    else if (indexPath.row == 1) {
        MyWalletCell *walletCell = [tableView dequeueReusableCellWithIdentifier:walletCellID];
        if (walletCell == nil) {
            walletCell = [[MyWalletCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:walletCellID];
        }
        walletCell.walletDelegate = self;
        walletCell.backgroundColor = RGBColor(245, 245, 245);
        walletCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return walletCell;
    }else {
        MyToolCell *toolCell = [tableView dequeueReusableCellWithIdentifier:toolCellID];
        if (toolCell == nil) {
            toolCell = [[MyToolCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:toolCellID];
        }
        toolCell.tooltDelegate = self;
        toolCell.backgroundColor = RGBColor(245, 245, 245);
        toolCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return toolCell;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return Scale750(270);
}

#pragma mark - 模块点击代理
- (void)orderCellSelectWithTag:(NSInteger)selectIndex {
    DDLogVerbose(@"\n🏷当前订单模块点击: %ld🏷", (long)selectIndex);
}

- (void)walletCellSelectWithTag:(NSInteger)selectIndex {
    switch (selectIndex) {
        case 0:
        {
            [UIView ug_msg:@"window弹框测试"];
        }
            break;
        case 1:
        {
            //奖励收益
            ProfitViewController *profitCtl = [[ProfitViewController alloc] init];
            profitCtl.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:profitCtl animated:YES];
        }
            break;
        default:
            break;
    }
}

- (void)toolCellSelectWithTag:(NSInteger)selectIndex {
    DDLogVerbose(@"\n🏷当前工具模块点击: %ld🏷", (long)selectIndex);
}

@end
