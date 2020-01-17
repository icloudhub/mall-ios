//
//  NetWorkRequest+Orlder.m
//  LifeBox
//
//  Created by admin on 2019/9/7.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NetWorkRequest+Orlder.h"

@implementation NetWorkRequest (Orlder)
- (void)payInfo:(NSString *)orderId payType:(NSString *)payType endBlock:(void(^)(NSDictionary *result, NSError *error))endblock{
    
    NSString *url = [NSString stringWithFormat:@"%@/order/payInfo", BASEURL];
    [self post:url param:@{
        @"orderId":orderId,
        @"payType":payType
    } head:nil endblock:endblock];
}

- (void)updateOrderAddress:(NSString *)orderId addressId:(NSString *)addressId endBlock:(void(^)(NSDictionary *result, NSError *error))endblock{
    
   NSString *url = [NSString stringWithFormat:@"%@/order/updateOrderAddress", BASEURL];
    [self post:url param:@{
        @"orderId":orderId,
        @"addressId":addressId
    } head:nil endblock:endblock];
}
@end
