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
    
    NSString *url = [NSString stringWithFormat:@"%@/cart/list",BASEURL];
    [self get:url param:@{} head:nil endblock:endblock];
}
@end

