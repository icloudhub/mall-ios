//
//  InvitationController.m
//  LifeBox
//
//  Created by Lucky on 2019/9/3.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "InvitationController.h"
#import "InvitationCell.h"

#import "NetWorkRequest+MyInterface.h"

@interface InvitationController () <UITableViewDelegate, UITableViewDataSource> {
    ///数据展示tableView
    UITableView *tableView;
    NSArray *dataArr;
}

@end

static NSString *cellID = @"InvitationCellID";

@implementation InvitationController

#pragma mark - 视图层
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"邀请有礼"];
    [self createUI];
    [self getinviteList];
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 数据展示
     */
    tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.bounces = NO;
    tableView.separatorStyle = UITableViewCellEditingStyleNone;
    // 删除单元格分隔线的一个小技巧
    tableView.tableFooterView = [UIView new];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    /*
     * 顶部View
     */
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, Scale750(810))];
    
    UIImageView *topImg = [[UIImageView alloc] init];
    topImg.image = [UIImage imageNamed:@"ic_chahua"];
    [topView addSubview:topImg];
    [topImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(720));
    }];
    /*
     * 邀请Btn
     */
    UIButton *invitationBtn = [[UIButton alloc] init];
    invitationBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    [invitationBtn setTitleColor:S_COGreenText forState:UIControlStateNormal];
    [invitationBtn setTitle:@"立即邀请" forState:UIControlStateNormal];
    invitationBtn.backgroundColor = [UIColor whiteColor];
    invitationBtn.layer.cornerRadius = Scale750(35);
    [topImg addSubview:invitationBtn];
    [invitationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(topImg.mas_centerX);
        make.centerY.mas_equalTo(topImg.mas_centerY).mas_offset(Scale750(30));
        make.width.mas_equalTo(Scale750(280));
        make.height.mas_equalTo(Scale750(70));
    }];
    /*
     * 标题
     */
    UILabel *title = [[UILabel alloc] init];
    title.font = [UIFont systemFontOfSize:Scale750(30)];
    title.textColor = RGBColor(51, 51, 51);
    title.text = @"已邀请";
    [topView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(Scale750(30));
        make.bottom.mas_equalTo(-Scale750(30));
        make.height.mas_equalTo(Scale750(30));
        make.width.mas_greaterThanOrEqualTo(0);
    }];
    tableView.tableHeaderView = topView;
}

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InvitationCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[InvitationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSDictionary *dic = [dataArr objectAtIndex:indexPath.row];
    cell.nameLab.text = [dic stringValueForKey:@"username" default:@"--" ];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return Scale750(90);
}

-(void)getinviteList{
    [[NetWorkRequest new] inviteListendBlock:^(NSDictionary * _Nonnull result, NSError * _Nonnull error) {
        if (error) {
            [self.view ug_msg:error.domain];
        }else{
            dataArr = result;
            [tableView reloadData];
        }
    }];
}

@end
