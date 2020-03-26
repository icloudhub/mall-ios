//
//  NetWorkRequest+shop.h
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/21.
//  Copyright © 2020 admin. All rights reserved.
//


#import "NetWorkRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetWorkRequest (shop)

/**
 /seller/creat
 店铺申请
 */
-(void)shopCreat:(NSDictionary *)shopinfo block:(NREndBlock)endblock;

/**
 /seller/shopInfo
 店铺详情
 */
-(void)shopInfoblock:(NREndBlock)endblock;
@end

NS_ASSUME_NONNULL_END
