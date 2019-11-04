//
//  NetWorkRequest+Business.h
//  LifeBox
//
//  Created by Lucky on 2019/8/5.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NetWorkRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetWorkRequest (Business)

#pragma mark - 首页数据请求
///首页数据请求
- (void)getHomeInfoendblock:(void(^)(NSDictionary *result, NSError *error))endblock;

#pragma mark - 为你推荐数据
///为你推荐数据
- (void)recommendProductListblock:(void(^)(NSDictionary *result, NSError *error))endblock;


@end

NS_ASSUME_NONNULL_END
