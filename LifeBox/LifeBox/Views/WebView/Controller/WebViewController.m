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
    [self setWhiteNaviWithTitle:self.title];
    /*
     * 详情显示Web
     */
 
    
}
-(WKWebView *)webview{
    
    if (!_webview) {
        _webview = [[WKWebView alloc] init];
        _webview.backgroundColor = [UIColor yellowColor];
        [self.view addSubview:_webview];
     
    }
    return _webview;
}

-(void)setHtmlstr:(NSString *)htmlstr{

    _htmlstr = htmlstr;
    [self.webview loadHTMLString:_htmlstr baseURL:nil];
}
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [_webview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

@end
