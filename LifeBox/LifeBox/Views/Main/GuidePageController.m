//
//  GuidePageController.m
//  LifeBox
//
//  Created by Lucky on 2020/1/9.
//  Copyright © 2020 Lucky. All rights reserved.
//

#import "GuidePageController.h"

@interface GuidePageController ()<UIScrollViewDelegate> {
    ///图片数组
    NSArray *imgArr;
}

@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) UIButton *sureBtn;

@end

@implementation GuidePageController

- (UIButton *)sureBtn {
    _sureBtn = [[UIButton alloc] init];
    return _sureBtn;
}

#pragma mark - 视图层
- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     * 数据初始化
     */
    imgArr = [NSArray arrayWithObjects:@"GuideViewOne", @"GuideViewTwo", @"GuideViewThr", nil];
    /*
     * 创建UI
     */
    [self createUI];
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 可滚动区域
     */
    _scrollView = [[UIScrollView alloc] init];
    [_scrollView setPagingEnabled:YES];
    _scrollView.delegate = self;
    _scrollView.bounces = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    for (int num = 0; num < imgArr.count; num++) {
        UIImageView *myImg = [[UIImageView alloc] initWithFrame:CGRectMake(num *Screen_width, 0, Screen_width, Screen_height)];
        myImg.image = [UIImage imageNamed:[imgArr objectAtIndex:num]];
        myImg.contentMode = UIViewContentModeScaleAspectFit;
        [_scrollView addSubview:myImg];
    }
    _scrollView.contentSize = CGSizeMake(Screen_width * imgArr.count, Screen_height);
    /*
     * 确认按钮
     */
    _sureBtn = [[UIButton alloc] init];
    _sureBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(28)];
    [_sureBtn setTitle:@"立即体验" forState:UIControlStateNormal];
    [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _sureBtn.backgroundColor = S_COGreenBack;
    _sureBtn.layer.cornerRadius = Scale750(40);
    _sureBtn.hidden = YES;
    [_sureBtn addTarget:self action:@selector(sureBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_sureBtn];
    [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->_scrollView);
        make.bottom.mas_equalTo(self.view.mas_bottom).mas_offset(-Scale750(150));
        make.width.mas_equalTo(Scale750(200));
        make.height.mas_equalTo(Scale750(80));
    }];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger page = _scrollView.contentOffset.x/_scrollView.frame.size.width;
    if (page == imgArr.count - 1) {
        _sureBtn.hidden = NO;
    }else{
        _sureBtn.hidden = YES;
    }
}

#pragma mark - 确认按钮点击
- (void)sureBtnClicked {
    [[NSUserDefaults standardUserDefaults] setObject:@"firstApp" forKey:@"firstApp"];
    [UIApplication markWindownRootVC];
}


@end
