//
//  WPAttributedStyleAction.m
//  HLTddpay
//
//  Created by Han on 15/3/13.
//  Copyright (c) 2015年 yinxiangkai. All rights reserved.
//

#import "WPAttributedStyleAction.h"

NSString* kWPAttributedStyleAction = @"WPAttributedStyleAction";

@implementation WPAttributedStyleAction

- (instancetype)initWithAction:(void (^)())action{
                
    self = [super init];
    if (self) {
        self.action = action;
    }
    return self;
}

+(NSArray*)styledActionWithAction:(void (^)())action{
                
    WPAttributedStyleAction* container = [[WPAttributedStyleAction alloc] initWithAction:action];
    return [container styledAction];
}

-(NSArray*)styledAction{
                
    return @[ @{kWPAttributedStyleAction:self}, @"link"];
}

@end


