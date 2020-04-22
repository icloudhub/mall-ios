//
//  LifeBoxViewController.m
//  LifeBox
//
//  Created by Lucky on 2019/8/2.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "LifeBoxViewController.h"

@interface LifeBoxViewController ()
@property(strong, nonatomic) UIButton *refreshBtn;
@end

@implementation LifeBoxViewController

#pragma mark - 视图周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = S_COBackground;
    /*
     * 获取当前类名
     */
    NSString *className = NSStringFromClass([self class]);
    NSLog(@"\n🏷当前业务类名: %@🏷", className);
    //添加测试按钮
//    self.refreshBtn = [UIButton new];
//    [_refreshBtn setTitle:@"刷新" forState:UIControlStateNormal];
//    [_refreshBtn setBackgroundColor:UIColor.redColor];
//    [self.view addSubview:_refreshBtn];
//    [_refreshBtn ug_addEvents:UIControlEventTouchUpInside andBlock:^(id  _Nonnull sender) {
//        [self loadData];
//    }];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self loadData];
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

-(void)loadData{
    NSLog(@"父类刷新");
}

-(void)viewLayoutMarginsDidChange{
    [super viewLayoutMarginsDidChange];
    [_refreshBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(44, 44));
        make.centerY.mas_equalTo(self.view.mas_top).mas_equalTo(64+SAFE_Top);
        make.centerX.mas_equalTo(self.view);
    }];
    [self.view insertSubview:_refreshBtn aboveSubview:self.view.subviews.lastObject];
}
@end
