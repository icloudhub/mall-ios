//
//  OrderDetailsController.m
//  LifeBox
//
//  Created by Lucky on 2019/9/7.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "OrderDetailsController.h"
#import "DetailsGoodsCell.h"
#import "DetailsPriceCell.h"
#import "DetailsInfoCell.h"
#import "ConfirmOrderData.h"

@interface OrderDetailsController ()<UITableViewDelegate, UITableViewDataSource> {
    ///顶部View
    UIView *topView;
    ///底部View
    UIView *bottomView;
    ///数据展示
    UITableView *tableView;
}

#pragma mark - 属性
///状态图片
@property (strong, nonatomic) UIImageView *stateImg;

///状态文字
@property (strong, nonatomic) UILabel *stateLab;

///剩余时间
@property (strong, nonatomic) UILabel *remainingLab;

///需要支付的金额
@property (strong, nonatomic) UILabel *needPayLab;

///姓名
@property (strong, nonatomic) UILabel *nameLab;

///电话
@property (strong, nonatomic) UILabel *phoneLab;

///地址
@property (strong, nonatomic) UILabel *addressLab;

///左边Btn
@property (strong, nonatomic) UIButton *leftBtn;

///右边Btn
@property (strong, nonatomic) UIButton *rightBtn;

///右边Btn
@property (strong, nonatomic) ConfirmOrderData *confirmOrderData;

@end

static NSString *detailsCellID = @"DetailsGoodsCellID";
static NSString *infoCellID = @"DetailsInfoCellID";
static NSString *priceCellID = @"DetailsPriceCellID";

@implementation OrderDetailsController

#pragma mark - 视图层
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setWhiteNaviWithTitle:@"订单详情"];
    self.view.backgroundColor = S_COBackground;
    [self createUI];
    [self getConfirmOrderInfo];
}

#pragma mark - 创建UI
- (void)createUI {
    [self creatTopView];
    [self creatBottomView];
    /*
     * 数据展示
     */
    tableView = [[UITableView alloc] init];
    tableView.backgroundColor = S_COBackground;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.bounces = NO;
    tableView.separatorStyle = UITableViewCellEditingStyleNone;
    tableView.estimatedRowHeight = 60;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.tableFooterView = [UIView new];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->topView.mas_bottom);
        make.right.left.mas_equalTo(0);
        make.bottom.mas_equalTo(self->bottomView.mas_top);
    }];
}
-(void)reloadUI{
    _needPayLab.text = [NSString stringWithFormat:@"需付款: ¥%.2f",_confirmOrderData.calcAmountData.totalAmount];
    AddressData *addressData = _confirmOrderData.defualaddress;
    
    _addressLab.text = [NSString stringWithFormat:@"地址: %@ %@ %@ %@",addressData.province,addressData.city,addressData.region,addressData.detailAddress];
    _nameLab.text = addressData.name;
    _phoneLab.text = addressData.phoneNumber;
    [tableView reloadData];
  
}

#pragma mark - 创建顶部View
- (void)creatTopView {
    /*
     * 创建顶部View
     */
    topView = [[UIView alloc] init];
    topView.backgroundColor = S_COBackground;
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_greaterThanOrEqualTo(Scale750(50));
    }];
    /*
     * 顶部绿色View
     */
    UIImageView *greenView = [[UIImageView alloc] init];
    greenView.image = [UIImage imageNamed:@"bg_topground"];
    [topView addSubview:greenView];
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(190));
    }];
    /*
     * 状态图片
     */
    _stateImg = [[UIImageView alloc] init];
    _stateImg.image = [UIImage imageNamed:@"ic_go_to_pay"];
    [greenView addSubview:_stateImg];
    [_stateImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(54));
        make.left.mas_equalTo(Scale750(20));
        make.width.height.mas_equalTo(Scale750(36));
    }];
    /*
     * 状态文字
     */
    _stateLab = [[UILabel alloc] init];
    _stateLab.font = [UIFont systemFontOfSize:Scale750(30)];
    _stateLab.textColor = [UIColor whiteColor];
    _stateLab.text = @"等待付款";
    [greenView addSubview:_stateLab];
    [_stateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->_stateImg.mas_right).mas_offset(Scale750(20));
        make.centerY.mas_equalTo(self->_stateImg.mas_centerY);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 剩余时间
     */
    _remainingLab = [[UILabel alloc] init];
    _remainingLab.font = [UIFont systemFontOfSize:Scale750(26)];
    _remainingLab.textColor = [UIColor whiteColor];
    _remainingLab.text = @"剩余: 23小时59分钟";
    [greenView addSubview:_remainingLab];
    [_remainingLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(40));
        make.right.mas_equalTo(-Scale750(20));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 需要付款金额
     */
    _needPayLab = [[UILabel alloc] init];
    _needPayLab.font = [UIFont systemFontOfSize:Scale750(24)];
    _needPayLab.textColor = [UIColor whiteColor];
    _needPayLab.text = @"需付款: ¥333.99";
    [greenView addSubview:_needPayLab];
    [_needPayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self->_remainingLab.mas_right);
        make.top.mas_equalTo(self->_remainingLab.mas_bottom).mas_offset(Scale750(20));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 地址view
     */
    UIView *addressView = [[UIView alloc] init];
    addressView.layer.cornerRadius = Scale750(24);
    addressView.backgroundColor = [UIColor whiteColor];
    [topView addSubview:addressView];
    [addressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(greenView.mas_bottom).mas_offset(-Scale750(50));
        make.left.mas_equalTo(Scale750(20));
        make.right.mas_equalTo(-Scale750(20));
        make.height.mas_greaterThanOrEqualTo(Scale750(130));
    }];
    /*
     * 地址图标
     */
    UIImageView *addressImg = [[UIImageView alloc] init];
    addressImg.image = [UIImage imageNamed:@"ic_address_1"];
    [addressView addSubview:addressImg];
    [addressImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(30));
        make.left.mas_equalTo(Scale750(20));
        make.width.height.mas_equalTo(Scale750(36));
    }];
    /*
     * 姓名
     */
    _nameLab = [[UILabel alloc] init];
    _nameLab.textColor = RGBColor(51, 51, 51);
    _nameLab.font = [UIFont systemFontOfSize:Scale750(30)];
    _nameLab.text = @"某某某";
    [addressView addSubview:_nameLab];
    [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(addressImg.mas_centerY);
        make.left.mas_equalTo(addressImg.mas_right).mas_offset(Scale750(20));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 电话号码
     */
    _phoneLab = [[UILabel alloc] init];
    _phoneLab.textColor = RGBColor(189, 189, 189);
    _phoneLab.font = [UIFont systemFontOfSize:Scale750(30)];
    _phoneLab.text = @"13823582442";
    [addressView addSubview:_phoneLab];
    [_phoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->_nameLab.mas_centerY);
        make.left.mas_equalTo(self->_nameLab.mas_right).mas_offset(Scale750(30));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 地址
     */
    _addressLab = [[UILabel alloc] init];
    _addressLab.textColor = RGBColor(51, 51, 51);
    _addressLab.font = [UIFont systemFontOfSize:Scale750(25)];
    _addressLab.numberOfLines = 0;
    _addressLab.text = @"地址: 广东省深圳市宝安区西乡大道大益广场宝莲新村11巷11号";
    [addressView addSubview:_addressLab];
    [_addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_nameLab.mas_bottom).mas_offset(Scale750(20));
        make.left.mas_equalTo(self->_nameLab.mas_left);
        make.right.mas_equalTo(-Scale750(40));
        make.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 动态适配
     */
    [addressView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self->_addressLab.mas_bottom).mas_offset(Scale750(20));
    }];
    [topView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(addressView.mas_bottom).mas_offset(Scale750(20));
    }];
}

#pragma mark - 创建底部View
- (void)creatBottomView {
    /*
     * 创建底部View
     */
    bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    [bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(98) + SAFE_Bottom);
    }];
    /*
     * 右边Btn
     */
    _rightBtn = [[UIButton alloc] init];
    _rightBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    _rightBtn.layer.cornerRadius = Scale750(30);
    [_rightBtn setBackgroundColor:S_COGreenBack];
    [_rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_rightBtn setTitle:@"去支付" forState:UIControlStateNormal];
    [bottomView addSubview:_rightBtn];
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(20));
        make.right.mas_equalTo(-Scale750(20));
        make.width.mas_equalTo(Scale750(170));
        make.height.mas_equalTo(Scale750(60));
    }];
    /*
     * 左边Btn
     */
    _leftBtn = [[UIButton alloc] init];
    _leftBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    _leftBtn.layer.cornerRadius = Scale750(30);
    _leftBtn.layer.borderWidth = 1;
    _leftBtn.layer.borderColor = [RGBColor(102, 102, 102) CGColor];
    [_leftBtn setBackgroundColor:[UIColor whiteColor]];
    [_leftBtn setTitleColor:RGBColor(102, 102, 102) forState:UIControlStateNormal];
    [_leftBtn setTitle:@"取消订单" forState:UIControlStateNormal];
    [bottomView addSubview:_leftBtn];
    [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(20));
        make.right.mas_equalTo(self->_rightBtn.mas_left).mas_offset(-Scale750(20));
        make.width.mas_equalTo(Scale750(170));
        make.height.mas_equalTo(Scale750(60));
    }];
}

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        DetailsGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:detailsCellID];
        if (cell == nil) {
            cell = [[DetailsGoodsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detailsCellID];
            cell.backgroundColor = S_COBackground;
                 cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        ProductItemlist *product = [_confirmOrderData.productItemlist objectAtIndex:indexPath.row];
        HomeProductdata *data = product.product;
        [cell.goodsImg sd_setImageWithURL:UG_URL(data.pic)];
     
        return cell;
    }
    else if (indexPath.section == 1) {
        DetailsInfoCell *infoCell = [tableView dequeueReusableCellWithIdentifier:infoCellID];
        if (infoCell == nil) {
            infoCell = [[DetailsInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:infoCellID];
        }
        infoCell.backgroundColor = S_COBackground;
        infoCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return infoCell;
    }else {
        DetailsPriceCell *priceCell = [tableView dequeueReusableCellWithIdentifier:priceCellID];
        if (priceCell == nil) {
            priceCell = [[DetailsPriceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:priceCellID];
        }
        priceCell.backgroundColor = S_COBackground;
        priceCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return priceCell;
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return _confirmOrderData.productItemlist.count;
    }else{
        return 1;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

#pragma mark http
-(void)getConfirmOrderInfo{
    [[NetWorkRequest new] getConfirmOrderInfo:_orderid endBlock:^(NSDictionary * _Nonnull result, NSError * _Nonnull error) {
        if (error) {
            [self.view ug_msg:error.domain];
        }else{
            self.confirmOrderData = [ConfirmOrderData yy_modelWithJSON:result];
            [self reloadUI];
        }
    }];
}
@end
