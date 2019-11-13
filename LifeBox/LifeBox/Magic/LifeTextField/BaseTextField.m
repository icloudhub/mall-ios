//
//  BaseTextField.m
//  LifeBox
//
//  Created by Lucky on 2019/11/12.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "BaseTextField.h"

@implementation BaseTextField

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - 代理
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return NO;
}


@end
