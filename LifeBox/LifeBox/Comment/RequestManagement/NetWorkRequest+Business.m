//
//  NetWorkRequest+Business.m
//  LifeBox
//
//  Created by Lucky on 2019/8/5.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NetWorkRequest+Business.h"

@implementation NetWorkRequest (Business)

#pragma mark - 首页数据请求
- (void)getHomeInfoendblock:(void(^)(NSDictionary *result, NSError *error))endblock{
    
    NSString *url = [NSString stringWithFormat:@"%@/home/content",BASEURL];
    [self get:url param:nil head:nil endblock:endblock];
}

#pragma mark - 首页推荐接口
- (void)recommendProductListblock:(void(^)(NSDictionary *result, NSError *error))endblock{
    NSString *url = [NSString stringWithFormat:@"%@/home/recommendProductList",BASEURL];
    [self get:url param:nil head:nil endblock:endblock];
    
}

@end
