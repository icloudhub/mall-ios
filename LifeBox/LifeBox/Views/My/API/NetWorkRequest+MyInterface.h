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

@end

NS_ASSUME_NONNULL_END
