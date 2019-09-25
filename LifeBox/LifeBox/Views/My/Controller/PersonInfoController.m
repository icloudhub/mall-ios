//
//  PersonInfoController.m
//  LifeBox
//
//  Created by Lucky on 2019/9/23.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "PersonInfoController.h"
#import "SetPersonInfoCell.h"
#import "ChangeNickNameController.h"
#import "ChangePhoneController.h"
#import "ChangeWeChatController.h"
#import "ChangeNameController.h"
#import "GenderSheet.h"
#import "BirthdaySheet.h"

@interface PersonInfoController ()<UITableViewDelegate, UITableViewDataSource> {
    ///数据展示
    UITableView *tableView;
}

@end

static NSString *oneCellID = @"SetPersonInfoCellID";

@implementation PersonInfoController

#pragma mark - 视图层
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setWhiteNaviWithTitle:@"个人资料"];
    self.view.backgroundColor = S_COBackground;
    [self createUI];
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 数据展示
     */
    tableView = [[UITableView alloc] init];
    tableView.backgroundColor = S_COBackground;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.bounces = NO;
    tableView.separatorStyle = UITableViewCellEditingStyleNone;
    tableView.tableFooterView = [UIView new];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.bottom.mas_equalTo(0);
    }];
}

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SetPersonInfoCell *infoCell = [tableView dequeueReusableCellWithIdentifier:oneCellID];
    if (infoCell == nil) {
        infoCell = [[SetPersonInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:oneCellID];
    }
    infoCell.selectionStyle = UITableViewCellSelectionStyleNone;
    [infoCell reloadCellUIWith:indexPath];
    return infoCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }
    else if (section == 1) {
        return 3;
    }else{
        return 2;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    return Scale750(20);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headSection = [[UIView alloc] init];
    headSection.backgroundColor = S_COBackground;
    return headSection;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        return Scale750(120);
    }
    return Scale750(90);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            //昵称
            ChangeNickNameController *nickCtl = [[ChangeNickNameController alloc] init];
            [self.navigationController pushViewController:nickCtl animated:YES];
        }
    }
    else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            //姓名
            ChangeNameController *nameCtl = [[ChangeNameController alloc] init];
            [self.navigationController pushViewController:nameCtl animated:YES];
        }
        else if (indexPath.row == 1) {
            //修改手机
            ChangePhoneController *phoneCtl = [[ChangePhoneController alloc] init];
            [self.navigationController pushViewController:phoneCtl animated:YES];
        }else{
            //微信号
            ChangeWeChatController *wechatCtl = [[ChangeWeChatController alloc] init];
            [self.navigationController pushViewController:wechatCtl animated:YES];
        }
    }else{
        if (indexPath.row == 0) {
            //生日
            BirthdaySheet *birSheet = [[BirthdaySheet alloc] init];
            [birSheet showView];
        }else{
            //性别
            GenderSheet *sheet = [[GenderSheet alloc] init];
            [sheet showView];
        }
    }
}
    
    
    @end
