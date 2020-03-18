//
//  UIViewController+Routes.h
//  VideoHeadline
//
//  Created by admin on 2020/3/3.
//  Copyright © 2020 IgCoding. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Routes)

/*
 * 根据类名跳转
 */
-(void)routepush:(NSString *)key param:(NSDictionary *)param;

@end

NS_ASSUME_NONNULL_END
