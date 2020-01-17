//
//  OrderDefData.m
//  LifeBox
//
//  Created by admin on 2019/9/8.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "OrderDefData.h"



@implementation OrderDefData


+ (NSDictionary *)modelCustomPropertyMapper {

    return @{@"addressList" : @"memberReceiveAddressList",
             @"orderItemList" : @"orderItemList",
             @"amountdata" : @"calcAmount"};
}
//+ (NSDictionary *)modelContainerPropertyGenericClass {
//    return @{@"amountdata" : ConfirmInfoAmount.class,
//             @"addressList" : [ConfirmInfoaddress class]
//             };
//}


@end
