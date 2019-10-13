//
//  sheetView.m
//  sheet
//
//  Created by administrator on 15/8/20.
//  Copyright (c) 2015年 Weiqiang Gong. All rights reserved.
//

#import "BaseSheet.h"

@implementation BaseSheet{
    CGRect startRect;
    CGRect midRect;
}

- (NSInteger)viewHeight{
    return 100;
}

- (void)makeSubview{
    
}

- (instancetype)init{
    self = [super init];
    if (self) {
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor colorWithRed:51.0f/255 green:51.0f/255 blue:51.0f/255 alpha:0];
        _viewHeight = [self viewHeight];
        startRect = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, _viewHeight + 20);
        midRect = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - _viewHeight, [UIScreen mainScreen].bounds.size.width, _viewHeight);
        _bottomView = [[UIView alloc] initWithFrame:startRect];
        _bottomView.layer.cornerRadius = Scale750(30);
        _bottomView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_bottomView];
        self.hidden = YES;
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    CGPoint point = [[touches anyObject] locationInView:self];
    if (point.y <= CGRectGetMinY(_bottomView.frame)) {
        [self dismissView];
    }
}

- (void)showView{
    [self makeSubview];
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    window.backgroundColor = [UIColor clearColor];
    [window addSubview:self];
    [UIView animateWithDuration:0.3 animations:^{
        [self->_bottomView setFrame:self->midRect];
        self.backgroundColor = [UIColor colorWithRed:51.0f/255 green:51.0f/255 blue:51.0f/255 alpha:0.6f];
        self.hidden = NO;
    }];
}

- (void)showPickerView {
    [self makeSubview];
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    window.backgroundColor = [UIColor clearColor];
    [window addSubview:self];
    
    [UIView animateWithDuration:0.3 animations:^{
        [self->_bottomView setFrame:self->midRect];
        self.backgroundColor = [UIColor clearColor];
        self.hidden = NO;
    }];
}

- (void)dismissView{
    [UIView animateWithDuration:0.3 animations:^{
        [self->_bottomView setFrame:self->startRect];
        self.backgroundColor = [UIColor colorWithRed:51.0f/255 green:51.0f/255 blue:51.0f/255 alpha:0];
    } completion:^(BOOL finished) {
        self.hidden = YES;
        [self removeFromSuperview];
        if ([self->_delegete respondsToSelector:@selector(delloc)]) {
            [self->_delegete delloc];
        }
    }];
}

@end
