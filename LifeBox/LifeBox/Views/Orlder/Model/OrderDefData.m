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

-(NSString *)deliveryTypeStr{
    //'物流类型：0->物流配送；1->买家上门自提；2->买家自提点自提；3->骑手派送',
    switch (_deliveryType) {
        case 0:
            return @"物流配送";
            break;
        case 1:
            return @"到店自提";
            break;
        case 2:
            return @"自提点自提";
            break;
        case 3:
            return @"骑手派送";
            break;
            
        default:
            return @"-";
            break;
    }
}
@end
