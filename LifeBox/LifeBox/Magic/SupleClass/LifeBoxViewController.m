//
//  LifeBoxViewController.m
//  LifeBox
//
//  Created by Lucky on 2019/8/2.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "LifeBoxViewController.h"

@interface LifeBoxViewController ()

@end

@implementation LifeBoxViewController

#pragma mark - 视图周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    /*
     * 获取当前类名
     */
    NSString *className = NSStringFromClass([self class]);
    DDLogVerbose(@"\n🏷当前业务类名: %@🏷", className);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}

#pragma mark - 获取网络实例
- (NetWorkRequest *)request {
    _request = [[NetWorkRequest alloc] init];
    return _request;
}


@end
