//
//  HomeData.m
//  LifeBox
//
//  Created by Lucky on 2019/11/4.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "HomeData.h"


@implementation HomeData

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"toolArr" : @"brandList",
             @"bannerArr" : @"advertiseList",
             @"notiArr" : @"subjectList",
    };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"toolArr":[HomeToolData class],
             @"bannerArr":[HomeBannerData class],
             @"notiArr":[HomeNotiData class]
             };
}

@end


@implementation HomeToolData


@end


@implementation HomeBannerData


@end

@implementation HomeNotiData


@end


