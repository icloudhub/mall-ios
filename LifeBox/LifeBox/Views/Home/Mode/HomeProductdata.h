//
//  HomeProductdata.h
//  LifeBox
//
//  Created by admin on 2019/9/9.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeProductdata : NSObject

///商品ID
@property(assign, nonatomic) CGFloat id;
///商品展示图片
@property (strong, nonatomic) NSString *pic;
///商品名称
@property (strong, nonatomic) NSString *name;
///商品副标题
@property (strong, nonatomic) NSString *subTitle;
///商品价格
@property (strong, nonatomic) NSString *price;

@end

NS_ASSUME_NONNULL_END
