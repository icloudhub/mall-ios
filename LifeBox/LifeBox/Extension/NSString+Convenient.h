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

#pragma mark - 判断输入的内容是否有空格
- (BOOL)spaceJudgment;

#pragma mark - 判断string是否为全数字
- (BOOL)isPureInt;

#pragma mark - 正则匹配用户密码8-20位数字和字母组合
- (BOOL)checkPassword;

@end

NS_ASSUME_NONNULL_END
