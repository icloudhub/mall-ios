//
//  NetWorkRequest+shop.m
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/21.
//  Copyright © 2020 admin. All rights reserved.
//

#import "NetWorkRequest+shop.h"



@implementation NetWorkRequest (shop)

/**
 /seller/creat
 店铺申请
 */
-(void)shopCreat:(NSDictionary *)shopinfo block:(NREndBlock)endblock{
    NSString *url = [NSString stringWithFormat:@"%@/seller/creat",BASEURL];
    
    [self post:url param:shopinfo head:nil endblock:endblock];
}
/**
 /seller/shopInfo
 店铺详情
 */
-(void)shopInfoblock:(NREndBlock)endblock{
    NSString *url = [NSString stringWithFormat:@"%@/seller/shopInfo",BASEURL];
    [self get:url param:@{} head:nil endblock:endblock];
}

@end
