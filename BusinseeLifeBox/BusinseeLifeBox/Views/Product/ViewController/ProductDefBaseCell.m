//
//  ProductDefBaseCell.m
//  BusinseeLifeBox
//
//  Created by admin on 2020/4/27.
//  Copyright © 2020 admin. All rights reserved.
//

#import "ProductDefBaseCell.h"

@implementation ProductDefAddCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}

-(void)configUI{
    [self addSubview:self.icon];
}
-(UIImageView *)icon{
    if (!_icon) {
        _icon = [UIImageView new];
        _icon.contentMode = UIViewContentModeCenter;
        [_icon setImage:[UIImage imageWithIcon:@"fa-plus" backgroundColor:UIColor.clearColor iconColor:UIColor.ug_random fontSize:40]];
    }
    return _icon;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}
@end

@implementation ProductDefBaseCell


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}

-(void)configUI{
     [self addSubview:self.webview];
    [self addSubview:self.typeLab];
}
-(UILabel *)typeLab{
    if (!_typeLab) {
        _typeLab = [UILabel new];
    }
    return _typeLab;
}
-(WKWebView *)webview{
    if (!_webview) {
        // 设置加载文字大小适配
        NSString *jScript = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);";
        WKUserScript *wkUScript = [[WKUserScript alloc] initWithSource:jScript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
        WKUserContentController *wkUController = [[WKUserContentController alloc] init];
        [wkUController addUserScript:wkUScript];
        WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
        wkWebConfig.userContentController = wkUController;
        
  
        _webview = [[WKWebView alloc]initWithFrame:CGRectZero configuration:wkWebConfig];
        _webview.userInteractionEnabled = NO;
        _webview.navigationDelegate = self;

        [_webview.scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
         [_webview addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];

    }
    return _webview;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{

    if ([keyPath isEqualToString:@"contentSize"]) {
        CGRect frame = self.webview.frame;
        frame.size.height = self.webview.scrollView.contentSize.height;
        _cellData.fullHeigt = frame.size.height;
     
    }
    if ([keyPath isEqualToString:@"estimatedProgress"]){
        CGFloat progress = _webview.estimatedProgress*100;
        [_webview ug_loadingProgress:[NSString stringWithFormat:@"%0.2f\%",progress]];
    }
}
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
     [_webview ug_starloading];
}
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
     [_webview ug_stoploading];
}
-(void)reload:(ProductCellData*)data{
    _cellData = data;
    _typeLab.text = data.type;
    [_webview ug_stoploading];
    [_webview loadHTMLString:data.html baseURL:nil];
   
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [_typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self);
        make.top.mas_equalTo(self);
        
    }];
    [_webview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
           
    }];
}
@end
