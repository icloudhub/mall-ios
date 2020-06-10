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

- (void)updateOrderAddress:(NSString *)orderId
         deliveryType:(NSString *)deliveryType
         receiverName:(NSString *)receiverName
        receiverPhone:(NSString *)receiverPhone
     receiverProvince:(NSString *)receiverProvince
         receiverCity:(NSString *)receiverCity
       receiverRegion:(NSString *)receiverRegion
receiverDetailAddress:(NSString *)receiverDetailAddress
                  endBlock:(void(^)(NSDictionary *result, NSError *error))endblock{
    
    NSString *url = [NSString stringWithFormat:@"%@/order/updateOrderAddress", BASEURL];
    [self post:url param:@{
        @"orderId":orderId,
        @"deliveryType":deliveryType,
        @"receiverName":receiverName,
        @"receiverPhone":receiverPhone,
        @"receiverProvince":receiverProvince,
        @"receiverCity":receiverCity,
        @"receiverRegion":receiverRegion,
        @"receiverDetailAddress":receiverDetailAddress
    } head:nil endblock:endblock];
}

/**
 获取提货码
 */
- (void)receiptCode:(NSString *)orderId  endBlock:(void(^)(NSDictionary *result, NSError *error))endblock{
    NSString *url = [NSString stringWithFormat:@"%@/order/receiptCode/%@", BASEURL,orderId];
     [self get:url param:@{
     } head:nil endblock:endblock];
}


/**
 获取店铺周围自提点
 */
- (void)listbyShopId:(NSString *)shopId  endBlock:(void(^)(NSDictionary *result, NSError *error))endblock{
    NSString *url = [NSString stringWithFormat:@"%@/station/listbyShopId", BASEURL];
    [self get:url param:@{
        @"shopId":shopId
    } head:nil endblock:endblock];
}
@end
