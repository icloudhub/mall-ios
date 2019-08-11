//
//  LifeBoxViewController.h
//  LifeBox
//
//  Created by Lucky on 2019/8/2.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetWorkRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface LifeBoxViewController : UIViewController

#pragma mark - 属性
/**
 * 网络请求
 */
@property (strong, nonatomic) NetWorkRequest *request;

@end

NS_ASSUME_NONNULL_END
