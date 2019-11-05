//
//  WebViewController.m
//  LifeBox
//
//  Created by xiaoqy on 2019/11/5.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController
-(void)loadView{
    [super loadView];
  
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

-(void)configUI{
    /*
     * 详情显示Web
     */
    self.webview = [[WKWebView alloc] init];
    _webview.backgroundColor = [UIColor yellowColor];
    _webview.hidden = YES;
    [self.view addSubview:_webview];
    [_webview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
}

-(void)setHtmlstr:(NSString *)htmlstr{

    _htmlstr = htmlstr;
    [_webview loadHTMLString:_htmlstr baseURL:nil];
}

@end
