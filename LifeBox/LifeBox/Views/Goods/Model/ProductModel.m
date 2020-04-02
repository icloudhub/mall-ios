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
