//
//  HomeToolData.h
//  LifeBox
//
//  Created by Lucky on 2019/8/27.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeToolData : NSObject

#pragma mark - 属性
///首页功能图片
@property (strong, nonatomic) NSString *toolImg;

///首页功能名称
@property (strong, nonatomic) NSString *toolName;

@end

NS_ASSUME_NONNULL_END
