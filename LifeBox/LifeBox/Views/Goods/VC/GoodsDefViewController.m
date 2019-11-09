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
#import "NetWorkRequest+Shoping.h"
#import "ConfimOrderVC.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
#import "GoodsCommentsController.h"
#import "GoodsSpeSheet.h"

@interface GoodsDefViewController ()<SDCycleScrollViewDelegate> {
    ///顶部导航View
    UIView *navView;
    ///下划线
    UIView *botLine;
    ///轮播View
    SDCycleScrollView *bannerView;
    ///商品区域View
    UIView *goodsView;
    ///Banner数量展示
    UILabel *numLab;
    ///商品名称
    UILabel *goodsName;
    ///商品标题
    UILabel *goodsTitle;
    ///商品价格
    UILabel *goodsPrice;
    ///商品规格View
    GoodsSpeSheet *speSheet;
    ///轮播图个数
    NSString *allStr;
}

///详情显示Web
@property(strong, nonatomic) WKWebView *defWebview;

///可滚动区域
@property(strong, nonatomic) UIScrollView *scrollView;

@property(strong, nonatomic) NSDictionary *productdic;

@end

@implementation GoodsDefViewController

#pragma mark - 视图层
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self CreateTopNavView];
    [self createGoodsView];
    [self createDetailsView];
    [self getHttpLoadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    [self.view endEditing:YES];
}

- (void)viewLayoutMarginsDidChange {
    [super viewLayoutMarginsDidChange];
    CGFloat scrollViewH = goodsView.frame.origin.y + goodsView.frame.size.height + Scale750(30);
    [_scrollView setContentSize:CGSizeMake(Screen_width, scrollViewH)];
}

#pragma mark - 顶部导航了View
- (void)CreateTopNavView {
    /*
     * 导航View
     */
    navView = [[UIView alloc] init];
    navView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:navView];
    [navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(SAFE_Top + Scale750(88));
    }];
    /*
     * 分割线
     */
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = S_COLine;
    [navView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    /*
     * 返回Btn
     */
    UIButton *backBtn = [[UIButton alloc] init];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"ic_return"] forState:UIControlStateNormal];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"ic_return"] forState:UIControlStateHighlighted];
    [navView addSubview:backBtn];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-Scale750(30));
        make.left.mas_equalTo(Scale750(50));
        make.width.mas_equalTo(Scale750(26));
        make.height.mas_equalTo(Scale750(42));
    }];
    [backBtn bk_addEventHandler:^(id sender) {
        [self.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    /*
     * 进入购物车Btn
     */
    UIButton *shopCar = [[UIButton alloc] init];
    [shopCar setBackgroundImage:[UIImage imageNamed:@"ic_cart_shop"] forState:UIControlStateNormal];
    [shopCar setBackgroundImage:[UIImage imageNamed:@"ic_cart_shop"] forState:UIControlStateHighlighted];
    [navView addSubview:shopCar];
    [shopCar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(backBtn);
        make.right.mas_equalTo(-Scale750(40));
        make.width.height.mas_equalTo(Scale750(50));
    }];
    [shopCar bk_addEventHandler:^(id sender) {
        self.tabBarController.selectedIndex = 1;
    } forControlEvents:UIControlEventTouchUpInside];
    /*
     * 商品按钮
     */
    UIButton *goodsBtn = [[UIButton alloc] init];
    goodsBtn.titleLabel.font = [UIFont boldSystemFontOfSize:Scale750(36)];
    [goodsBtn setTitle:@"商品" forState:UIControlStateNormal];
    [goodsBtn setTitleColor:RGBColor(51, 51, 51) forState:UIControlStateNormal];
    goodsBtn.tag = 1000;
    [goodsBtn addTarget:self action:@selector(chooseTypeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:goodsBtn];
    [goodsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(backBtn);
        make.right.mas_equalTo(navView.mas_centerX).mas_offset(-Scale750(20));
        make.width.mas_equalTo(Scale750(100));
        make.height.mas_equalTo(Scale750(40));
    }];
    /*
     * 详情按钮
     */
    UIButton *detBtn = [[UIButton alloc] init];
    detBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(32)];
    [detBtn setTitle:@"详情" forState:UIControlStateNormal];
    [detBtn setTitleColor:RGBColor(51, 51, 51) forState:UIControlStateNormal];
    detBtn.tag = 1001;
    [detBtn addTarget:self action:@selector(chooseTypeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:detBtn];
    [detBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(backBtn);
        make.left.mas_equalTo(navView.mas_centerX).mas_offset(Scale750(20));
        make.width.mas_equalTo(Scale750(100));
        make.height.mas_equalTo(Scale750(40));
    }];
    /*
     * 下划线
     */
    botLine = [[UIView alloc] init];
    botLine.backgroundColor = S_COGreenBack;
    [navView addSubview:botLine];
    [botLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(goodsBtn);
        make.width.mas_equalTo(Scale750(80));
        make.height.mas_equalTo(Scale750(8));
    }];
}

#pragma mark - 创建商品区域
- (void)createGoodsView {
    /*
     * 可滚动区域
     */
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.hidden = NO;
    [self.view addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(navView.mas_bottom);
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(Screen_width);
    }];
    /*
     * 商品banner
     */
    bannerView = [[SDCycleScrollView alloc] init];
    bannerView.backgroundColor = S_COBackground;
    bannerView.bannerImageViewContentMode = UIViewContentModeScaleToFill;
    bannerView.autoScroll = NO;
    bannerView.showPageControl = NO;
    bannerView.delegate = self;
    NSArray *imgArr = [NSArray arrayWithObjects:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1566836643282&di=1e0aea2d46e6cf6df4f0ac78d11aaf83&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01a49659652b6ca8012193a38907d5.jpg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1566836670731&di=370c93b0013a47af58a96f8b49410463&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F013dce57fb4a44a84a0e282b326790.jpg", nil];
    
    bannerView.imageURLStringsGroup = imgArr;
    [_scrollView addSubview:bannerView];
    [bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(0);
        make.width.mas_equalTo(Screen_width);
        make.height.mas_equalTo(Scale750(600));
    }];
    /*
     * 图片数量展示
     */
    numLab = [[UILabel alloc] init];
    numLab.backgroundColor = [RGBColor(223, 223, 223) colorWithAlphaComponent:0.8];
    numLab.layer.cornerRadius = Scale750(30);
    numLab.clipsToBounds = YES;
    numLab.textAlignment = NSTextAlignmentCenter;
    numLab.textColor = [UIColor whiteColor];
    numLab.font = [UIFont systemFontOfSize:Scale750(22)];
    NSString *tempStr = @"1/6";
    numLab.attributedText = [tempStr strChangFlagWithStr:@"1" Color:[UIColor whiteColor] Font:Scale750(34)];
    [bannerView addSubview:numLab];
    [numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-Scale750(30));
        make.bottom.mas_equalTo(-Scale750(30));
        make.width.height.mas_equalTo(Scale750(60));
    }];
    /*
     * 商品区域View
     */
    goodsView = [[UIView alloc] init];
    goodsView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:goodsView];
    [goodsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bannerView.mas_bottom);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(Screen_width);
        make.height.mas_greaterThanOrEqualTo(Scale750(400));
    }];
    /*
     * 分享Btn
     */
    UIButton *shareBtn = [[UIButton alloc] init];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"ic_share_goods"] forState:UIControlStateNormal];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"ic_share_goods"] forState:UIControlStateHighlighted];
    [goodsView addSubview:shareBtn];
    [shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bannerView.mas_bottom).mas_offset(Scale750(30));
        make.right.mas_equalTo(-Scale750(30));
        make.width.height.mas_equalTo(Scale750(50));
    }];
    /*
     * 商品名称
     */
    goodsName = [[UILabel alloc] init];
    goodsName.font = [UIFont systemFontOfSize:Scale750(30)];
    goodsName.textColor = RGBColor(51, 51, 51);
    goodsName.text = @"高山苹果 400g";
    [goodsView addSubview:goodsName];
    [goodsName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(shareBtn);
        make.left.mas_equalTo(Scale750(30));
        make.right.mas_equalTo(shareBtn.mas_left).mas_offset(-Scale750(20));
        make.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 商品标题
     */
    goodsTitle = [[UILabel alloc] init];
    goodsTitle.font = [UIFont systemFontOfSize:Scale750(24)];
    goodsTitle.textColor = RGBColor(189, 189, 189);
    goodsTitle.text = @"果色艳丽，果肉鲜美";
    [goodsView addSubview:goodsTitle];
    [goodsTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(goodsName.mas_bottom).mas_offset(Scale750(5));
        make.left.height.width.mas_equalTo(goodsName);
    }];
    /*
     * 商品价格
     */
    goodsPrice = [[UILabel alloc] init];
    goodsPrice.font = [UIFont systemFontOfSize:Scale750(25)];
    goodsPrice.textColor = S_CORedText;
    NSString *priceStr = @"¥12.90";
    goodsPrice.attributedText = [priceStr strChangFlagWithStr:@"12" Color:S_CORedText Font:Scale750(35)];
    [goodsView addSubview:goodsPrice];
    [goodsPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(goodsTitle.mas_bottom).mas_offset(Scale750(40));
        make.left.mas_equalTo(goodsName);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 配送时间展示区域
     */
    UIView *timeView = [[UIView alloc] init];
    timeView.backgroundColor = RGBColor(245, 245, 245);
    [goodsView addSubview:timeView];
    [timeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(goodsPrice.mas_bottom).mas_offset(Scale750(30));
        make.left.mas_equalTo(Scale750(30));
        make.right.mas_equalTo(-Scale750(30));
        make.height.mas_equalTo(Scale750(90));
    }];
    /*
     * icon展示
     */
    UIImageView *iconImg = [[UIImageView alloc] init];
    iconImg.image = [UIImage imageNamed:@"ic_order"];
    [timeView addSubview:iconImg];
    [iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(Scale750(20));
        make.centerY.mas_equalTo(timeView);
        make.width.height.mas_equalTo(Scale750(44));
    }];
    /*
     * 配送时间
     */
    UILabel *timeLab = [[UILabel alloc] init];
    timeLab.font = [UIFont systemFontOfSize:Scale750(30)];
    timeLab.textColor = RGBColor(51, 51, 51);
    timeLab.text = @"现在下单，最快1小时内送达";
    [timeView addSubview:timeLab];
    [timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(iconImg.mas_right).mas_offset(Scale750(20));
        make.centerY.mas_equalTo(timeView);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 规格区域
     */
    UIButton *speView = [[UIButton alloc] init];
    speView.backgroundColor = RGBColor(245, 245, 245);
    [goodsView addSubview:speView];
    [speView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(timeView.mas_bottom).mas_offset(Scale750(20));
        make.left.mas_equalTo(Scale750(30));
        make.right.mas_equalTo(-Scale750(30));
        make.height.mas_equalTo(Scale750(90));
    }];
    [speView bk_addEventHandler:^(id sender) {
        self->speSheet = [[GoodsSpeSheet alloc] init];
        [self->speSheet showView];
    } forControlEvents:UIControlEventTouchUpInside];
    /*
     * 规格Lab
     */
    UILabel *speLab = [[UILabel alloc] init];
    speLab.font = [UIFont systemFontOfSize:Scale750(30)];
    speLab.textColor = RGBColor(51, 51, 51);
    speLab.text = @"已选择: 400g/盒";
    [speView addSubview:speLab];
    [speLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(Scale750(20));
        make.centerY.mas_equalTo(speView);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 进入图片
     */
    UIImageView *enterImg = [[UIImageView alloc] init];
    enterImg.image = [UIImage imageNamed:@"ic_enter"];
    [speView addSubview:enterImg];
    [enterImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-Scale750(30));
        make.centerY.mas_equalTo(speView);
        make.width.mas_equalTo(Scale750(32));
        make.height.mas_equalTo(Scale750(30));
    }];
    /*
     * 评论区域
     */
    UIButton *commentsView = [[UIButton alloc] init];
    commentsView.backgroundColor = RGBColor(245, 245, 245);
    [goodsView addSubview:commentsView];
    [commentsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(speView.mas_bottom).mas_offset(Scale750(20));
        make.left.mas_equalTo(Scale750(30));
        make.right.mas_equalTo(-Scale750(30));
        make.height.mas_equalTo(Scale750(90));
    }];
    [commentsView bk_addEventHandler:^(id sender) {
        GoodsCommentsController *commentsCtl = [[GoodsCommentsController alloc] init];
        [self.navigationController pushViewController:commentsCtl animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    /*
     * 评价数量
     */
    UILabel *numTitle = [[UILabel alloc] init];
    numTitle.font = [UIFont systemFontOfSize:Scale750(30)];
    numTitle.textColor = RGBColor(51, 51, 51);
    numTitle.text = @"评价(66)";
    [commentsView addSubview:numTitle];
    [numTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(Scale750(20));
        make.centerY.mas_equalTo(commentsView);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 进入图片
     */
    UIImageView *enterImg1 = [[UIImageView alloc] init];
    enterImg1.image = [UIImage imageNamed:@"ic_enter"];
    [commentsView addSubview:enterImg1];
    [enterImg1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-Scale750(30));
        make.centerY.mas_equalTo(commentsView);
        make.width.mas_equalTo(Scale750(32));
        make.height.mas_equalTo(Scale750(30));
    }];
    /*
     * 查看所有评论Lab
     */
    UILabel *allLab = [[UILabel alloc] init];
    allLab.font = [UIFont systemFontOfSize:Scale750(26)];
    allLab.textColor = RGBColor(51, 51, 51);
    allLab.text = @"查看所有评论";
    [commentsView addSubview:allLab];
    [allLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(enterImg1.mas_left).mas_offset(-Scale750(5));
        make.centerY.mas_equalTo(commentsView);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 更新布局
     */
    [goodsView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(commentsView.mas_bottom).mas_offset(Scale750(40));
    }];
}

#pragma mark - 创建详情区域
- (void)createDetailsView {
    /*
     * 详情显示Web
     */
    _defWebview = [[WKWebView alloc] init];
    _defWebview.backgroundColor = [UIColor yellowColor];
    _defWebview.hidden = YES;
    [self.view addSubview:_defWebview];
    [_defWebview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(navView.mas_bottom);
        make.left.right.bottom.mas_equalTo(0);
    }];
}


#pragma mark - 切换Btn点击
- (void)chooseTypeBtnClicked:(UIButton *)btn {
    /*
     * 清除原有状态
     */
    for (UIButton *myBtn in navView.subviews) {
        if ([myBtn isKindOfClass:[UIButton class]]) {
            if (myBtn.tag == 1000 || myBtn.tag == 1001) {
                myBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(32)];
            }
        }
    }
    /*
     * 赋值新状态
     */
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:Scale750(36)];
    /*
     * 移动下划线
     */
    [botLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(btn);
        make.width.mas_equalTo(Scale750(80));
        make.height.mas_equalTo(Scale750(8));
    }];
    /*
     * 控制界面显示
     */
    if (btn.tag == 1000) {
        _scrollView.hidden = NO;
        _defWebview.hidden = YES;
    }else{
        _scrollView.hidden = YES;
        _defWebview.hidden = NO;
    }
}

#pragma mark - 接口请求
-(void)getHttpLoadData {
    [self.defWebview ug_loading];
    [[NetWorkRequest new]productproductInfo:_productid block:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
        [self.defWebview ug_hiddenLoading];
        if (error) {
            [self.view ug_msg:error.domain];
        }else{
            self.productdic = dataDict;
            ProductModel *temdata = [ProductModel yy_modelWithJSON:dataDict];
            [self reloadViewUIWith:temdata];
        }
    }];
}

#pragma mark - 刷新UI
- (void)reloadViewUIWith:(ProductModel *)data {
    //轮播图处理
    NSArray *bannerCount = [data.albumPics componentsSeparatedByString:@","];
    allStr = [NSString stringWithFormat:@"%lu", (unsigned long)bannerCount.count];
    NSString *numStr = @"1";
    NSString *tempStr = [NSString stringWithFormat:@"%@/%@", numStr, allStr];
    numLab.attributedText = [tempStr strChangFlagWithStr:numStr Color:[UIColor whiteColor] Font:Scale750(36)];
    [self->bannerView setImageURLStringsGroup:bannerCount];
    //
    
    
//    if (temdata.detailMobileHtml.length>0 ) {
//        [self->_defWebview loadHTMLString:temdata.detailMobileHtml baseURL:nil];
//    }else{
//        [self->_defWebview loadHTMLString:temdata.detailHtml baseURL:nil];
//    }
    
    
    self->_defWebview.backgroundColor = UIColor.ug_random;
}


#pragma mark - SDCycleScrollViewDelegate
//滚动到第几张图片的回调
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index {
    NSString *numStr = [NSString stringWithFormat:@"%ld", index+1];
    NSString *tempStr = [NSString stringWithFormat:@"%@/%@", numStr, allStr];
    numLab.attributedText = [tempStr strChangFlagWithStr:numStr Color:[UIColor whiteColor] Font:Scale750(36)];
}

@end
