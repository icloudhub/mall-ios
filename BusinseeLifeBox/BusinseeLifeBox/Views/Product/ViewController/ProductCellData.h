//
//  ProductCellData.h
//  BusinseeLifeBox
//
//  Created by admin on 2020/4/27.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductCellData : NSObject

@property(strong, nonatomic) NSString *type;//类型

@property(strong, nonatomic) NSString *content;//文字内容

@property(readonly, nonatomic) NSString *html;//html内容

@end

NS_ASSUME_NONNULL_END
