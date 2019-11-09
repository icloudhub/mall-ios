//
//  Style.h
//  LifeBox
//
//  Created by admin on 2019/8/16.
//  Copyright © 2019 Lucky. All rights reserved.
//

#ifndef Style_h
#define Style_h

//弱引用
#define UG_WEAKSELF __weak typeof(self) weakSelf = self;


// 圆角
#define S_Radius 5 //默认圆角

//间距
#define SPanding_DEF 15 //默认间距
#define SPanding_MID 10 //小间距
#define SPanding_MIN 5 //小间距

#define S_TFheight 15 //默认边距
#define S_Line 0.5 //默认边距

/*
 * 安全边界
 */
#define SAFE_Bottom [SafeAreaInsets getSafeBottom]
#define SAFE_Top [SafeAreaInsets getSafeTop]


// 字符长度
#define S_UserName 16 //用户名
#define S_Phone 11 //用户名
#define S_Password 16 //用户名
#define S_CerCode 6 //用户名

#define FONT_BSYS24 [UIFont boldSystemFontOfSize:24]
#define FONT_BSYS20 [UIFont boldSystemFontOfSize:20]
#define FONT_BSYS18 [UIFont boldSystemFontOfSize:18]
#define FONT_BSYS16 [UIFont boldSystemFontOfSize:16]
#define FONT_BSYS14 [UIFont boldSystemFontOfSize:14]
#define FONT_BSYS12 [UIFont boldSystemFontOfSize:12]
#define FONT_BSYS10 [UIFont boldSystemFontOfSize:10]

#define FONT_SYS20 [UIFont systemFontOfSize:20]
#define FONT_SYS18 [UIFont systemFontOfSize:18]
#define FONT_SYS16 [UIFont systemFontOfSize:16]
#define FONT_SYS14 [UIFont systemFontOfSize:14]
#define FONT_SYS12 [UIFont systemFontOfSize:12]
#define FONT_SYS10 [UIFont systemFontOfSize:10]

//颜色
#define COLOREE [UIColor ug_hexString:@"#eeeeee"] //线颜色
#define COLOR23 [UIColor ug_hexString:@"#232323"] 

///页面背景色
#define S_COBackground RGBColor(245, 245, 245)
///红色字体颜色
#define S_CORedText RGBColor(232, 62, 49)
///绿色背景
#define S_COGreenBack RGBColor(111, 190, 139)
///绿色字体
#define S_COGreenText RGBColor(111, 190, 139)
///绿色不可点击背景
#define S_COGreenBackNoClick RGBColor(181, 213, 189)

/*
 * 通知的全局Key
 */
///时间倒计时
#define APPTIMEINFORMATION     @"APPTIMEINFORMATION"

#endif /* Style_h */
