//
//  ProfitViewController.m
//  LifeBox
//
//  Created by Lucky on 2019/8/23.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "ProfitViewController.h"
#import "ProfitViewCell.h"

@interface ProfitViewController ()<UITableViewDelegate, UITableViewDataSource> {
    ///数据展示tableView
    UITableView *tableView;
}

@end

///ProfitViewCellID
static NSString *profitViewCellID = @"ProfitViewCellID";

@implementation ProfitViewController

#pragma mark - 视图层
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"奖励收益"];
    self.view.backgroundColor = S_COBackground;
    [self createUI];
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 顶部数据View
     */
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(460));
    }];
    /*
     * 当前收益文字
     */
    UILabel *profitLab = [[UILabel alloc] init];
    profitLab.font = [UIFont systemFontOfSize:Scale750(38)];
    profitLab.text = @"您的当前收益";
    [topView addSubview:profitLab];
    [profitLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(50));
        make.centerX.mas_equalTo(topView.mas_centerX);
        make.height.width.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 收益金额
     */
    UILabel *profitMoney = [[UILabel alloc] init];
    profitMoney.font = [UIFont systemFontOfSize:Scale750(60)];
    profitMoney.textColor = S_CORedText;
    profitMoney.text = @"2000.00";
    [topView addSubview:profitMoney];
    [profitMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(profitLab.mas_bottom).mas_offset(Scale750(30));
        make.centerX.mas_equalTo(topView.mas_centerX);
        make.height.width.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 提现按钮
     */
    UIButton *outBtn = [[UIButton alloc] init];
    outBtn.layer.cornerRadius = Scale750(35);
    [outBtn setBackgroundColor:S_COGreenBack];
    [outBtn setTitle:@"立即提现" forState:UIControlStateNormal];
    [outBtn setTitleColor:[UIColor whiteColor]
                 forState:UIControlStateNormal];
    outBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    [topView addSubview:outBtn];
    [outBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(profitMoney.mas_bottom).mas_offset(Scale750(30));
        make.centerX.mas_equalTo(topView.mas_centerX);
        make.width.mas_equalTo(Scale750(280));
        make.height.mas_equalTo(Scale750(70));
    }];
    /*
     * 横分割线
     */
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = S_COBackground;
    [topView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(outBtn.mas_bottom).mas_offset(Scale750(40));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    /*
     * 竖分割线
     */
    UIView *lineViewH = [[UIView alloc] init];
    lineViewH.backgroundColor = S_COBackground;
    [topView addSubview:lineViewH];
    [lineViewH mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView.mas_bottom).mas_offset(Scale750(20));
        make.bottom.mas_equalTo(topView.mas_bottom).mas_offset(-Scale750(20));
        make.centerX.mas_equalTo(topView.mas_centerX);
        make.width.mas_equalTo(1);
    }];
    /*
     * 总收益文字
     */
    UILabel *allLab = [[UILabel alloc] init];
    allLab.textColor = RGBColor(170, 170, 170);
    allLab.font = [UIFont systemFontOfSize:Scale750(24)];
    allLab.text = @"总收益(Y)";
    [topView addSubview:allLab];
    [allLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(lineViewH.mas_centerY).mas_offset(-Scale750(10));
        make.centerX.mas_equalTo(lineViewH.mas_centerX).multipliedBy(0.5);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 总收益金额
     */
    UILabel *allMoney = [[UILabel alloc] init];
    allMoney.textColor = S_CORedText;
    allMoney.font = [UIFont systemFontOfSize:Scale750(30)];
    allMoney.text = @"200.00";
    [topView addSubview:allMoney];
    [allMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(allLab.mas_bottom).mas_offset(Scale750(10));
        make.centerX.mas_equalTo(allLab);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 已提现文字
     */
    UILabel *outLab = [[UILabel alloc] init];
    outLab.textColor = RGBColor(170, 170, 170);
    outLab.font = [UIFont systemFontOfSize:Scale750(24)];
    outLab.text = @"已提现(Y)";
    [topView addSubview:outLab];
    [outLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(lineViewH.mas_centerY).mas_offset(-Scale750(10));
        make.centerX.mas_equalTo(lineViewH.mas_centerX).multipliedBy(1.5);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 总收益金额
     */
    UILabel *outMoney = [[UILabel alloc] init];
    outMoney.textColor = S_CORedText;
    outMoney.font = [UIFont systemFontOfSize:Scale750(30)];
    outMoney.text = @"200.00";
    [topView addSubview:outMoney];
    [outMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(outLab.mas_bottom).mas_offset(Scale750(10));
        make.centerX.mas_equalTo(outLab);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 数据展示tableView
     */
    tableView = [[UITableView alloc] init];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topView.mas_bottom).mas_offset(Scale750(40));
        make.left.right.bottom.mas_equalTo(0);
    }];
    /*
     * 标题显示View
     */
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, Scale750(80))];
    headView.backgroundColor = [UIColor whiteColor];
    //标题
    UILabel *titleLab = [[UILabel alloc] init];
    titleLab.font = [UIFont systemFontOfSize:Scale750(30)];
    titleLab.text = @"收益记录";
    [headView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(headView);
        make.left.mas_equalTo(Scale750(30));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    UIView *headLine = [[UIView alloc] init];
    headLine.backgroundColor = COLOREE;
    [headView addSubview:headLine];
    [headLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(Scale750(30));
        make.bottom.mas_equalTo(-1);
        make.width.mas_equalTo(Screen_width - Scale750(30));
        make.height.mas_equalTo(1);
    }];
    tableView.tableHeaderView = headView;
}

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProfitViewCell *cell = [tableView dequeueReusableCellWithIdentifier:profitViewCellID];
    if (cell == nil) {
        cell = [[ProfitViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:profitViewCellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return Scale750(120);
}

@end
