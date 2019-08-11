//
//  UIApplication+DORConfig.m
//  LifeBox
//
//  Created by admin on 2019/8/11.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "UIApplication+DORConfig.h"
#ifdef DEBUG
#import <DoraemonKit/DoraemonManager.h>
#endif

@implementation UIApplication (DORConfig)

#ifdef DEBUG
-(void)configDor{

    [[DoraemonManager shareInstance] install];

}
#endif
@end
