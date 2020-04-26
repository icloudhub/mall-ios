//
//  SureOrderController.m
//  LifeBox
//
//  Created by Lucky on 2019/10/14.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "SureOrderController.h"
#import "OrderTopCell.h"
#import "OrderInfoCell.h"
#import "OrderPromptCell.h"
#import "OrderPriceCell.h"

@interface SureOrderController ()<UITableViewDelegate, UITableViewDataSource> {
    ///底部图片
    UIImageView *bottomImg;
    ///选择Btn1
    UIButton *chooseBtn1;
    ///选择Btn2
    UIButton *chooseBtn2;
    ///添加Btn
    UIButton *addBtn;
    ///价格Lab
    UILabel *priceLab;
    ///订单数据展示
    UITableView *tableView;
}

@end

static NSString *topCellID = @"OrderTopCellID";
static NSString *infoCellID = @"OrderInfoCellID";
static NSString *proCellID = @"OrderPromptCellID";
static NSString *priceCellID = @"OrderPriceCellID";



@implementation SureOrderController

#pragma mark - 视图层
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"确认订单"];
    self.view.backgroundColor = S_COBackground;
    [self createUI];
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 底部图片
     */
    bottomImg = [[UIImageView alloc] init];
    bottomImg.image = [UIImage imageNamed:@"ic_delivery_oneself"];
    bottomImg.userInteractionEnabled = YES;
    [self.view addSubview:bottomImg];
    [bottomImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(30));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(80));
    }];
    /*
     * 官方配送
     */
    chooseBtn1 = [[UIButton alloc] init];
    chooseBtn1.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    [chooseBtn1 setTitle:@"官方配送" forState:UIControlStateNormal];
    [chooseBtn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    chooseBtn1.tag = 1000;
    [chooseBtn1 addTarget:self action:@selector(chooseBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [bottomImg addSubview:chooseBtn1];
    [chooseBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(bottomImg);
        make.width.mas_equalTo(Screen_width/2);
    }];
    /*
     * 到店自取
     */
    chooseBtn2 = [[UIButton alloc] init];
    chooseBtn2.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    [chooseBtn2 setTitle:@"到店自取" forState:UIControlStateNormal];
    [chooseBtn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    chooseBtn2.tag = 1001;
    [chooseBtn2 addTarget:self action:@selector(chooseBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [bottomImg addSubview:chooseBtn2];
    [chooseBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(bottomImg);
        make.width.mas_equalTo(Screen_width/2);
    }];
    /*
     * 顶部View
     */
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bottomImg.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(160));
    }];
    /*
     * 分割线
     */
    UIImageView *lineImg = [[UIImageView alloc] init];
    lineImg.image = [UIImage imageNamed:@"ic_color_block"];
    [topView addSubview:lineImg];
    [lineImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(8));
    }];
    /*
     * 添加Btn
     */
    addBtn = [[UIButton alloc] init];
    [addBtn setImage:[UIImage imageNamed:@"ic_add_toAddress"] forState:UIControlStateNormal];
    [addBtn setTitle:@"请添加地址" forState:UIControlStateNormal];
    [addBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    addBtn.titleEdgeInsets = UIEdgeInsetsMake(0, Scale750(12), 0, 0);
    addBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, Scale750(12));
    [topView addSubview:addBtn];
    [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(topView);
        make.centerY.mas_equalTo(topView);
        make.width.mas_equalTo(Scale750(300));
        make.height.mas_equalTo(Scale750(70));
    }];
    /*
     * 底部View
     */
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(90) + SAFE_Bottom);
    }];
    /*
     * 底部上层View
     */
    UIView *inView = [[UIView alloc] init];
    [bottomView addSubview:inView];
    [inView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(90));
    }];
    /*
     * 提交Btn
     */
    UIButton *submitBtn = [[UIButton alloc] init];
    submitBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    submitBtn.backgroundColor = S_COGreenBack;
    [submitBtn setTitle:@"提交订单" forState:UIControlStateNormal];
    [inView addSubview:submitBtn];
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.mas_equalTo(0);
        make.width.mas_equalTo(Scale750(200));
        make.height.mas_equalTo(inView);
    }];
    /*
     * 价格Lab
     */
    priceLab = [[UILabel alloc] init];
    priceLab.textColor = [UIColor redColor];
    priceLab.font = [UIFont systemFontOfSize:Scale750(28)];
    NSString *priceStr = @"¥12.90";
    priceLab.attributedText = [priceStr strChangFlagWithStr:@"12" Color:S_CORedText Font:Scale750(36)];
    [inView addSubview:priceLab];
    [priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(inView);
        make.right.mas_equalTo(submitBtn.mas_left).mas_offset(-Scale750(20));
        make.width.height.mas_greaterThanOrEqualTo(10);
    }];
    /*
     * 价格固定显示
     */
    UILabel *fixLab = [[UILabel alloc] init];
    fixLab.font = [UIFont systemFontOfSize:Scale750(30)];
    fixLab.text = @"价格:";
    [inView addSubview:fixLab];
    [fixLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(priceLab.mas_left).mas_equalTo(-Scale750(5));
        make.width.height.mas_greaterThanOrEqualTo(10);
    }];
    /*
     * 订单数据展示区域
     */
    tableView = [[UITableView alloc] init];
    tableView.backgroundColor = S_COBackground;
    tableView.delegate = self;
    tableView.dataSource = self;
    //        [tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    //    tableView.separatorStyle = UITableViewCellEditingStyleNone;
    //        tableView.estimatedRowHeight = 60;
    tableView.separatorStyle = UITableViewCellEditingStyleNone;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.tableFooterView = [UIView new];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topView.mas_bottom).mas_offset(Scale750(30));
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(bottomView.mas_top).mas_offset(0);
    }];
}

#pragma mark - 选择Btn点击
- (void)chooseBtnClicked:(UIButton *)btn {
    if (btn.tag == 1000) {
        bottomImg.image = [UIImage imageNamed:@"ic_delivery_oneself"];
    }else{
        bottomImg.image = [UIImage imageNamed:@"ic_delivery_official"];
    }
}

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    if (indexPath.row == 0) {
        OrderTopCell *topCell = [tableView dequeueReusableCellWithIdentifier:topCellID];
        if (topCell == nil) {
            topCell = [[OrderTopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:topCellID];
            topCell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return topCell;
    }
    else if (indexPath.row == 5) {
        OrderPriceCell *priceCrll = [tableView dequeueReusableCellWithIdentifier:priceCellID];
        if (priceCrll == nil) {
            priceCrll = [[OrderPriceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:priceCellID];
            priceCrll.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return priceCrll;
    }
    else if (indexPath.row == 6) {
        OrderPromptCell *topCell = [tableView dequeueReusableCellWithIdentifier:proCellID];
        if (topCell == nil) {
            topCell = [[OrderPromptCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:proCellID];
            topCell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return topCell;
    }
    else{
        OrderInfoCell *topCell = [tableView dequeueReusableCellWithIdentifier:infoCellID];
        if (topCell == nil) {
            topCell = [[OrderInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:infoCellID];
            topCell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return topCell;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return Scale750(90);
    }
    else if (indexPath.row == 5) {
        return Scale750(90);
    }
    else if (indexPath.row == 6) {
        return Scale750(130);
    }
    else{
        return Scale750(210);
    }
    return Scale750(0);
}


@end
