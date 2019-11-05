//
//  WebViewController.h
//  LifeBox
//
//  Created by xiaoqy on 2019/11/5.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface WebViewController : UIViewController
/*
 * wk webview
 */
@property(strong, nonatomic) WKWebView *webview;

/**
 *  要加载的url
 */
@property(strong, nonatomic) NSURL *url;

/**
*  要加载的内容
*/
@property(strong, nonatomic) NSString *htmlstr;

@end

NS_ASSUME_NONNULL_END
