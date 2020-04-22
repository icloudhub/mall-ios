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
#import "AddressManagementController.h"
#import "PersonInfoController.h"
#import "SetPasswordController.h"
#import "SDWebImageManager.h"
#import <SDImageCache.h>

@interface SetViewController ()<UITableViewDelegate, UITableViewDataSource> {
    ///数据展示
    UITableView *tableView;
    ///标题数组
    NSArray *titleArr;
}

@end

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
        make.height.mas_equalTo(Scale750(550));
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
    titleArr = [NSArray arrayWithObjects:@"个人资料", @"密码设置", @"地址管理", @"问题反馈", @"清楚缓存", @"关于", nil];
}

#pragma mark - UITableView代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SetInfoCell *infoCell = [tableView dequeueReusableCellWithIdentifier:infoCellID];
    if (infoCell == nil) {
        infoCell = [[SetInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:infoCellID];
    }
    infoCell.backgroundColor = [UIColor whiteColor];
    infoCell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSString *tempStr = [titleArr objectAtIndex:indexPath.row];
    [infoCell reloadCellUIWith:tempStr];
    return infoCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return Scale750(90);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            //个人资料
            PersonInfoController *infoCtl = [[PersonInfoController alloc] init];
            [self.navigationController pushViewController:infoCtl animated:YES];
        }
            break;
        case 1:
        {
            //密码设置
            SetPasswordController *pwCtl = [[SetPasswordController alloc] init];
            pwCtl.typeStr = @"0";
            [self.navigationController pushViewController:pwCtl animated:YES];
        }
            break;
        case 2:
        {
            //地址管理
            AddressManagementController *addressCtl = [[AddressManagementController alloc] init];
            [self.navigationController pushViewController:addressCtl animated:YES];
        }
            break;
        case 3:
        {
            //反馈
            FeedbackController *feedBackCtl = [[FeedbackController alloc] init];
            [self.navigationController pushViewController:feedBackCtl animated:YES];
        }
            break;
        case 4:
        {
            //清除缓存
//            NSString *sdfasdf = [self getCacheSize];
            [self cleanCache];
            [self.view ug_starloading];
            double delayInSeconds = 2.0;
                dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
                dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                    [self.view ug_stoploading];
                    [self.view ug_msg:@"清除完成"];
                });
        }
            break;
        case 5:
        {
            //关于
        }
            break;
        default:
            break;
    }
}

#pragma mark - 计算缓存
-(NSString *)getCacheSize {
    //得到缓存路径
    NSString * path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    NSFileManager * manager = [NSFileManager defaultManager];
    CGFloat size = 0;
    //首先判断是否存在缓存文件
    if ([manager fileExistsAtPath:path]) {
        NSArray * childFile = [manager subpathsAtPath:path];
        for (NSString * fileName in childFile) {
            //缓存文件绝对路径
            NSString * absolutPath = [path stringByAppendingPathComponent:fileName];
            size = size + [manager attributesOfItemAtPath:absolutPath error:nil].fileSize;
        }
        //计算sdwebimage的缓存和系统缓存总和
        size = size + [[SDImageCache sharedImageCache] totalDiskSize];
    }
    return [NSString stringWithFormat:@"%.2f",size / 1024 / 1024];
}

///清楚缓存
-(void)cleanCache {
//    NSString *cacheStr = [self getCacheSize];
    NSError *error = nil;//错误信息
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
        NSFileManager * manager = [NSFileManager defaultManager];
    //判断是否存在缓存文件
    if ([manager fileExistsAtPath:path]) {
        NSArray * childFile = [manager subpathsAtPath:path];
        //逐个删除缓存文件
        for (NSString *fileName in childFile) {
            NSString * absolutPat = [path stringByAppendingPathComponent:fileName];
            [manager removeItemAtPath:absolutPat error:&error];
            if (error) {
                NSLog(@"清除失败");
            }
        }
        //删除sdwebimage的缓存
        [[SDImageCache sharedImageCache] clearMemory];
    }
}

@end
