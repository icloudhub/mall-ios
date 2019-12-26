//
//  NetWorkRequest+Goods.m
//  LifeBox
//
//  Created by admin on 2019/8/17.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NetWorkRequest+Goods.h"

@implementation NetWorkRequest (Goods)

#pragma mark - 根据商品ID获得商品信息
-(void)productproductInfo:(NSInteger)productid block:(NREndBlock)endblock{
    NSString *url = [NSString stringWithFormat:@"%@/product/productInfo/%zd",BASEURL,productid];
    [self get:url param:@{} head:nil endblock:endblock];
}

#pragma mark - 添加商品到购物车
-(void)addCar:(NSString *)productId skuId:(NSString*)skuId block:(NREndBlock)endblock{
    NSString *url = [NSString stringWithFormat:@"%@/cart/add",BASEURL];
    NSDictionary *param = @{
                            @"productId":productId,
                            @"productSkuId":skuId
                            };
    [self post:url param:param head:nil endblock:endblock];
}

#pragma mark - 根据商品ID获取商品评价
-(void)commentlist:(NSString *)productId pageSize:(NSInteger)pageSize pageNum:(NSInteger)pageNum block:(NREndBlock)endblock{
    NSString *url = [NSString stringWithFormat:@"%@/product/commentlist/%@",BASEURL,productId];
    NSDictionary *param = @{
        @"pageSize":[NSNumber numberWithInteger: pageSize],
        @"pageNum":[NSNumber numberWithInteger: pageNum],
    };
     [self get:url param:param head:nil endblock:endblock];
}

#pragma mark - 商品添加收藏
-(void)addCollectionWithWithProductId:(NSString *)productId endBlock:(NREndBlock)endblock {
    NSString *url = [NSString stringWithFormat:@"%@/member/collection/addProduct/%@",BASEURL,productId];
    [self post:url param:nil head:nil endblock:endblock];
}

#pragma mark - 商品取消收藏
-(void)cancelCollectionWithMemberId:(NSString *)memberId productId:(NSString *)productId endBlock:(NREndBlock)endblock {
    NSString *url = [NSString stringWithFormat:@"%@/member/collection/deleteProduct/%@",BASEURL,productId];

    [self post:url param:nil head:nil endblock:endblock];
}

#pragma mark - 根据用户ID获取关注列表
-(void)getCommentlistWithMemberId:(NSString *)memberId endBlock:(NREndBlock)endblock {
    NSString *url = [NSString stringWithFormat:@"%@/member/collection/listProduct", BASEURL];
     [self get:url param:nil head:nil endblock:endblock];
}

#pragma mark - 获取订单数据接口
-(void)getOrderStateListWithState:(NSString *)state pageSize:(NSString *)pageSize pageNum:(NSString *)pageNum endBlock:(NREndBlock)endblock {
    NSString *url = [NSString stringWithFormat:@"%@/order/orderlist", BASEURL];
    NSDictionary *param = @{
        @"status": state,
        @"pageSize": pageSize,
        @"pageNum": pageNum,
    };
     [self get:url param:param head:nil endblock:endblock];
}

#pragma mark - 获取订单数据接口
-(void)getOrderDetailsWithID:(NSString *)orderId endBlock:(NREndBlock)endblock {
    NSString *url = [NSString stringWithFormat:@"%@/order/orderinfo", BASEURL];
    NSDictionary *param = @{
        @"orderId": orderId,
    };
     [self get:url param:param head:nil endblock:endblock];
}

@end
