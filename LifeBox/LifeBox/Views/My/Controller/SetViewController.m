//
//  SetViewController.m
//  LifeBox
//
//  Created by Lucky on 2019/9/7.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "SetViewController.h"
#import "SetInfoCell.h"
#import "SetPersonInfoCell.h"
#import "FeedbackController.h"

@interface SetViewController ()<UITableViewDelegate, UITableViewDataSource> {
    ///数据展示
    UITableView *tableView;
    ///标题数组
    NSArray *titleArr;
}

@end

static NSString *personCellID = @"SetPersonInfoCellID";
static NSString *infoCellID = @"SetInfoCellID";


@implementation SetViewController

#pragma mark - 视图层
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setWhiteNaviWithTitle:@"设置"];
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
    tableView.estimatedRowHeight = 60;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.tableFooterView = [UIView new];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(400));
    }];
    /*
     * 退出Btn
     */
    UIButton *outBtn = [[UIButton alloc] init];
    outBtn.layer.cornerRadius = Scale750(45);
    outBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(35)];
    [outBtn setBackgroundColor:S_COGreenBack];
    [outBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [outBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:outBtn];
    [outBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->tableView.mas_bottom).mas_offset(Scale750(120));
        make.left.mas_equalTo(Scale750(30));
        make.right.mas_equalTo(-Scale750(30));
        make.height.mas_equalTo(Scale750(90));
    }];
    [outBtn bk_addEventHandler:^(id sender) {
        //退出点击
        
    } forControlEvents:UIControlEventTouchUpInside];
    /*
     * 封装数据
     */
    titleArr = [NSArray arrayWithObjects:@"收货地址", @"问题反馈", @"关于生活宝", nil];
}

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        SetPersonInfoCell *personCell = [tableView dequeueReusableCellWithIdentifier:personCellID];
        if (personCell == nil) {
            personCell = [[SetPersonInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:personCellID];
        }
        personCell.backgroundColor = [UIColor whiteColor];
        personCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return personCell;
    }else{
        SetInfoCell *infoCell = [tableView dequeueReusableCellWithIdentifier:infoCellID];
        if (infoCell == nil) {
            infoCell = [[SetInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:infoCellID];
        }
        infoCell.backgroundColor = [UIColor whiteColor];
        infoCell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSString *tempStr = [titleArr objectAtIndex:indexPath.row - 1];
        [infoCell reloadCellUIWith:tempStr];
        return infoCell;
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 1:
        {
            //收货地址
        }
            break;
        case 2:
        {
            //问题反馈
            FeedbackController *feedBackCtl = [[FeedbackController alloc] init];
            [self.navigationController pushViewController:feedBackCtl animated:YES];
        }
            break;
        case 3:
        {
            //关于生活宝
        }
            break;
        default:
            break;
    }
}

@end
