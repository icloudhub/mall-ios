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


-(NSDictionary *)spDic{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    if (_sp) {
        NSArray *sparr = [_sp componentsSeparatedByString:@"/"];
        for (NSString *spstr in sparr) {
            NSArray *valuearr = [spstr componentsSeparatedByString:@":"];
            [dic setValue:valuearr[1] forKey:valuearr[0]];
        }
    }
    return dic;
}

@end
@implementation CardItem


-(NSString *)icon{
    if (self.pmsSkuStock.pic) {
        return self.pmsSkuStock.pic;
    }else{
        return [self.pmsProduct.pic componentsSeparatedByString:@","].firstObject;
    }
}
-(NSString *)spstr{

    return [[self.pmsSkuStock.spDic allValues] componentsJoinedByString:@"/"];
}
@end
