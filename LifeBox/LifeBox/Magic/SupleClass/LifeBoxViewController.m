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
-(instancetype)init{
    if (self == [super init]) {
        
    }
    return self;
}
#pragma mark - 视图周期
- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = S_COBackground;
    //导航拦
    if (self.navigationController.viewControllers.count > 1) {
        UIButton *itemButtom = [UIButton new];
        [itemButtom setFrame:CGRectMake(0, 0, 30, 40)];
        [itemButtom setImage:[UIImage imageWithIcon:@"fa-angle-left" backgroundColor:UIColor.clearColor iconColor:COLOR23 andSize:CGSizeMake(25, 25)] forState:UIControlStateNormal];
        [itemButtom addTarget:self action:@selector(leftNavBarTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *button = [[UIBarButtonItem alloc]
                                   initWithCustomView:itemButtom];
        [self.navigationItem setLeftBarButtonItems:@[button]];
    }
    /*
     * 获取当前类名
     */
    NSString *className = NSStringFromClass([self class]);
    NSLog(@"\n🏷当前业务类名: %@🏷", className);

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self loadData];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}



-(void)loadData{
    NSLog(@"父类刷新");
}
-(void)leftNavBarTouchUpInside:(UIButton*)sender{
    [self.navigationController popViewControllerAnimated:YES];
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
