//
//  GoodsDefViewController.m
//  LifeBox
//
//  Created by admin on 2019/8/17.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "GoodsDefViewController.h"
#import <WebKit/WebKit.h>
#import "NetWorkRequest+Goods.h"
#import "ProductModel.h"

@interface GoodsDefViewController ()
@property(strong, nonatomic) WKWebView *defWebview;
@end

@implementation GoodsDefViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self loadData];
}
-(void)loadData{
    [[NetWorkRequest new]productproductInfo:26 block:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
        if (error) {
            [self.view ug_msg:error.domain];
        }else{
            ProductModel *temdata = [ProductModel yy_modelWithJSON:dataDict];
            [self.view ug_msg:[NSString stringWithFormat:@"%@",dataDict]];
            [_defWebview loadHTMLString:temdata.detailMobileHtml baseURL:nil];
            _defWebview.backgroundColor = UIColor.ug_random;
        }
    }];
}

-(void)configUI{
    self.defWebview = [WKWebView new];
    [self.view addSubview:_defWebview];
}
-(void)viewLayoutMarginsDidChange{
    [super viewLayoutMarginsDidChange];
    [_defWebview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}
@end
