//
//  ProductModel.m
//  LifeBox
//
//  Created by admin on 2019/8/25.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "ProductModel.h"

@implementation ProductSKUModel

+ (NSDictionary *)modelCustomPropertyMapper {
    
    return @{@"skuid":@"id"};
    
}
@end

@implementation ProductModel
+ (NSDictionary *)modelCustomPropertyMapper {

    return @{@"productid":@"id"};

}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"skuStockList":[ProductSKUModel class],
             };
}
@end
