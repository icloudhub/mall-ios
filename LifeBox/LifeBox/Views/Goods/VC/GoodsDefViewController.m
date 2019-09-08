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
#import "GoodsCommitView.h"
@interface GoodsDefViewController ()
@property(strong, nonatomic) WKWebView *defWebview;
@property(strong, nonatomic) GoodsCommitView *goodsCommitView;
@end

@implementation GoodsDefViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
    [self loadData];
}

-(void)loadData{
    [[NetWorkRequest new]productproductInfo:_productid block:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
        if (error) {
            [self.view ug_msg:error.domain];
        }else{
            ProductModel *temdata = [ProductModel yy_modelWithJSON:dataDict];
            if (temdata.detailMobileHtml.length>0 ) {
                 [_defWebview loadHTMLString:temdata.detailMobileHtml baseURL:nil];
            }else{
                [_defWebview loadHTMLString:temdata.detailHtml baseURL:nil];
            }
            
            _defWebview.backgroundColor = UIColor.ug_random;
        }
    }];
}

-(void)configUI{

    self.defWebview = [WKWebView new];
    [self.view addSubview:_defWebview];
    
    self.goodsCommitView = [GoodsCommitView new];
    [self.view addSubview:_goodsCommitView];
    _goodsCommitView.backgroundColor = UIColor.ug_random;
}
-(void)viewLayoutMarginsDidChange{
    [super viewLayoutMarginsDidChange];
    [_defWebview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    [_goodsCommitView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.width.mas_equalTo(self.view).mas_offset(-SAFE_Bottom);
        make.height.mas_equalTo(44);
        
    }];
}
@end
