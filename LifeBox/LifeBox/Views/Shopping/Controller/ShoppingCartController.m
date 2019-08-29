//
//  ShoppingCartController.m
//  LifeBox
//
//  Created by Lucky on 2019/8/6.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "ShoppingCartController.h"
#import "ShoppingCarCell.h"

@interface ShoppingCartController ()<UITableViewDelegate, UITableViewDataSource, CellNumBtnDelegate> {
    ///数据展示
    UITableView *tableView;
}

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
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 底部功能View
     */
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(90));
    }];
    /*
     * 全选Btn
     */
    UIButton *allBtn = [[UIButton alloc] init];
    allBtn.layer.borderWidth = 1;
    allBtn.layer.borderColor = [RGBColor(189, 189, 189) CGColor];
    allBtn.layer.cornerRadius = Scale750(18);
    [bottomView addSubview:allBtn];
    [allBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(Scale750(30));
        make.centerY.mas_equalTo(bottomView);
        make.width.height.mas_equalTo(Scale750(36));
    }];
    /*
     * 全选文字
     */
    UILabel *allLab = [[UILabel alloc] init];
    allLab.font = [UIFont systemFontOfSize:Scale750(30)];
    allLab.text = @"全选";
    [bottomView addSubview:allLab];
    [allLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(allBtn.mas_right).mas_offset(Scale750(10));
        make.centerY.mas_equalTo(allBtn);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 结算Btn
     */
    UIButton *settlementBtn = [[UIButton alloc] init];
    settlementBtn.backgroundColor = S_COGreenBack;
    settlementBtn.layer.cornerRadius = Scale750(30);
    settlementBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    [settlementBtn setTitle:@"结算(0)" forState:UIControlStateNormal];
    [settlementBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bottomView addSubview:settlementBtn];
    [settlementBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-Scale750(30));
        make.centerY.mas_equalTo(bottomView);
        make.width.mas_equalTo(Scale750(170));
        make.height.mas_equalTo(Scale750(60));
    }];
    /*
     * 合计lab
     */
    UILabel *combinedLab = [[UILabel alloc] init];
    combinedLab.font = [UIFont systemFontOfSize:Scale750(30)];
    combinedLab.textAlignment = NSTextAlignmentRight;
    NSString *tempStr = @"合计: ¥0";
    combinedLab.attributedText = [tempStr strChangFlagWithStr:@"¥0" Color:S_CORedText Font:Scale750(30)];
    [bottomView addSubview:combinedLab];
    [combinedLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(settlementBtn.mas_left).mas_offset(-Scale750(15));
        make.centerY.mas_equalTo(bottomView);
        make.width.height.mas_greaterThanOrEqualTo(0);
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
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(bottomView.mas_top);
    }];
}

#pragma mark - 编辑按钮点击
- (void)editBtnClicked {
    
}

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShoppingCarCell *goodsCell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (goodsCell == nil) {
        goodsCell = [[ShoppingCarCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    goodsCell.selectionStyle = UITableViewCellSelectionStyleNone;
    goodsCell.addBtn.tag = indexPath.row;
    goodsCell.reduceBtn.tag = indexPath.row;
    goodsCell.delegate = self;
    return goodsCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return Scale750(270);
}

#pragma mark - 数量选择代理
- (void)addBtnClicked:(UIButton *)btn {
    DDLogVerbose(@"第%ld行Cell上，添加Btn被点击", (long)btn.tag);
}

- (void)reduceBtnClicked:(UIButton *)btn {
    DDLogVerbose(@"第%ld行Cell上，减少Btn被点击", (long)btn.tag);
}

@end