//
//  AddressEditController.m
//  LifeBox
//
//  Created by Lucky on 2019/9/9.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "AddressEditController.h"
#import "AddressSheet.h"

@interface AddressEditController ()<UITextFieldDelegate, UITextViewDelegate, ChooseAddressDelegate> {
    ///地址View
    UIView *addressView;
    ///设置View
    UIView *setView;
    ///删除Btn
    UIButton *deleteBtn;
    ///收货人
    UITextField *consigneeTF;
    ///手机号码
    UITextField *phoneTF;
    ///所在地区
    UILabel *regionLab;
    ///选择Btn
    UIButton *chooseBtn;
    ///详细地址
    UITextView *detailedTV;
    ///默认Btn
    UIButton *defaultBtn;
    ///分割线1
    UIView *lineView1;
    ///分割线2
    UIView *lineView2;
    ///分割线3
    UIView *lineView3;
    ///提示Lab
    UILabel *placeLab;
    ///选择区域
    AddressSheet *chooseArea;
    ///默认地址数据
    NSString *defaultStr;
    ///选择后地址信息数据
    AddressData *selectData;
}

@end

@implementation AddressEditController

#pragma mark - 视图层
- (void)viewDidLoad {
    [super viewDidLoad];
    if (_passData == nil) {
        [self setWhiteNaviWithTitle:@"新增收货地址"];
    }else{
        [self setWhiteNaviWithTitle:@"编辑收货地址"];
    }
    self.view.backgroundColor = S_COBackground;
    [self createUI];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.view endEditing:YES];
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 导航栏右边按钮
     */
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn setTitleColor:S_COGreenText forState:UIControlStateNormal];
    [saveBtn setTitleColor:S_COGreenText forState:UIControlStateHighlighted];
    [saveBtn addTarget:self action:@selector(saveBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:saveBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    /*
     * 地址信息View
     */
    addressView = [[UIView alloc] init];
    addressView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:addressView];
    /*
     * 分割线1
     */
    lineView1 = [[UIView alloc] init];
    lineView1.backgroundColor = COLOREE;
    [addressView addSubview:lineView1];
    /*
     * 分割线2
     */
    lineView2 = [[UIView alloc] init];
    lineView2.backgroundColor = COLOREE;
    [addressView addSubview:lineView2];
    /*
     * 分割线3
     */
    lineView3 = [[UIView alloc] init];
    lineView3.backgroundColor = COLOREE;
    [addressView addSubview:lineView3];
    /*
     * 收货人
     */
    consigneeTF = [[UITextField alloc] init];
    consigneeTF.borderStyle = UITextBorderStyleNone;
    consigneeTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    consigneeTF.textColor = RGBColor(51, 51, 51);
    NSString *nameHolder = @"收货人";
    NSMutableAttributedString *placeName = [[NSMutableAttributedString alloc] initWithString:nameHolder];
    [placeName addAttribute:NSForegroundColorAttributeName
                        value:RGBColor(189, 189, 189)
                        range:NSMakeRange(0, nameHolder.length)];
    [placeName addAttribute:NSFontAttributeName
                        value:[UIFont boldSystemFontOfSize:Scale750(30)]
                        range:NSMakeRange(0, nameHolder.length)];
    consigneeTF.attributedPlaceholder = placeName;
    consigneeTF.font = [UIFont systemFontOfSize:Scale750(30)];
    consigneeTF.delegate = self;
    [addressView addSubview:consigneeTF];
    /*
     * 手机号码
     */
    phoneTF = [[UITextField alloc] init];
    phoneTF.borderStyle = UITextBorderStyleNone;
    phoneTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    phoneTF.textColor = RGBColor(51, 51, 51);
    NSString *phoneHolder = @"手机号码";
    NSMutableAttributedString *placePhone = [[NSMutableAttributedString alloc] initWithString:phoneHolder];
    [placePhone addAttribute:NSForegroundColorAttributeName
                      value:RGBColor(189, 189, 189)
                      range:NSMakeRange(0, phoneHolder.length)];
    [placePhone addAttribute:NSFontAttributeName
                      value:[UIFont boldSystemFontOfSize:Scale750(30)]
                      range:NSMakeRange(0, phoneHolder.length)];
    phoneTF.attributedPlaceholder = placePhone;
    phoneTF.font = [UIFont systemFontOfSize:Scale750(30)];
    phoneTF.delegate = self;
    [addressView addSubview:phoneTF];
    /*
     * 所在地区
     */
    regionLab = [[UILabel alloc] init];
    regionLab.textColor = RGBColor(189, 189, 189);
    regionLab.font = [UIFont systemFontOfSize:Scale750(30)];
    regionLab.text = @"所在地区";
    [addressView addSubview:regionLab];
    /*
     * 选择区域Btn
     */
    chooseBtn = [[UIButton alloc] init];
    [chooseBtn addTarget:self action:@selector(chooseBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [addressView addSubview:chooseBtn];
    /*
     * 详细地址
     */
    detailedTV = [[UITextView alloc] init];
    detailedTV.font = [UIFont systemFontOfSize:Scale750(30)];
    detailedTV.backgroundColor = [UIColor whiteColor];
    detailedTV.delegate = self;
    [addressView addSubview:detailedTV];
    /*
     * 占位符
     */
    placeLab = [[UILabel alloc] init];
    placeLab.font = [UIFont systemFontOfSize:Scale750(30)];
    placeLab.textColor = RGBColor(189, 189, 189);
    placeLab.numberOfLines = 0;
    placeLab.text = @"详细地址: 如道路、门牌号、小区、楼栋号、单元等";
    [detailedTV addSubview:placeLab];
    /*
     * 设置View
     */
    setView = [[UIView alloc] init];
    setView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:setView];
    /*
     * 设为默认按钮
     */
    defaultBtn = [[UIButton alloc] init];
    [defaultBtn setBackgroundImage:[UIImage imageNamed:@"ic_shut_down"] forState:UIControlStateNormal];
    [defaultBtn setBackgroundImage:[UIImage imageNamed:@"ic_shut_down"] forState:UIControlStateHighlighted];
    [defaultBtn addTarget:self action:@selector(defaultBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [setView addSubview:defaultBtn];
    /*
     * 删除View
     */
    deleteBtn = [[UIButton alloc] init];
    deleteBtn.backgroundColor = [UIColor whiteColor];
    [deleteBtn addTarget:self action:@selector(deleteBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:deleteBtn];
    [self reloadUIWithAddreddData];
}

#pragma mark - 适配
- (void)viewLayoutMarginsDidChange {
    [super viewLayoutMarginsDidChange];
    [addressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(420));
    }];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(90));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->lineView1.mas_bottom).mas_offset(Scale750(90));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    [lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->lineView2.mas_bottom).mas_offset(Scale750(90));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    [consigneeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(Scale750(40));
        make.right.mas_equalTo(-Scale750(40));
        make.height.mas_equalTo(Scale750(90));
    }];
    [phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->consigneeTF.mas_bottom);
        make.left.mas_equalTo(Scale750(40));
        make.right.mas_equalTo(-Scale750(40));
        make.height.mas_equalTo(Scale750(90));
    }];
    [regionLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->phoneTF.mas_bottom);
        make.left.mas_equalTo(Scale750(40));
        make.width.mas_greaterThanOrEqualTo(0);
        make.height.mas_equalTo(Scale750(90));
    }];
    /*
     * 进入Btn
     */
    UIImageView *arrowImg = [[UIImageView alloc] init];
    arrowImg.image = [UIImage imageNamed:@"ic_enter"];
    [addressView addSubview:arrowImg];
    [arrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->regionLab);
        make.right.mas_equalTo(-Scale750(40));
        make.width.mas_equalTo(Scale750(32));
        make.height.mas_equalTo(Scale750(30));
    }];
    [chooseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->regionLab);
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(Scale750(280));
        make.height.mas_equalTo(Scale750(90));
    }];
    [detailedTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->lineView3.mas_bottom).mas_offset(Scale750(30));
        make.left.mas_equalTo(Scale750(40));
        make.right.mas_equalTo(-Scale750(40));
        make.bottom.mas_equalTo(-Scale750(30));
    }];
    [placeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(10));
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(self->detailedTV);
        make.height.mas_greaterThanOrEqualTo(0);
    }];
    [setView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->addressView.mas_bottom).mas_offset(Scale750(30));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(90));
    }];
    /*
     * 设为默认
     */
    UILabel *defaultLab = [[UILabel alloc] init];
    defaultLab.font = [UIFont systemFontOfSize:Scale750(30)];
    defaultLab.textColor = RGBColor(51, 51, 51);
    defaultLab.text = @"设为默认地址";
    [setView addSubview:defaultLab];
    [defaultLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->setView.mas_centerY);
        make.left.mas_equalTo(Scale750(40));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    [defaultBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->setView.mas_centerY);
        make.right.mas_equalTo(-Scale750(40));
        make.width.height.mas_equalTo(Scale750(60));
    }];
    [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->setView.mas_bottom).mas_offset(Scale750(30));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(90));
    }];
    /*
     * 删除Lab
     */
    UILabel *deleteLab = [[UILabel alloc] init];
    deleteLab.font = [UIFont systemFontOfSize:Scale750(30)];
    deleteLab.textColor = RGBColor(235, 62, 49);
    deleteLab.text = @"删除地址";
    [deleteBtn addSubview:deleteLab];
    [deleteLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->deleteBtn.mas_centerY);
        make.left.mas_equalTo(Scale750(40));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
}

#pragma mark - 刷新数据
- (void)reloadUIWithAddreddData {
    if (_passData != nil) {
        //姓名
        consigneeTF.text = _passData.name;
        //电话
        phoneTF.text = _passData.phoneNumber;
        //省市区
        regionLab.textColor = RGBColor(51, 51, 51);
        NSString *tempStr = [NSString stringWithFormat:@"%@ %@ %@", _passData.province, _passData.city, _passData.region];
        regionLab.text = tempStr;
        //详细地址
        placeLab.hidden = YES;
        detailedTV.text = _passData.detailAddress;
        defaultStr = _passData.defaultStatus;
        //默认地址
        if ([defaultStr intValue] == 1) {
            [defaultBtn setBackgroundImage:[UIImage imageNamed:@"ic_turn_on"] forState:UIControlStateNormal];
            [defaultBtn setBackgroundImage:[UIImage imageNamed:@"ic_turn_on"] forState:UIControlStateHighlighted];
            defaultBtn.selected = YES;
        }else{
            [defaultBtn setBackgroundImage:[UIImage imageNamed:@"ic_shut_down"] forState:UIControlStateNormal];
            [defaultBtn setBackgroundImage:[UIImage imageNamed:@"ic_shut_down"] forState:UIControlStateHighlighted];
            defaultBtn.selected = NO;
        }
        selectData = _passData;
    }else{
        deleteBtn.hidden = YES;
    }
}

#pragma mark - 保存按钮点击
- (void)saveBtnClicked {
    [self.view endEditing:YES];
    /*
     * 输入内容判断
     */
    if (consigneeTF.text.length == 0) {
        [self.view ug_msg:@"请输入姓名"];
        return;
    }
    if (phoneTF.text.length == 0) {
        [self.view ug_msg:@"请输入手机号"];
        return;
    }else{
        if (phoneTF.text.length < 11) {
            [self.view ug_msg:@"手机号码位数错误"];
            return;
        }
    }
    if ([regionLab.text isEqualToString:@"所在地区"]) {
        [self.view ug_msg:@"请选择位置信息"];
        return;
    }
    if (detailedTV.text.length == 0) {
        [self.view ug_msg:@"输入详细地址以便精准配送哦"];
        return;
    }
    /*
     * 请求数据处理
     */
    NSDictionary *tempDic;
    if (_passData == nil) {
        tempDic = [[NSDictionary alloc] initWithObjectsAndKeys:consigneeTF.text, @"name", phoneTF.text, @"phoneNumber", selectData.province, @"province", selectData.city, @"city", selectData.region, @"region", detailedTV.text, @"detailAddress", defaultStr, @"defaultStatus", nil];
        [self addNewHttpData:tempDic];
    }else{
        tempDic = [[NSDictionary alloc] initWithObjectsAndKeys:consigneeTF.text, @"name", phoneTF.text, @"phoneNumber", selectData.province, @"province", selectData.city, @"city", selectData.region, @"region", detailedTV.text, @"detailAddress", defaultStr, @"defaultStatus", nil];
        [self updateHttpData:tempDic];
    }
}

#pragma mark - 选择地区按钮点击
- (void)chooseBtnClicked {
    [self.view endEditing:YES];
    chooseArea = [[AddressSheet alloc] init];
    AreaData *pData = [[AreaData alloc] init];
    pData.name = _passData.province;
    chooseArea.provinceData = pData;
    AreaData *cData = [[AreaData alloc] init];
    cData.name = _passData.city;
    chooseArea.cityData = cData;
    AreaData *aData = [[AreaData alloc] init];
    aData.name = _passData.region;
    chooseArea.areaData = aData;
    chooseArea.delegate = self;
    [chooseArea showView];
}

#pragma mark - 默认按钮点击
- (void)defaultBtnClicked:(UIButton *)btn {
    if (btn.isSelected == YES) {
        [defaultBtn setBackgroundImage:[UIImage imageNamed:@"ic_shut_down"] forState:UIControlStateNormal];
        [defaultBtn setBackgroundImage:[UIImage imageNamed:@"ic_shut_down"] forState:UIControlStateHighlighted];
        defaultStr = @"0";
    }else{
        [defaultBtn setBackgroundImage:[UIImage imageNamed:@"ic_turn_on"] forState:UIControlStateNormal];
        [defaultBtn setBackgroundImage:[UIImage imageNamed:@"ic_turn_on"] forState:UIControlStateHighlighted];
        defaultStr = @"1";
    }
    btn.selected = !btn.selected;
}

#pragma mark - 删除按钮点击
- (void)deleteBtnClicked {
    [self.view endEditing:YES];
    [self.view ug_starloading];
    [[[NetWorkRequest alloc] init] deleteAddressWithID:[_passData.addressId integerValue] endBlock:^(NSDictionary * _Nonnull result, NSError * _Nonnull error) {
        [self.view ug_stoploading];
        if (error) {
            [self.view ug_msg:error.domain];
        }else{
            [self.view ug_msg:@"删除成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
}

#pragma mark - 新增地址接口
- (void)addNewHttpData:(NSDictionary *)dic {
    [self.view ug_starloading];
    [[[NetWorkRequest alloc] init] addAddressParams:dic endBlock:^(NSDictionary * _Nonnull result, NSError * _Nonnull error) {
        [self.view ug_stoploading];
        if (error) {
            [self.view ug_msg:error.domain];
        }else{
            [self.view ug_msg:@"添加成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
}

#pragma mark - 更新地址接口
- (void)updateHttpData:(NSDictionary *)dic {
    [self.view ug_starloading];
    [[[NetWorkRequest alloc] init] updateAddressWithID:[_passData.addressId integerValue] Params:dic endBlock:^(NSDictionary * _Nonnull result, NSError * _Nonnull error) {
        [self.view ug_stoploading];
        if (error) {
            [self.view ug_msg:error.domain];
        }else{
            [self.view ug_msg:@"修改成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
}

#pragma mark - 选择省市区代理
- (void)selectProvince:(NSString *)province city:(NSString *)city area:(NSString *)area {
    [chooseArea dismissView];
    selectData = [[AddressData alloc] init];
    selectData.province = province;
    selectData.city = city;
    selectData.region = area;
    //省市区
    regionLab.textColor = RGBColor(51, 51, 51);
    NSString *tempStr = [NSString stringWithFormat:@"%@ %@ %@", selectData.province, selectData.city, selectData.region];
    regionLab.text = tempStr;
}

#pragma mark - UITextField代理
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    //得到输入框的内容
    NSString *toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    //怕输入是否有空格
    if ([toBeString spaceJudgment]) {
        [addressView ug_msg:@"不能输入空格"];
        return NO;
    }
    if (![string isEqualToString:@""]) {
        if ([string isEqualToString:@"\n"]) {
            return NO;
        }
        if (textField == phoneTF) {
            if (![toBeString isPureInt]) {
                [addressView ug_msg:@"手机号码格式有误"];
                return NO;
            }
            if (toBeString.length > 11) {
                return NO;
            }
        }
        if (textField == consigneeTF) {
            if (![toBeString inputToCompletejudgePureChinese]) {
                [addressView ug_msg:@"姓名只能是中文"];
                return NO;
            }
            if (toBeString.length > 10) {
                return NO;
            }
        }
    }
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSString *toBeString = [textView.text stringByReplacingCharactersInRange:range withString:text];
    //得到输入框的内容
    if (![text isEqualToString:@""]) {
        if (toBeString.length > 0) {
            placeLab.hidden = YES;
        }
    }
    if (toBeString.length <= 0) {
        placeLab.hidden = NO;
    }
    return YES;
}

@end
