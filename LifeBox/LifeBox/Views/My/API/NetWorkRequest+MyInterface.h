//
//  NetWorkRequest+MyInterface.h
//  LifeBox
//
//  Created by Lucky on 2019/12/5.
//  Copyright © 2019 Lucky. All rights reserved.
//
#import "NetWorkRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetWorkRequest (MyInterface)

#pragma mark - 查看收货地址列表接口
/// 查看收货地址列表接口
/// @param endblock 数据回调
- (void)getAddressListBlock:(void(^)(NSDictionary *result, NSError *error))endblock;

#pragma mark - 添加收货地址列表接口
/// 添加收货地址列表接口
/// @param params 入参
/// @param endblock 数据回调
- (void)addAddressParams:(NSDictionary *)params endBlock:(void(^)(NSDictionary *result, NSError *error))endblock;

#pragma mark - 删除收货地址列表接口
/// 删除收货地址列表接口
/// @param addressID 地址ID
/// @param endblock 数据回调
- (void)deleteAddressWithID:(NSInteger)addressID endBlock:(void(^)(NSDictionary *result, NSError *error))endblock;

#pragma mark - 修改收货地址列表接口
/// 修改收货地址列表接口
/// @param addressID 地址ID
/// @param params 入参
/// @param endblock 数据回调
- (void)updateAddressWithID:(NSInteger)addressID Params:(NSDictionary *)params endBlock:(void(^)(NSDictionary *result, NSError *error))endblock;

#pragma mark - 查询省市区信息
/// 查询省市区信息
/// @param params 区域ID参数
/// @param endblock 数据回调
- (void)queryAddressInfoParams:(NSDictionary *)params endBlock:(void(^)(NSDictionary *result, NSError *error))endblock;

#pragma mark - 根据订单号返回订单信息
/// POST /order/orderinfo
/// @param confirmid 确认订单id
/// @param endblock 数据回调
- (void)getOrderinfo:(NSString *)confirmid endBlock:(void(^)(NSDictionary *result, NSError *error))endblock;

#pragma mark -  根据配置类型获取配置参(获取支持的支付方式)
/// GET /cfg/getvalue
-(void)cfgGetvalueByType:(NSString *)type endBlock:(void(^)(NSDictionary *result, NSError *error))endblock;

#pragma mark -  根据确认信息生成支付订单
/// POST order/generatePayOrder
/**
 confirmid (integer, optional): 确认信息id ,
 couponId (integer, optional): 优惠券id ,
 memberReceiveAddressId (integer, optional): 收货地址id ,
 payType (integer, optional): 支付方式 按接口返回参数传递 ,
 useIntegration (integer, optional): 使用的积分数
 */
    
-(void)generatePayOrder:(NSString *)confirmid
               couponId:(NSString *)couponId
              addressId:(NSString *)addressId
                payType:(NSString *)payType
         useIntegration:(NSString *)useIntegration
               endBlock:(void(^)(NSDictionary *result, NSError *error))endblock;
@end

NS_ASSUME_NONNULL_END
