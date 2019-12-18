//
//  NSString+Convenient.m
//  LifeBox
//
//  Created by Lucky on 2019/8/28.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NSString+Convenient.h"

@implementation NSString (Convenient)

#pragma mark - 改变文字的大小颜色
/**
 * 根据文本给定的信息修改特定的文字的颜色、大小
 */
- (NSMutableAttributedString *)strChangFlagWithStr:(NSString *)passStr Color:(UIColor *)passColor Font:(CGFloat)passFont {
    
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:self];
    if (passStr.length > 0) {
        NSRange searchRang=[self rangeOfString:passStr];
        if (searchRang.length > 0){
            [attributeStr addAttribute:NSForegroundColorAttributeName value:passColor range:searchRang];
            [attributeStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue" size:passFont] range:searchRang];
        }
    }
    return attributeStr;
}

#pragma mark - 将字符串中间几位替换为*
/*
 * 将字符串中间几位替换为*
 */
-(NSString *)stringByReplacingAsteriskWithRange:(NSRange)range {
                
    
    NSMutableString *temp = [[NSMutableString alloc]initWithCapacity:25];
    for (NSUInteger i = range.location; i < range.location+range.length; i++) {
        [temp appendString:@"*"];
    }
    if(self.length==0)
    {
        return nil;
    }
    NSMutableString *theNewStr=[[NSMutableString alloc] initWithString:self];
    [theNewStr replaceCharactersInRange:range withString:temp];
    return theNewStr;
}

#pragma mark - 判断输入的内容是否有空格
- (BOOL)spaceJudgment {
    if([self rangeOfString:@" "].location != NSNotFound) {
        return YES;
    }
    return NO;
}

#pragma mark - 判断string是否为全数字
- (BOOL)isPureInt {
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

#pragma mark - 正则匹配用户密码8-20位数字和字母组合
- (BOOL)checkPassword {
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

#pragma mark - 输入完成后判断是纯中文
- (BOOL)inputToCompletejudgePureChinese {
    NSString *nameRegex = @"^[\\u4e00-\\u9fa5]+$";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    return [nameTest evaluateWithObject:self];
}


@end
