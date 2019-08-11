//
//  UIApplication+DORConfig.h
//  LifeBox
//
//  Created by admin on 2019/8/11.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (DORConfig)
#ifdef DEBUG
-(void)configDor;
#endif
@end

NS_ASSUME_NONNULL_END
