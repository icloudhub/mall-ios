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
}

#pragma mark - 地区Btn点击
- (void)addressBtnClicked:(UIButton *)btn {
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

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AddressChooseCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[AddressChooseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
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
    return Scale750(70);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
