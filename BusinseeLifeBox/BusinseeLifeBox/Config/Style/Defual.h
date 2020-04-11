//
//  Defual.h
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/17.
//  Copyright © 2020 admin. All rights reserved.
//

#ifndef Defual_h
#define Defual_h

#import "SafeAreaInsets.h"
/*
 * 常用方法
 */
#define UG_URL(str) [NSURL URLWithString:str]
#define UG_IMAGE(str) [UIImage imageNamed:str]
//弱引用
#define UG_WEAKSELF __weak typeof(self) weakSelf = self;


#define PATHDOCUMENT [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#pragma mark - 屏幕大小
/*
 * 屏幕大小
 */
#define KSheight   [[UIScreen mainScreen] bounds].size.height
#define KSwidth    [[UIScreen mainScreen] bounds].size.width
//间距
#define KPAND_DEF 15.0 //默认间距
#define KPAND_MID 10.0 //小间距
#define KPAND_MIN 5.0 //小间距

#define KRADIUS_DEF  20.0 //默认间距
#define KRADIUS_MID  10.0 //小间距
#define KRADIUS_MIN  4.0 //小间距



/*
 * 安全边界
 */
#define KSAFE_Bottom [SafeAreaInsets getSafeBottom]
#define KSAFE_Top [SafeAreaInsets getSafeTop]

#pragma mark - 控件尺寸换算
/*
 * 控件尺寸换算（设计图标注尺寸*(屏幕尺寸宽度/设计图尺寸图片宽度)）
 */
#define KAutoAcaleExtent(x,Actual,criterion) (x*(Actual/criterion))
#define KAutoAcale(x) (x*(KSwidth/320.0))
#define KAutoAcale640(x) (x*(KSwidth/640.0))
#define KAutoAcale720(x) (x*(KSwidth/720.0))
#define KAutoAcale750(x) (x*(KSwidth/750.0))

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

#endif /* Defual_h */
