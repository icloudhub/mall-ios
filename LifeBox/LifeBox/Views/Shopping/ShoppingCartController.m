//
//  ShoppingCartController.m
//  LifeBox
//
//  Created by Lucky on 2019/8/6.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "ShoppingCartController.h"
#import "NetWorkRequest+Shoping.h"
@interface ShoppingCartController ()
@property(strong, nonatomic) UIButton *loginBtn;
@end

@implementation ShoppingCartController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //登陆按钮
    self.loginBtn = [UIButton new];
    [_loginBtn setBackgroundColor:UIColor.ug_random];
    [_loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [self.view addSubview:_loginBtn];
    [_loginBtn bk_addEventHandler:^(id sender) {
        
        [[NetWorkRequest new]cartlistblock:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
            if (error) {
                [self.view ug_msg:error.domain];
            }else{
                [self.view ug_msg:[NSString stringWithFormat:@"%@",dataDict]];
            }
        }];
    } forControlEvents:UIControlEventTouchUpInside];
}

-(void)viewLayoutMarginsDidChange{
    
    [super viewLayoutMarginsDidChange];
    
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(S_Defmargin);
        make.right.mas_equalTo(-S_Defmargin);
        make.top.mas_equalTo(self.view.center.y);
        make.height.mas_equalTo(44);
    }];

    
}
@end
