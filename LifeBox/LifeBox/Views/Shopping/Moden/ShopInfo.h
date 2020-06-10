//
//  ShopInfo.h
//  LifeBox
//
//  Created by admin on 2020/6/10.
//  Copyright © 2020 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShopInfo : NSObject
@property(strong, nonatomic) NSString* id;
@property(strong, nonatomic) NSString* mobile;
@property(strong, nonatomic) NSString* city;
@property(strong, nonatomic) NSString* district;
@property(strong, nonatomic) NSString* address;
@property(strong, nonatomic) NSString* name;
@property(strong, nonatomic) NSString* province;
@end

NS_ASSUME_NONNULL_END
