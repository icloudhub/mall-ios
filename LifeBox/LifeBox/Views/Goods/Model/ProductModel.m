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

@implementation ProductSpecModel

+ (NSDictionary *)modelCustomPropertyMapper {
    
    return @{};
    
}
@end

@implementation ProductCommentReplayModel

+ (NSDictionary *)modelCustomPropertyMapper {
    
    return @{};
    
}
@end


@implementation ProductCommentModel

+ (NSDictionary *)modelCustomPropertyMapper {
    
    return @{};
    
}
@end




@implementation ProductModel
+ (NSDictionary *)modelCustomPropertyMapper {

    return @{@"productid":@"id",
             @"attributeList":@"attributeList"
    };

}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
            @"skuList":[ProductSKUModel class],
            @"attributeList":[ProductSpecModel class],
            @"commentList":[ProductCommentModel class],
            };
}
@end
