//
//  UIView+UG.m
//  Nextcloud
//
//  Created by admin on 2019/3/12.
//  Copyright © 2019 TWS. All rights reserved.
//

#import "UIView+UG.h"

@implementation UIView (UG)

/**
 * 设置圆角
 */
-(void)ug_Radius:(CGFloat)radius{
    
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}
/**
 *
 */
-(void)ug_border:(UIColor*)color white:(CGFloat)width{
    
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
}

/**
 * 添加阴影
 */
-(void)ug_shadowColor:(UIColor *)acolor width:(CGFloat)width{
    
    self.layer.masksToBounds = NO;
    self.layer.shadowOpacity=0.3;///不透明度
    self.layer.shadowColor = acolor.CGColor;//阴影颜色
    self.layer.shadowRadius = width;//半径大小
    self.layer.shadowOffset = CGSizeZero; //设置偏移量为0,四周都有阴影
 
}

@end
