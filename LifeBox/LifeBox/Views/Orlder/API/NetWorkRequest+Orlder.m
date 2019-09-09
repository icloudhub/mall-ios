//
//  NetWorkRequest+Orlder.m
//  LifeBox
//
//  Created by admin on 2019/9/7.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NetWorkRequest+Orlder.h"

@implementation NetWorkRequest (Orlder)
/**
 POST /order/getConfirmOrderInfo
 根据确认单编号返回确认订单信息
 */
-(void)getConfirmOrderInfo:(NSInteger)confirmid block:(NREndBlock)endblock{
    NSString *url = [NSString stringWithFormat:@"%@/order/getConfirmOrderInfo",BASEURL];
    [self post:url param:@{
                           @"confirmid":[NSString stringWithFormat:@"%zd",confirmid]
                           } head:nil endblock:endblock];
}

/**
 * POST /order/generatePayOrder
 * 根据确认信息生成支付订单
 */
-(void)generatePayOrder:(NSInteger)confirmid
                  couponId:(NSInteger)couponId
    memberReceiveAddressId:(NSInteger)memberReceiveAddressId
            useIntegration:(NSInteger)useIntegration
                     block:(NREndBlock)endblock{
    NSString *url = [NSString stringWithFormat:@"%@/order/generatePayOrder",BASEURL];
    NSMutableDictionary *parmdic = [[NSMutableDictionary alloc]initWithDictionary:@{
                                                                                    @"confirmId":[NSString stringWithFormat:@"%zd",confirmid],           @"addressId":[NSString stringWithFormat:@"%zd",memberReceiveAddressId],
                                                                                    @"useIntegration":[NSString stringWithFormat:@"%zd",useIntegration]
                                                                                    }];
//    if (couponId>0) {
        [parmdic setObject:[NSString stringWithFormat:@"%zd",couponId] forKey:@"couponId"];
//    }
    [self post:url param:parmdic head:nil endblock:endblock];
}
@end
