//
//  MyOrderController.m
//  LifeBox
//
//  Created by Lucky on 2019/9/5.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "MyOrderController.h"
#import "OrderViewCell.h"
#import "OrderDetailsController.h"

@interface MyOrderController ()<UITableViewDelegate, UITableViewDataSource> {
    ///数据展示tableView
    UITableView *tableView;
    ///选择View
    UIView *chooseView;
    ///指示线
    UIView *lineView;
}

@end

static NSString *cellID = @"OrderViewCellID";

@implementation MyOrderController

#pragma mark - 视图层
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setWhiteNaviWithTitle:@"我的订单"];
    self.view.backgroundColor = S_COBackground;
    [self createUI];
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 顶部选择View
     */
    chooseView = [[UIView alloc] init];
    chooseView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:chooseView];
    [chooseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(90));
    }];
    /*
     * 全部Btn
     */
    CGFloat btnW = Screen_width/6;
    UIButton *allBtn = [[UIButton alloc] init];
    allBtn.tag = 10;
    allBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    [allBtn setTitle:@"全部" forState:UIControlStateNormal];
    [allBtn setTitleColor:RGBColor(51, 51, 51) forState:UIControlStateNormal];
    [allBtn addTarget:self action:@selector(chooseBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [chooseView addSubview:allBtn];
    [allBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(0);
        make.width.mas_equalTo(btnW);
        make.height.mas_equalTo(self->chooseView.mas_height);
    }];
    /*
     * 待付款
     */
    UIButton *paymentBtn = [[UIButton alloc] init];
    paymentBtn.tag = 11;
    paymentBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    [paymentBtn setTitle:@"待付款" forState:UIControlStateNormal];
    [paymentBtn setTitleColor:RGBColor(51, 51, 51) forState:UIControlStateNormal];
    [paymentBtn addTarget:self action:@selector(chooseBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [chooseView addSubview:paymentBtn];
    [paymentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.mas_equalTo(allBtn);
        make.left.mas_equalTo(allBtn.mas_right);
        make.height.mas_equalTo(self->chooseView.mas_height);
    }];
    /*
     * 待发货
     */
    UIButton *sendBtn = [[UIButton alloc] init];
    sendBtn.tag = 12;
    sendBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    [sendBtn setTitle:@"待自提" forState:UIControlStateNormal];
    [sendBtn setTitleColor:RGBColor(51, 51, 51) forState:UIControlStateNormal];
    [sendBtn addTarget:self action:@selector(chooseBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [chooseView addSubview:sendBtn];
    [sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.mas_equalTo(allBtn);
        make.left.mas_equalTo(paymentBtn.mas_right);
        make.height.mas_equalTo(self->chooseView.mas_height);
    }];
    /*
     * 待收货
     */
    UIButton *receivedBtn = [[UIButton alloc] init];
    receivedBtn.tag = 13;
    receivedBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    [receivedBtn setTitle:@"待配送" forState:UIControlStateNormal];
    [receivedBtn setTitleColor:RGBColor(51, 51, 51) forState:UIControlStateNormal];
    [receivedBtn addTarget:self action:@selector(chooseBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [chooseView addSubview:receivedBtn];
    [receivedBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.mas_equalTo(allBtn);
        make.left.mas_equalTo(sendBtn.mas_right);
        make.height.mas_equalTo(self->chooseView.mas_height);
    }];
    /*
     * 已完成
     */
    UIButton *finishBtn = [[UIButton alloc] init];
    finishBtn.tag = 14;
    finishBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    [finishBtn setTitle:@"已完成" forState:UIControlStateNormal];
    [finishBtn setTitleColor:RGBColor(51, 51, 51) forState:UIControlStateNormal];
    [finishBtn addTarget:self action:@selector(chooseBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [chooseView addSubview:finishBtn];
    [finishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.mas_equalTo(allBtn);
        make.left.mas_equalTo(receivedBtn.mas_right);
        make.height.mas_equalTo(self->chooseView.mas_height);
    }];
    /*
     * 待评价
     */
    UIButton *evaluateBtn = [[UIButton alloc] init];
    evaluateBtn.tag = 15;
    evaluateBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    [evaluateBtn setTitle:@"待评价" forState:UIControlStateNormal];
    [evaluateBtn setTitleColor:RGBColor(51, 51, 51) forState:UIControlStateNormal];
    [evaluateBtn addTarget:self action:@selector(chooseBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [chooseView addSubview:evaluateBtn];
    [evaluateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.mas_equalTo(allBtn);
        make.left.mas_equalTo(finishBtn.mas_right);
        make.height.mas_equalTo(self->chooseView.mas_height);
    }];
    /*
     * 指示线
     */
    lineView = [[UIView alloc] init];
    lineView.backgroundColor = S_COGreenBack;
    [chooseView addSubview:lineView];
    UIButton *selectBtn;
    switch (_selectIndex) {
        case 1:
        {
            //待付款
            selectBtn = paymentBtn;
        }
            break;
        case 2:
        {
            //待发货
            selectBtn = sendBtn;
        }
            break;
        case 3:
        {
            //待收货
            selectBtn = receivedBtn;
        }
            break;
        case 4:
        {
            //已完成
            selectBtn = finishBtn;
        }
            break;
        case 5:
        {
            //待评价
            selectBtn = evaluateBtn;
        }
            break;
        default:
        {
            //全选
            selectBtn = allBtn;
        }
            break;
    }
    [selectBtn setTitleColor:S_COGreenText forState:UIControlStateNormal];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(selectBtn.mas_centerX);
        make.width.mas_equalTo(Scale750(80));
        make.height.mas_equalTo(2);
    }];
    /*
     * 数据展示
     */
    tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = S_COBackground;
    tableView.bounces = NO;
    tableView.separatorStyle = UITableViewCellEditingStyleNone;
    tableView.estimatedRowHeight = 60;
    tableView.rowHeight = UITableViewAutomaticDimension;
    //删除单元格分隔线的一个小技巧
    tableView.tableFooterView = [UIView new];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->chooseView.mas_bottom);
        make.left.right.bottom.mas_equalTo(0);
    }];
    
}

#pragma mark - 选择Btn点击
- (void)chooseBtnClicked:(UIButton *)btn {
    /*
     * 改变Btn颜色
     */
    for (UIButton *oldBtn in chooseView.subviews) {
        if ([oldBtn isKindOfClass:[UIButton class]]) {
            [oldBtn setTitleColor:RGBColor(51, 51, 51) forState:UIControlStateNormal];
        }
    }
    [btn setTitleColor:S_COGreenText forState:UIControlStateNormal];
    
    /*
     * 改变划线位置
     */
    [lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(btn.mas_centerX);
        make.width.mas_equalTo(Scale750(80));
        make.height.mas_equalTo(2);
    }];
}

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[OrderViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.backgroundColor = S_COBackground;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderDetailsController *detailsCtl = [[OrderDetailsController alloc] init];
    [self.navigationController pushViewController:detailsCtl animated:YES];
}

@end
