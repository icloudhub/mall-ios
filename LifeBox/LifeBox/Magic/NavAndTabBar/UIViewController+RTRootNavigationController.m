// Copyright (c) 2016 rickytan <ricky.tan.xin@gmail.com>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE. 

#import <objc/runtime.h>

#import "UIViewController+RTRootNavigationController.h"
#import "RTRootNavigationController.h"

@implementation UIViewController (RTRootNavigationController)
@dynamic rt_disableInteractivePop;

- (void)setRt_disableInteractivePop:(BOOL)rt_disableInteractivePop
{
    objc_setAssociatedObject(self, @selector(rt_disableInteractivePop), @(rt_disableInteractivePop), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)rt_disableInteractivePop
{
    return [objc_getAssociatedObject(self, @selector(rt_disableInteractivePop)) boolValue];
}

- (Class)rt_navigationBarClass
{
    return nil;
}

- (RTRootNavigationController *)rt_navigationController
{
    UIViewController *vc = self;
    while (vc && ![vc isKindOfClass:[RTRootNavigationController class]]) {
        vc = vc.navigationController;
    }
    return (RTRootNavigationController *)vc;
}

//设置正常navi
- (void)setWhiteNaviWithTitle:(NSString *)titleStr{
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    /*
     * 导航栏返回Btn
     */
    UIButton *itemButtom = [UIButton  buttonWithType:UIButtonTypeCustom];
    [itemButtom setFrame:CGRectMake(0, 0, 30, 40)];
    [itemButtom setImage:[UIImage imageNamed:@"ic_return"] forState:UIControlStateNormal];
    [itemButtom addTarget:self action:@selector(leftBarButtonItemClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *button = [[UIBarButtonItem alloc]
                               initWithCustomView:itemButtom];
    [self.navigationItem setLeftBarButtonItems:@[button]];
    /*
     * 导航栏字体
     */
//    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 44)];
//    UILabel * titleLabel = [[UILabel alloc] init];
////    WithFrame:CGRectMake((Screen_width - 200)/2, 0, 200, 44)
//    titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
//    titleLabel.textAlignment = NSTextAlignmentCenter;
//    CGRect leftViewbounds = self.navigationItem.leftBarButtonItem.customView.bounds;
//    CGRect rightViewbounds = self.navigationItem.rightBarButtonItem.customView.bounds;
//    CGFloat maxWidth = leftViewbounds.size.width > rightViewbounds.size.width ? leftViewbounds.size.width : rightViewbounds.size.width;
//    //leftview 左右都有间隙，左边是5像素，右边是8像素，加2个像素的阀值 5 ＋ 8 ＋ 2
//    maxWidth += 15;
//    [titleLabel setFrame:CGRectMake(0, 0, Screen_width - maxWidth, 44)];
//    titleLabel.textColor = [UIColor whiteColor];
////    titleLabel.font = [UIFont FiraSansBoldWithSize:20];
//    titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
//    titleLabel.text = titleStr;
//    [backView addSubview:titleLabel];
//    self.navigationItem.titleView = backView;
    self.title = titleStr;
    //设置navi的title颜色为黑色
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, [UIFont fontWithName:@"Helvetica-Bold" size:18], NSFontAttributeName, nil];
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
    /*
     * 导航栏背景
     */
    UIImage *temBackImage = [UIImage imageNamed:@"navBackImage"];
    UIImage *backgroundImage = [temBackImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeStretch];
    [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    UIColor *backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setBackgroundColor:backgroundColor];
    [self.navigationItem.titleView setFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width-self.navigationItem.leftBarButtonItem.width-self.navigationItem.rightBarButtonItem.width, 44)];
}

- (void)leftBarButtonItemClick {
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
