//
//  NetWorkRequest+Orlder.m
//  LifeBox
//
//  Created by admin on 2019/9/7.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NetWorkRequest+Orlder.h"

@implementation NetWorkRequest (Orlder)
/**
 POST /order/getConfirmOrderInfo
 根据确认单编号返回确认订单信息
 */
-(void)getConfirmOrderInfo:(NSInteger)confirmid block:(NREndBlock)endblock{
    NSString *url = [NSString stringWithFormat:@"%@/order/getConfirmOrderInfo",BASEURL];
    [self post:url param:@{
                           @"confirmid":[NSString stringWithFormat:@"%zd",confirmid]
                           } head:nil endblock:endblock];
}
@end
