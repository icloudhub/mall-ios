//
//  CardItem.m
//  LifeBox
//
//  Created by admin on 2019/9/6.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "CardItem.h"
@implementation CardItemProduct

@end
@implementation CardItemSKU

@end
@implementation CardItem

-(NSString *)spstr{
    NSMutableString *temstr = [NSMutableString new];
    if (self.pmsSkuStock.sp1) {
        [temstr appendString:self.pmsSkuStock.sp1];
    }
    if (self.pmsSkuStock.sp2) {
        if (temstr.length>0) {
             [temstr appendString:@"/"];
        }
        [temstr appendString:self.pmsSkuStock.sp2];
    }
    if (self.pmsSkuStock.sp3) {
        if (temstr.length>0) {
            [temstr appendString:@"/"];
        }
        [temstr appendString:self.pmsSkuStock.sp3];
    }
    return temstr;
}
-(NSString *)icon{
    if (self.pmsSkuStock.pic) {
        return self.pmsSkuStock.pic;
    }else{
        return [self.pmsProduct.pic componentsSeparatedByString:@","].firstObject;
    }
}
@end
