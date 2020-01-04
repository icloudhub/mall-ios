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

#pragma mark - 根据确认单编号返回确认订单信息
/// POST /order/getConfirmOrderInfo
/// @param confirmid 确认订单id
/// @param endblock 数据回调
- (void)getConfirmOrderInfo:(NSString *)confirmid endBlock:(void(^)(NSDictionary *result, NSError *error))endblock{
    NSString *url = [NSString stringWithFormat:@"%@/order/getConfirmOrderInfo", BASEURL];
    [self get:url param:@{
        @"confirmid":confirmid
    } head:nil endblock:endblock];
    
}
@end
