//
//  ConfirmOrderData.m
//  LifeBox
//
//  Created by admin on 2019/12/31.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "ConfirmOrderData.h"
@implementation  CalcAmountData

@end

@implementation ProductItemlist

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"products":@"product"
    };
}


@end
// 
@implementation ConfirmOrderData
//默认收货地址
//@property(strong, nonatomic) AddressData *defualaddress;
//
////价格
//@property(strong, nonatomic) CalcAmountData *calcAmountData;
//
////订单商品列表
//
//@property(strong, nonatomic) NSMutableArray<ProductModel*> *products;
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"calcAmountData": @"calcAmount",
             @"defualaddress":@"defualAddress",
             @"products":@"productItemlist"
    };
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
            @"productItemlist":[ProductItemlist class],
            };
}
@end
