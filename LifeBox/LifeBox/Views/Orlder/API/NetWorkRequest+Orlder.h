//
//  NetWorkRequest+Orlder.h
//  LifeBox
//
//  Created by admin on 2019/9/7.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NetWorkRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetWorkRequest (Orlder)
/**
 POST /order/getConfirmOrderInfo
根据确认单编号返回确认订单信息
 */
-(void)getConfirmOrderInfo:(NSInteger)confirmid block:(NREndBlock)endblock;
@end

NS_ASSUME_NONNULL_END
