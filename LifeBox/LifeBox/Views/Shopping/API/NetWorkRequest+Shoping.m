//
//  NetWorkRequest+Shoping.m
//  LifeBox
//
//  Created by admin on 2019/8/17.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NetWorkRequest+Shoping.h"

@implementation NetWorkRequest (Shoping)

-(void)cartlistblock:(NREndBlock)endblock{
    
    NSString *url = [NSString stringWithFormat:@"%@/cart/list/product",BASEURL];
    [self get:url param:@{} head:nil endblock:endblock];
}

-(void)generateConfirmOrderblock:(NREndBlock)endblock{
    NSString *url = [NSString stringWithFormat:@"%@/order/generateConfirmOrder",BASEURL];
    [self post:url param:@{} head:nil endblock:endblock];
}

/**
 POST /order/confirmOrder
 生成确认订单记录
 type 状态 0->商品详情购买 1->购物车购买
 remark 下单列表 ','分割 商品详情是商品id+skuid 购物车是购物车id
 */
-(void)confirmOrdertype:(NSInteger)type remark:(NSString*)remark block:(NREndBlock)endblock{
    NSString *url = [NSString stringWithFormat:@"%@/order/confirmOrder",BASEURL];
    [self post:url param:@{
                           @"type":[NSNumber numberWithInteger:type],
                           @"remark":remark
                           } head:nil endblock:endblock];
}
@end

