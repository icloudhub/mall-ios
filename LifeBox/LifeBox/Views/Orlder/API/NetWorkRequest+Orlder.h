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


*/

#pragma mark - 根据订单号，支付方式生成支付信息
/** POST /order/payInfo
orderId (integer, optional): 订单id ,
payType (integer, optional): 支付方式
 */
- (void)payInfo:(NSString *)orderId payType:(NSString *)payType endBlock:(void(^)(NSDictionary *result, NSError *error))endblock;

- (void)updateOrderAddress:(NSString *)orderId addressId:(NSString *)addressId endBlock:(void(^)(NSDictionary *result, NSError *error))endblock;

@end

NS_ASSUME_NONNULL_END
