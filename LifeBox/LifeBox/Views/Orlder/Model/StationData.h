//
//  StationData.h
//  LifeBox
//
//  Created by admin on 2020/6/11.
//  Copyright © 2020 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StationData : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) NSString *province;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *region;
@property (strong, nonatomic) NSString *detailAddress;
@end

NS_ASSUME_NONNULL_END
