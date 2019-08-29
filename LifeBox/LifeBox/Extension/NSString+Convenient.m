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

@end
