//
//  NSString+Convenient.h
//  LifeBox
//
//  Created by Lucky on 2019/8/28.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Convenient)

#pragma mark - 改变文字的大小颜色
/**
 * 根据文本给定的信息修改特定的文字的颜色、大小
 */
- (NSMutableAttributedString *)strChangFlagWithStr:(NSString *)passStr Color:(UIColor *)passColor Font:(CGFloat)passFont;

#pragma mark - 将字符串中间几位替换为*
/*
 * 将字符串中间几位替换为*
 */
-(NSString *)stringByReplacingAsteriskWithRange:(NSRange)range;

@end

NS_ASSUME_NONNULL_END
