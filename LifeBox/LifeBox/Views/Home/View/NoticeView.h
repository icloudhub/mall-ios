//
//  NoticeView.h
//  LifeBox
//
//  Created by Lucky on 2019/8/26.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NoticeView : UIView

@property(strong, nonatomic) UILabel *noticeLab;

//刷新数据
-(void)reload:(NSArray*)arr;

@end

NS_ASSUME_NONNULL_END
