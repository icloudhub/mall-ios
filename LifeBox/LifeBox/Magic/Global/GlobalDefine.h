//
//  GlobalDefine.h
//  LifeBox
//
//  Created by Lucky on 2019/8/2.
//  Copyright © 2019 Lucky. All rights reserved.
//

#ifndef GlobalDefine_h
#define GlobalDefine_h


#pragma mark - 同步安全线程
/*
 * 同步安全线程
 */
#define dispatch_main_sync_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}

#pragma mark - 异步安全线程
/*
 * 异步安全线程
 */
#define dispatch_main_async_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}

#pragma mark - 屏幕大小
/*
 * 屏幕大小
 */
#define Screen_height   [[UIScreen mainScreen] bounds].size.height
#define Screen_width    [[UIScreen mainScreen] bounds].size.width

#pragma mark - 控件尺寸换算
/*
 * 控件尺寸换算（设计图标注尺寸*(屏幕尺寸宽度/设计图尺寸图片宽度)）
 */
#define ScaleExtent(x,Actual,criterion) (x*(Actual/criterion))
#define Scale320(x) (x*(Screen_width/320.0))
#define Scale640(x) (x*(Screen_width/640.0))
#define Scale720(x) (x*(Screen_width/720.0))
#define Scale750(x) (x*(Screen_width/750.0))

#pragma mark - 颜色RGB
/*
 * 颜色RGB
 */
#define RGBColor(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

#pragma mark - 安全边界


/*
 * 常用方法
 */
#define UG_URL(str) [NSURL URLWithString:str]
#define UG_IMAGE(str) [UIImage imageNamed:str]

#endif /* GlobalDefine_h */
