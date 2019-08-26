//
//  HomeViewController.m
//  LifeBox
//
//  Created by Lucky on 2019/8/3.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "HomeViewController.h"

@implementation HomeViewController

#pragma mark - 视图层
- (void)viewDidLoad {
    self.view.backgroundColor = S_COBackground;
    [self createUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    [self.view endEditing:YES];
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 顶部View
     */
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(730));
    }];
    /*
     * 搜索View
     */
    UIView *searchView = [[UIView alloc] init];
    searchView.backgroundColor = [UIColor yellowColor];
    [topView addSubview:searchView];
    [searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(SAFE_Top + Scale750(88));
    }];
}

@end
