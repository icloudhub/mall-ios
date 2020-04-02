//
//  NetWorkRequest+Home.m
//  BusinseeLifeBox
//
//  Created by admin on 2020/4/2.
//  Copyright © 2020 admin. All rights reserved.
//

#import "NetWorkRequest+Home.h"


@implementation NetWorkRequest (Home)
/**
 /seller/shopHomeDate
查询卖家app首页信息
 */
-(void)shopHomeDateBlock:(NREndBlock)endblock{
    NSString *url = [NSString stringWithFormat:@"%@/seller/shopHomeDate",BASEURL];
    [self get:url param:@{} head:nil endblock:endblock];
}
@end
