//
//  NSArray+UG.h
//  LifeBox
//
//  Created by admin on 2020/4/2.
//  Copyright © 2020 Lucky. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (UG)

/**
 判断两个数组中元素是否一致，不管顺序
 */
-(BOOL)isEqualItem:(NSArray*)array;
@end

NS_ASSUME_NONNULL_END
