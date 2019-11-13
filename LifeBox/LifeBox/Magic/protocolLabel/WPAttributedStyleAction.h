//
//  WPAttributedStyleAction.h
//  HLTddpay
//
//  Created by Han on 15/3/13.
//  Copyright (c) 2015年 yinxiangkai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPAttributedStyleAction : NSObject

@property (readwrite, copy) void (^action) ();

- (instancetype)initWithAction:(void (^)())action;
+(NSArray*)styledActionWithAction:(void (^)())action;
-(NSArray*)styledAction;


@end
