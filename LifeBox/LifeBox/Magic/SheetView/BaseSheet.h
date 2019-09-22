//
//  sheetView.h
//  sheet
//
//  Created by administrator on 15/8/20.
//  Copyright (c) 2015年 Weiqiang Gong. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol BaseSheetDelegete <NSObject>
/*
 *页面消失消失后事件
 *
 */
-(void)delloc;

@end

@interface BaseSheet : UIView

@property (nonatomic,strong) UIView *bottomView;

@property (nonatomic,assign) NSInteger viewHeight;

@property (nonatomic,weak) id<BaseSheetDelegete>delegete;

//高度
- (NSInteger)viewHeight;//继承该类的时候，重写该方法，返回你需要的高度

/*
 *界面自定义
 *布局：[self.bottomView addSubView: xxx];
 */
- (void)makeSubview;//继承该类的时候，重写该方法，返回你需要的自定义布局

/*
 *使用：BaseSheet *sheet = [[BaseSheet alloc] init];
 *     [sheet showView];
 */
//显示sheet
- (void)showView;

/**使用：BaseSheet *sheet = [[BaseSheet alloc] init];
 [sheet showPickerView];
 */
//是pickerView类型显示方式
- (void)showPickerView;

//消失sheet
- (void)dismissView;
@end
