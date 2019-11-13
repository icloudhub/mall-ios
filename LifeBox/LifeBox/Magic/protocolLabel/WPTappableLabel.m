//
//  WPTappableLabel.m
//  HLTddpay
//
//  Created by Han on 15/3/13.
//  Copyright (c) 2015年 yinxiangkai. All rights reserved.
//

#import "WPTappableLabel.h"

@implementation WPTappableLabel

-(void)setOnTap:(void (^)(CGPoint))onTap{
                
    _onTap = onTap;
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self addGestureRecognizer:tapGesture];
    self.userInteractionEnabled = YES;
}

-(void)tapped:(UITapGestureRecognizer *)gesture{
                
    if (gesture.state == UIGestureRecognizerStateRecognized) {
        CGPoint pt = [gesture locationInView:self];
        if (self.onTap) {
            self.onTap(pt);
        }
    }
}

@end

