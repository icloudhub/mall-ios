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
    NSString *url = [NSString stringWithFormat:@"%@/member/collection/addProduct/%@", BASEURL, productId];
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

#pragma mark - 获取不同状态订单接口
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

#pragma mark - 根据父id获取品牌列表
/// @param parentID 分类父id
/// @param endblock 请求回调

-(void)categoryWithID:(NSString *)parentID endBlock:(NREndBlock)endblock{
     
    NSString *url = [NSString stringWithFormat:@"%@/category/list", BASEURL];
    NSDictionary *param = @{
        @"parentID": parentID,
    };
    [self get:url param:param head:nil endblock:endblock];
}


#pragma mark - 综合搜索、筛选、排序
/**
 keyword 关键字
 brandId 品牌id
 productCategoryId 分类id
 pageNum 页码
 pageSize 分页大小
 sort 排序 排序字段:0->按相关度；1->按新品；2->按销量；3->价格从低到高；4->价格从高到低
 */

-(void)productsearch:(NSString *)keyword
             brandId:(NSString *)brandId
   productCategoryId:(NSString *)productCategoryId
                sort:(NSString *)sort
            pageSize:(NSString *)pageSize
             pageNum:(NSString *)pageNum
            endBlock:(NREndBlock)endblock{
     
    NSString *url = [NSString stringWithFormat:@"%@/esProduct/search", SEARCHURL];
    NSMutableDictionary *param = [NSMutableDictionary new];
    if (keyword) {
        [param setObject:keyword forKey:@"keyword"];
    }
    if (brandId) {
        [param setObject:brandId forKey:@"brandId"];
    }
    if (productCategoryId) {
        [param setObject:productCategoryId forKey:@"productCategoryId"];
    }
    if (sort) {
        [param setObject:sort forKey:@"sort"];
    }
    pageSize = pageSize?:@"10";
    pageNum = pageNum?:@"1";
    [param setObject:pageSize forKey:@"pageSize"];
    [param setObject:pageNum forKey:@"pageNum"];
   
    [self get:url param:param head:nil endblock:endblock];
}

@end
