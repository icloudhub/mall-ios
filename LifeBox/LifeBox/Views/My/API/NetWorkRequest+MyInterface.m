//
//  NetWorkRequest+MyInterface.m
//  LifeBox
//
//  Created by Lucky on 2019/12/5.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NetWorkRequest+MyInterface.h"

@implementation NetWorkRequest (MyInterface)

#pragma mark - 查看收货地址列表接口
- (void)getAddressListBlock:(void(^)(NSDictionary *result, NSError *error))endblock {
    NSString *url = [NSString stringWithFormat:@"%@/member/address/list", BASEURL];
    [self get:url param:nil head:nil endblock:endblock];
}

#pragma mark - 添加收货地址列表接口
- (void)addAddressParams:(NSDictionary *)params endBlock:(void(^)(NSDictionary *result, NSError *error))endblock {
    NSString *url = [NSString stringWithFormat:@"%@/member/address/add", BASEURL];
    [self post:url param:params head:nil endblock:endblock];
}

#pragma mark - 删除收货地址列表接口
- (void)deleteAddressWithID:(NSInteger)addressID endBlock:(void(^)(NSDictionary *result, NSError *error))endblock {
    NSString *url = [NSString stringWithFormat:@"%@/member/address/delete/%ld", BASEURL, addressID];
    [self post:url param:nil head:nil endblock:endblock];
}

#pragma mark - 修改收货地址列表接口
- (void)updateAddressWithID:(NSInteger)addressID Params:(NSDictionary *)params endBlock:(void(^)(NSDictionary *result, NSError *error))endblock {
    NSString *url = [NSString stringWithFormat:@"%@/member/address/update/%ld", BASEURL, (long)addressID];
    [self post:url param:params head:nil endblock:endblock];
}

#pragma mark - 查询省市区信息
- (void)queryAddressInfoParams:(NSDictionary *)params endBlock:(void(^)(NSDictionary *result, NSError *error))endblock {
    NSString *url = [NSString stringWithFormat:@"%@/cnarea/list", BASEURL];
    [self get:url param:params head:nil endblock:endblock];
}

#pragma mark - 根据订单号返回订单信息
/// POST /order/orderinfo
/// @param confirmid 确认订单id
/// @param endblock 数据回调
- (void)getOrderinfo:(NSString *)confirmid endBlock:(void(^)(NSDictionary *result, NSError *error))endblock{
    NSString *url = [NSString stringWithFormat:@"%@/order/orderinfo", BASEURL];
    [self get:url param:@{
        @"orderId":confirmid
    } head:nil endblock:endblock];
    
}

#pragma mark -  根据配置类型获取配置参(获取支持的支付方式)
/// GET /cfg/getvalue
-(void)cfgGetvalueByType:(NSString *)type endBlock:(void(^)(NSDictionary *result, NSError *error))endblock{
    
    NSString *url = [NSString stringWithFormat:@"%@/cfg/getvalue", BASEURL];
      [self get:url param:@{
          @"typeid":type
      } head:nil endblock:endblock];
}

#pragma mark -  根据确认信息生成支付订单
/// POST order/generatePayOrder
-(void)generatePayOrder:(NSString *)confirmid
      couponId:(NSString *)couponId
     addressId:(NSString *)addressId
       payType:(NSString *)payType
useIntegration:(NSString *)useIntegration
               endBlock:(void(^)(NSDictionary *result, NSError *error))endblock{
    NSString *url = [NSString stringWithFormat:@"%@/order/generatePayOrder", BASEURL];
       [self post:url param:@{
           @"confirmid":confirmid,
           @"couponId":couponId,
           @"memberReceiveAddressId":addressId,
           @"payType":payType,
           @"useIntegration":useIntegration
       } head:nil endblock:endblock];
    
}
@end
