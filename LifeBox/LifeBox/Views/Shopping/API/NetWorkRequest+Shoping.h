//
//  NetWorkRequest+Shoping.h
//  LifeBox
//
//  Created by admin on 2019/8/17.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NetWorkRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetWorkRequest (Shoping)

-(void)cartlistblock:(NREndBlock)endblock;

/**
 POST /order/generateConfirmOrder
 根据购物车信息生成确认单信息
 */
-(void)generateConfirmOrderblock:(NREndBlock)endblock;

/**
 POST /order/confirmOrder
 生成确认订单记录
 type 状态 0->商品详情购买 1->购物车购买
 remark 下单列表 ','分割 商品详情是商品id+skuid 购物车是购物车id
 */
-(void)confirmOrdertype:(NSInteger)type remark:(NSString*)remark block:(NREndBlock)endblock;
@end

NS_ASSUME_NONNULL_END
