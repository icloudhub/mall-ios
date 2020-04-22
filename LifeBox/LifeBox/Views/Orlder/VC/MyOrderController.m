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
#import "OrderListData.h"
#import "MJRefresh.h"
@interface MyOrderController ()<UITableViewDelegate, UITableViewDataSource, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate> {

    ///选择View
    UIView *chooseView;
    ///指示线
    UIView *lineView;
    ///数据数组
    
}
///数据展示tableView
@property(strong, nonatomic) UITableView *tableView;
@property(strong, nonatomic) UIButton *selectbtn;//背选中的btn
@property(strong, nonatomic) NSMutableArray *dataArr;
@property(assign, nonatomic) NSInteger pageNum;
@end

static NSString *cellID = @"OrderViewCellID";

@implementation MyOrderController

#pragma mark - 视图层
- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageNum = 1;
    self.dataArr = [NSMutableArray new];
    [self setWhiteNaviWithTitle:@"我的订单"];
    self.view.backgroundColor = S_COBackground;
    [self createUI];
    /*
     * 接口请求
     */
    [self getOrderListWithState];
}

#pragma mark - 创建UI
- (void)createUI {
    
     [self.view addSubview:self.tableView];
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

    switch (_selectIndex) {
        case 1:{
            //待付款
            self.selectbtn = paymentBtn;
        }
            break;
        case 2:{
            //待自提
             self.selectbtn = sendBtn;
        }
            break;
        case 3:{
            //待配送
             self.selectbtn = receivedBtn;
  
        }
            break;
        case 4:{
            //已完成
             self.selectbtn = finishBtn;
        }
            break;
        case 5:{
            //待评价
             self.selectbtn = evaluateBtn;
        }
            break;
        default:{
            //全选
             self.selectbtn = allBtn;
        }
            break;
    }

    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(self.selectbtn.mas_centerX);
        make.width.mas_equalTo(Scale750(80));
        make.height.mas_equalTo(2);
    }];
  
 
  
  
}
#pragma mark - 选择set点击
-(void)setSelectbtn:(UIButton *)selectbtn{
    
  
    [_selectbtn setTitleColor:RGBColor(51, 51, 51) forState:UIControlStateNormal];
    _selectbtn = selectbtn;
    [_selectbtn setTitleColor:S_COGreenText forState:UIControlStateNormal];
    /*
     * 改变划线位置
     */
    [lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(_selectbtn.mas_centerX);
        make.width.mas_equalTo(Scale750(80));
        make.height.mas_equalTo(2);
    }];
}

#pragma mark - 选择set点击
-(UITableView *)tableView{
    UG_WEAKSELF
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.emptyDataSetSource = self;
        _tableView.emptyDataSetDelegate = self;
        _tableView.backgroundColor = S_COBackground;
        _tableView.separatorStyle = UITableViewCellEditingStyleNone;
        _tableView.tableFooterView = [UIView new];
        // 上拉刷新
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            weakSelf.pageNum++;
            [weakSelf getOrderListWithState];
        }];
    }
    return _tableView;
}
#pragma mark - 选择Btn点击
- (void)chooseBtnClicked:(UIButton *)btn {
    self.selectbtn = btn;
    self.pageNum = 1;
    [self.dataArr removeAllObjects];
    /*
     * 接口请求
     */
    [self getOrderListWithState];
}

#pragma mark - 订单状态接口请求
- (void)getOrderListWithState{
    
    UG_WEAKSELF
    [self.view ug_starloading];
    NSString *state = [NSString stringWithFormat:@"%zd",(self.selectbtn.tag-11)];
    [[NetWorkRequest new] getOrderStateListWithState:state pageSize:@"10" pageNum:[NSString stringWithFormat:@"%zd",_pageNum] endBlock:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
        [self.view ug_stoploading];
        if (error) {
            [self.view ug_msg:error.domain];
        }else{
            [weakSelf.dataArr addObjectsFromArray:[NSArray modelArrayWithClass:[OrderListData class] json:dataDict]];
            [weakSelf.tableView reloadData];
            if (dataDict.count==0) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }else{
               [self.tableView.mj_footer endRefreshing];
            }
            
        }
    }];
}


#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    OrderViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[OrderViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.backgroundColor = S_COBackground;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    OrderListData *celldata = [_dataArr objectAtIndex:indexPath.row];
    [cell reloadUI:celldata];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 158;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderListData *celldata = [_dataArr objectAtIndex:indexPath.row];
    OrderDetailsController *detailsCtl = [[OrderDetailsController alloc] init];
    detailsCtl.orderid = [NSString stringWithFormat:@"%@",celldata.id];
    [self.navigationController pushViewController:detailsCtl animated:YES];
}

#pragma mark - 空数据代理
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"ic_gouwuchekong"];
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *title = @"暂无该状态订单哦～";
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont boldSystemFontOfSize:Scale750(28)],
                                 NSForegroundColorAttributeName:[UIColor grayColor]
                                 };
    return [[NSAttributedString alloc] initWithString:title attributes:attributes];
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->chooseView.mas_bottom);
        make.left.right.bottom.mas_equalTo(0);
    }];
}
@end
