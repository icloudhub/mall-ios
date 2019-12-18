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


@end
