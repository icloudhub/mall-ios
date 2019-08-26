//
//  NetWorkRequest+Goods.m
//  LifeBox
//
//  Created by admin on 2019/8/17.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NetWorkRequest+Goods.h"

@implementation NetWorkRequest (Goods)

-(void)productproductInfo:(NSInteger)productid block:(NREndBlock)endblock{
    NSString *url = [NSString stringWithFormat:@"%@/product/productInfo/%zd",BASEURL,productid];
    [self get:url param:@{} head:nil endblock:endblock];
}
@end
