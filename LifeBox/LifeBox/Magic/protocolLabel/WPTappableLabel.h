//
//  WPTappableLabel.h
//  HLTddpay
//
//  Created by Han on 15/3/13.
//  Copyright (c) 2015年 yinxiangkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WPTappableLabel : UILabel

@property (nonatomic, readwrite, copy) void (^onTap) (CGPoint);

@end

