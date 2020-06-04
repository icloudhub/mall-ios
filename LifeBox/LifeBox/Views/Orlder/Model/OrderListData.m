//
//  OrderListData.m
//  LifeBox
//
//  Created by admin on 2020/4/3.
//  Copyright © 2020 Lucky. All rights reserved.
//

#import "OrderListData.h"

@implementation OrderListData
-(NSString *)statusStr{
    // 订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
    switch ([_status intValue]) {
        case 0:
            return @"待付款";
            break;
        case 1:
            return @"待发货";
            break;
        case 2:
            return @"已发货";
            break;
        case 3:
            return @"已完成";
            break;
        case 4:
            return @"已关闭";
            break;
            
        default:
            return @"无效订单";
            break;
    }
}
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
