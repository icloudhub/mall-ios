//
//  WebViewController.m
//  LifeBox
//
//  Created by xiaoqy on 2019/11/5.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<WKUIDelegate,WKNavigationDelegate>

@property (nonatomic, strong) UIProgressView *progressView;

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
    [self setTitle:self.title];
     [self.view addSubview:self.progressView];
}
-(WKWebView *)webview{
    
    if (!_webview) {
        _webview = [[WKWebView alloc] init];
        _webview.backgroundColor = [UIColor yellowColor];
        _webview.UIDelegate = self;
        // 导航代理
        _webview.navigationDelegate = self;
        // 是否允许手势左滑返回上一级, 类似导航控制的左滑返回
        _webview.allowsBackForwardNavigationGestures = YES;
        
        //添加监测网页加载进度的观察者
        [_webview addObserver:self
                   forKeyPath:@"estimatedProgress"
                      options:0
                      context:nil];
        //添加监测网页标题title的观察者
        [_webview addObserver:self
                   forKeyPath:@"title"
                      options:NSKeyValueObservingOptionNew
                      context:nil];
        [self.view addSubview:_webview];
        
    }
    return _webview;
}

-(UIProgressView *)progressView{
    if (!_progressView) {
        //进度条初始化
        _progressView = [UIProgressView new];
        _progressView.backgroundColor = [UIColor blueColor];
        
    }
    return _progressView;
}
-(void)setUrl:(NSURL *)url{

    _url = url;
    NSLog(@"web加载：",url);
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    [self.webview loadRequest:request];
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
    [_progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.webview);
        make.left.mas_equalTo(self.webview);
        make.right.mas_equalTo(self.webview);
        make.height.mas_equalTo(10);
    }];
}

   //kvo 监听进度 必须实现此方法
-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                      context:(void *)context{
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(estimatedProgress))]
        && object == _webview) {
       NSLog(@"网页加载进度 = %f",_webview.estimatedProgress);
        self.progressView.progress = _webview.estimatedProgress;
        if (_webview.estimatedProgress >= 1.0f) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.progressView.progress = 0;
            });
        }
    }else if([keyPath isEqualToString:@"title"]
             && object == _webview){
        self.navigationItem.title = _webview.title;
    }else{
        [super observeValueForKeyPath:keyPath
                             ofObject:object
                               change:change
                              context:context];
    }
}

@end
