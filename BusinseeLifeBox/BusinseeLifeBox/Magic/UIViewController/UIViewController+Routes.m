//
//  UIViewController+Routes.m
//  VideoHeadline
//
//  Created by admin on 2020/3/3.
//  Copyright © 2020 IgCoding. All rights reserved.
//

#import "UIViewController+Routes.h"

@implementation UIViewController (Routes)

/*
 * 根据类名跳转
 */
-(void)routepush:(NSString *)key param:(NSDictionary *)param{
    if(!key){
        DDLogDebug(@"路由跳转key不可以为空");
        return;
    }
    Class cls = NSClassFromString(key);
    UIViewController *viewcontroller =  [cls new];
    [viewcontroller modelSetWithDictionary:param];
    [self.navigationController pushViewController:viewcontroller animated:YES];
}


@end
