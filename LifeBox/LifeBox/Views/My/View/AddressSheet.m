//
//  AddressSheet.m
//  LifeBox
//
//  Created by Lucky on 2019/9/19.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "AddressSheet.h"
#import "AddressChooseCell.h"


static NSString *cellID = @"AddressChooseCellID";

@implementation AddressSheet {
    ///省份btn
    UIButton *provinceBtn;
    ///市btn
    UIButton *cityBtn;
    ///区btn
    UIButton *areaBtn;
    ///下划线
    UIView *lineView;
    ///区域位置信息
    UITableView *tableView;
    ///分割线
    UIView *ividerLine;
    ///点击选项
    NSString *isChoose;
    ///省数组
    NSMutableArray *provinceList;
    ///市数组
    NSMutableArray *cityList;
    ///区数组
    NSMutableArray *areaList;
}

#pragma mark - 高度
- (NSInteger)viewHeight {
    return (Screen_height * 2)/3;
}

#pragma mark - 视图布局
- (void)makeSubview {
    /*
     * 顶部标题
     */
    UILabel *topLab = [[UILabel alloc] init];
    topLab.font = [UIFont systemFontOfSize:Scale750(36)];
    topLab.textColor = RGBColor(51, 51, 51);
    topLab.text = @"请选择";
    [self.bottomView addSubview:topLab];
    [topLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(30));
        make.centerX.mas_equalTo(self.bottomView);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 关闭Btn
     */
    UIButton *closeBtn = [[UIButton alloc] init];
    [closeBtn setBackgroundImage:[UIImage imageNamed:@"ic_address_close"] forState:UIControlStateNormal];
    [closeBtn setBackgroundImage:[UIImage imageNamed:@"ic_address_close"] forState:UIControlStateHighlighted];
    [closeBtn bk_addEventHandler:^(id sender) {
        [self dismissView];
    } forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(topLab);
        make.right.mas_equalTo(-Scale750(40));
        make.width.height.mas_equalTo(Scale750(40));
    }];
    /*
     * 省份Btn
     */
    provinceBtn = [[UIButton alloc] init];
    provinceBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    [provinceBtn setTitle:@"省份" forState:UIControlStateNormal];
    [provinceBtn setTitleColor:S_COGreenText forState:UIControlStateNormal];
    provinceBtn.tag = 100;
    [provinceBtn addTarget:self action:@selector(addressBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:provinceBtn];
    [provinceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topLab.mas_bottom).mas_offset(Scale750(30));
        make.left.mas_equalTo(Scale750(40));
        make.width.mas_greaterThanOrEqualTo(0);
        make.height.mas_equalTo(Scale750(60));
    }];
    /*
     * 市
     */
    cityBtn = [[UIButton alloc] init];
    cityBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    [cityBtn setTitle:@"城市" forState:UIControlStateNormal];
    [cityBtn setTitleColor:RGBColor(153, 153, 153) forState:UIControlStateNormal];
    cityBtn.tag = 101;
    [cityBtn addTarget:self action:@selector(addressBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:cityBtn];
    [cityBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(provinceBtn);
        make.left.mas_equalTo(provinceBtn.mas_right).mas_offset(Scale750(60));
        make.width.mas_greaterThanOrEqualTo(0);
        make.height.mas_equalTo(Scale750(60));
    }];
    /*
     * 区
     */
    areaBtn = [[UIButton alloc] init];
    areaBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    [areaBtn setTitle:@"区县" forState:UIControlStateNormal];
    [areaBtn setTitleColor:RGBColor(153, 153, 153) forState:UIControlStateNormal];
    areaBtn.tag = 102;
    [areaBtn addTarget:self action:@selector(addressBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:areaBtn];
    [areaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(provinceBtn);
        make.left.mas_equalTo(cityBtn.mas_right).mas_offset(Scale750(60));
        make.width.mas_greaterThanOrEqualTo(0);
        make.height.mas_equalTo(Scale750(60));
    }];
    /*
     * 分割线
     */
    ividerLine = [[UIView alloc] init];
    ividerLine.backgroundColor = COLOREE;
    [self.bottomView addSubview:ividerLine];
    [ividerLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(provinceBtn.mas_bottom).mas_offset(Scale750(10));
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    /*
     * 下划线
     */
    lineView = [[UIView alloc] init];
    lineView.backgroundColor = S_COGreenText;
    [self.bottomView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(ividerLine.mas_top).mas_offset(0);
        make.centerX.mas_equalTo(provinceBtn);
        make.width.mas_equalTo(Scale750(65));
        make.height.mas_equalTo(Scale750(5));
    }];
    /*
     * 数据展示
     */
    tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = S_COBackground;
    tableView.separatorStyle = UITableViewCellEditingStyleNone;
    // 删除单元格分隔线的一个小技巧
    tableView.tableFooterView = [UIView new];
    [self.bottomView addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ividerLine.mas_bottom).mas_offset(0);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(self.bottomView.mas_bottom).mas_offset(-20);
    }];
    /*
     * 请求数据
     */
    //处理默认数据
    isChoose = @"1";
    //发起请求
    NSDictionary *tempDic = [[NSDictionary alloc] initWithObjectsAndKeys:@"0", @"parentCode" , nil];
    [self getAddressHttpWith:tempDic];
}


#pragma mark - 地区Btn点击
- (void)addressBtnClicked:(UIButton *)btn {
    /*
     * 数据判断
     */
    NSDictionary *tempDic;
    if (btn.tag == 100) {
        isChoose = @"1";
        tempDic = [[NSDictionary alloc] initWithObjectsAndKeys:@"0", @"parentCode" , nil];
    }
    if (btn.tag == 101) {
        if (_provinceData.name.length == 0) {
            [self.bottomView ug_msg:@"请选择省信息"];
            return;
        }
        isChoose = @"2";
        tempDic = [[NSDictionary alloc] initWithObjectsAndKeys:_provinceData.areaCode, @"parentCode" , nil];
    }
    if (btn.tag == 102) {
        if (_cityData.name.length == 0) {
            [self.bottomView ug_msg:@"请选择市信息"];
            return;
        }
        isChoose = @"3";
        tempDic = [[NSDictionary alloc] initWithObjectsAndKeys:_cityData.areaCode, @"parentCode" , nil];
    }
    [self getAddressHttpWith:tempDic];
    /*
     * 取消原本选中颜色,设置选中的颜色
     */
    for (UIButton *myBtn in self.bottomView.subviews) {
        if ([myBtn isKindOfClass:[UIButton class]]) {
            [myBtn setTitleColor:RGBColor(153, 153, 153) forState:UIControlStateNormal];
        }
    }
    [btn setTitleColor:S_COGreenText forState:UIControlStateNormal];
    /*
     * 下划线移动
     */
    [lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(ividerLine.mas_top).mas_offset(0);
        make.centerX.mas_equalTo(btn);
        make.width.mas_equalTo(Scale750(65));
        make.height.mas_equalTo(Scale750(5));
    }];
}

#pragma mark - 接口请求
- (void)getAddressHttpWith:(NSDictionary *)dic {
    //避免数据重复请求
    if ([isChoose isEqualToString:@"1"]) {
        if (provinceList.count != 0) {
            [tableView reloadData];
            return;
        }
    }
    else if ([isChoose isEqualToString:@"2"]) {
        if (cityList.count != 0) {
            [tableView reloadData];
            return;
        }
    }else {
        if (areaList.count != 0) {
            [tableView reloadData];
            return;
        }
    }
    //开始请求
    [self ug_loading];
    [[[NetWorkRequest alloc] init] queryAddressInfoParams:dic endBlock:^(NSDictionary * _Nonnull result, NSError * _Nonnull error) {
        [self ug_hiddenLoading];
        if (error) {
            [self ug_msg:error.domain];
        }else{
            if ([self->isChoose isEqualToString:@"1"]) {
                self->provinceList = (NSMutableArray *)[NSMutableArray yy_modelArrayWithClass:[AreaData class] json:result];
                if (self.provinceData.name != 0) {
                    for (AreaData *data in self->provinceList) {
                        if ([data.name isEqualToString:self.provinceData.name]) {
                            data.isSelect = @"1";
                            self.provinceData.areaCode = data.areaCode;
                        }
                    }
                }
            }
            else if ([self->isChoose isEqualToString:@"2"]) {
                self->cityList = (NSMutableArray *)[NSMutableArray yy_modelArrayWithClass:[AreaData class] json:result];
                if (self.cityData.name != 0) {
                    for (AreaData *data in self->cityList) {
                        if ([data.name isEqualToString:self.cityData.name]) {
                            data.isSelect = @"1";
                            self.cityData.areaCode = data.areaCode;
                        }
                    }
                }
            }else{
                self->areaList = (NSMutableArray *)[NSMutableArray yy_modelArrayWithClass:[AreaData class] json:result];
                if (self.areaData.name != 0) {
                    for (AreaData *data in self->areaList) {
                        if ([data.name isEqualToString:self.areaData.name]) {
                            data.isSelect = @"1";
                            self.areaData.areaCode = data.areaCode;
                        }
                    }
                }
            }
            [self->tableView reloadData];
        }
    }];
}

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AddressChooseCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[AddressChooseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([isChoose isEqualToString:@"1"]) {
        [cell reloadCellUIWithData:[provinceList objectAtIndex:indexPath.row]];
    }
    else if ([isChoose isEqualToString:@"2"]) {
        [cell reloadCellUIWithData:[cityList objectAtIndex:indexPath.row]];
    }else{
        [cell reloadCellUIWithData:[areaList objectAtIndex:indexPath.row]];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([isChoose isEqualToString:@"1"]) {
        return provinceList.count;
    }
    else if ([isChoose isEqualToString:@"2"]) {
        return cityList.count;
    }else{
        return areaList.count;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return Scale750(70);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    /*
     * 数据重新绑定
     */
    if ([isChoose isEqualToString:@"1"]) {
        for (AreaData *tempData in provinceList) {
            tempData.isSelect = @"";
        }
        AreaData *pData = [provinceList objectAtIndex:indexPath.row];
        pData.isSelect = @"1";
        _provinceData.name = pData.name;
        _provinceData.areaCode = pData.areaCode;
        [cityList removeAllObjects];
        [areaList removeAllObjects];
    }
    else if ([isChoose isEqualToString:@"2"]) {
        for (AreaData *tempData in cityList) {
            tempData.isSelect = @"";
        }
        AreaData *cData = [cityList objectAtIndex:indexPath.row];
        cData.isSelect = @"1";
        _cityData.name = cData.name;
        _cityData.areaCode = cData.areaCode;
        [areaList removeAllObjects];
    }else{
        for (AreaData *tempData in areaList) {
            tempData.isSelect = @"";
        }
        AreaData *aData = [areaList objectAtIndex:indexPath.row];
        aData.isSelect = @"1";
        _areaData.name = aData.name;
        _areaData.areaCode = aData.areaCode;
        //数据选择完成回调地址编辑界面
        if ([_delegate respondsToSelector:@selector(selectProvince:city:area:)]) {
            [_delegate selectProvince:_provinceData.name city:_cityData.name area:_areaData.name];
        }
    }
    [tableView reloadData];
}


@end
