//
//  NetWorkRequest+Orlder.h
//  LifeBox
//
//  Created by admin on 2019/9/7.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NetWorkRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetWorkRequest (Orlder)
/**
 * POST /order/getConfirmOrderInfo
 * 根据确认单编号返回确认订单信息
 */
-(void)getConfirmOrderInfo:(NSInteger)confirmid block:(NREndBlock)endblock;

/**
 * POST /order/generatePayOrder
 * 根据确认信息生成支付订单
 */
-(void)generatePayOrder:(NSInteger)confirmid
                  couponId:(NSInteger)couponId
                  memberReceiveAddressId:(NSInteger)memberReceiveAddressId
             useIntegration:(NSInteger)useIntegration
                     block:(NREndBlock)endblock;
@end

NS_ASSUME_NONNULL_END
