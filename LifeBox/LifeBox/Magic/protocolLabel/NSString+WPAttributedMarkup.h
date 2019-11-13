//
//  NSString+WPAttributedMarkup.h
//  HLTddpay
//
//  Created by Han on 15/3/13.
//  Copyright (c) 2015年 yinxiangkai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WPAttributedMarkup)

-(NSAttributedString*)attributedStringWithStyleBook:(NSDictionary*)styleBook;
@end

