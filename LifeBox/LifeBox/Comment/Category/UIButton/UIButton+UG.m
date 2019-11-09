//
//  UIButton+UG.m
//  LHCloud
//
//  Created by admin on 2019/5/9.
//  Copyright © 2019 admin. All rights reserved.
//

#import "UIButton+UG.h"

#define UGIMAGE(str) [UIImage imageNamed:str]
@implementation UIButton (UG)


/**
 * button 图片赋值/图片名称必须规范
 *  imagestr_Normal
 *  imagestr_Highlighted
 *  imagestr_Disabled
 *  imagestr_Selected
 *  imagestr_Focused
 *  imagestr_Application
 *  imagestr_Reserved
 */
-(void)ug_setImage:(NSString *)imagestr{
   
    UIImage *image = UGIMAGE(imagestr);
    if (!image) {
        return;
    }
    [self setImage:image forState:UIControlStateNormal];
    
    NSString *temstr = [imagestr stringByAppendingString:@"_highlighted"];
    image = UGIMAGE(temstr);
    if (image) {
        [self setImage:image forState:UIControlStateHighlighted];
    }
    
    temstr = [imagestr stringByAppendingString:@"_disabled"];
    image = UGIMAGE(temstr);
    if (image) {
        [self setImage:image forState:UIControlStateDisabled];
    }
    
    temstr = [imagestr stringByAppendingString:@"_selected"];
    image = UGIMAGE(temstr);
    if (image) {
        [self setImage:image forState:UIControlStateSelected];
    }
    
    temstr = [imagestr stringByAppendingString:@"_focused"];
    image = UGIMAGE(temstr);
    if (image) {
        [self setImage:image forState:UIControlStateFocused];
    }
    
    temstr = [imagestr stringByAppendingString:@"_application"];
    image = UGIMAGE(temstr);
    if (image) {
        [self setImage:image forState:UIControlStateApplication];
    }
    
    temstr = [imagestr stringByAppendingString:@"_reserved"];
    image = UGIMAGE(temstr);
    if (image) {
        [self setImage:image forState:UIControlStateReserved];
    }
}




@end
