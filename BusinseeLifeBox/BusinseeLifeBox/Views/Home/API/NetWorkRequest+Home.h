//
//  NetWorkRequest+Home.h
//  BusinseeLifeBox
//
//  Created by admin on 2020/4/2.
//  Copyright © 2020 admin. All rights reserved.
//


#import "NetWorkRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetWorkRequest (Home)

/**
 /seller/shopHomeDate
查询卖家app首页信息
 */
-(void)shopHomeDateBlock:(NREndBlock)endblock;
@end

NS_ASSUME_NONNULL_END
