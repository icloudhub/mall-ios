//
//  ConfimOrderVC.m
//  LifeBox
//
//  Created by admin on 2019/9/7.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "ConfimOrderVC.h"
#import "NetWorkRequest+Orlder.h"
#import "NetWorkRequest+Orlder.h"
#import "ConfirAddressView.h"
#import "ConfirmInfoData.h"
#import "ConfimBottomView.h"
@interface ConfimOrderVC()

@property(strong, nonatomic) UIScrollView* scrollView;
@property(strong, nonatomic) ConfirAddressView* addressView;//收货地址
@property(strong, nonatomic) ConfimBottomView* confimBottomView;//支付view
@property(strong, nonatomic) ConfirmInfoData *confirmInfoData;//确认订单数据

@end

@implementation ConfimOrderVC


- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self configUI];
    [self loadData];
}
-(void)configUI{
    self.scrollView = [UIScrollView new];
    [self.view addSubview:_scrollView];
    
    self.addressView = [ConfirAddressView new];
    [_scrollView addSubview:_addressView];
    
    self.confimBottomView = [ConfimBottomView new];
    [self.view addSubview:_confimBottomView];
    _confimBottomView.backgroundColor = UIColor.ug_random;
    [_confimBottomView.commitBtn ug_addEvents:UIControlEventTouchUpInside andBlock:^(id  _Nonnull sender) {
        [self.view ug_msg:@"去生成支付订单"];
    }];
    
}
-(void)updateUI{
    _addressView.addLab.text = [_confirmInfoData.defaddress yy_modelToJSONString];
    _confimBottomView.amountLab.text = [_confirmInfoData.amountdata yy_modelToJSONString];
}
-(void)loadData{
    [[[NetWorkRequest alloc]init] getConfirmOrderInfo:_confimid block:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
        if (error) {
            [self.view ug_msg:error.domain];
        }else{
            self.confirmInfoData = [ConfirmInfoData yy_modelWithJSON:dataDict];
            [self updateUI];
        }
    }];
}

-(void)viewLayoutMarginsDidChange{
    [super viewLayoutMarginsDidChange];
    
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    [_addressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.scrollView);
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.height.mas_equalTo(160);
    }];
    [_confimBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.height.mas_equalTo(160);
    }];
}
@end
