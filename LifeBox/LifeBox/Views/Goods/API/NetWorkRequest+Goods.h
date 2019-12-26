//
//  NetWorkRequest+Goods.h
//  LifeBox
//
//  Created by admin on 2019/8/17.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NetWorkRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetWorkRequest (Goods)

#pragma mark - 获取商品详情
/**
 * 获取商品详情
 */
-(void)productproductInfo:(NSInteger)productid block:(NREndBlock)endblock;

#pragma mark - 添加商品到购物车
/**
 * /cart/add post
 * 添加商品到购物车
 */
-(void)addCar:(NSString*)productId skuId:(NSString*)skuId block:(NREndBlock)endblock;

#pragma mark - 获取商品评价列表
/**
 * /product/commentlist
 * 获取商品评价列表
 */
-(void)commentlist:(NSString*)productId pageSize:(NSInteger)pageSize pageNum:(NSInteger)pageNum block:(NREndBlock)endblock;

#pragma mark - 商品添加收藏
/// 商品添加收藏
/// @param memberId 会员ID
/// @param productId 商品ID
/// @param endblock 请求结束回调
-(void)addCollectionWithWithProductId:(NSString *)productId endBlock:(NREndBlock)endblock;

#pragma mark - 商品取消收藏
/// 商品取消收藏
/// @param memberId 会员ID
/// @param productId 商品ID
/// @param endblock 请求回调
-(void)cancelCollectionWithMemberId:(NSString *)memberId productId:(NSString *)productId endBlock:(NREndBlock)endblock;

#pragma mark - 根据用户ID获取关注列表
/// 根据用户ID获取关注列表
/// @param memberId 会员ID
/// @param endblock 请求回调
-(void)getCommentlistWithMemberId:(NSString *)memberId endBlock:(NREndBlock)endblock;

#pragma mark - 获取订单数据接口
/// 获取订单数据接口
/// @param state 订单状态
/// @param pageSize 一页个数
/// @param pageNum 页数
/// @param endblock 请求回调
-(void)getOrderStateListWithState:(NSString *)state pageSize:(NSString *)pageSize pageNum:(NSString *)pageNum endBlock:(NREndBlock)endblock;

#pragma mark - 获取订单数据接口
/// 获取订单数据接口
/// @param orderId 订单ID
/// @param endblock 请求回调
-(void)getOrderDetailsWithID:(NSString *)orderId endBlock:(NREndBlock)endblock;

@end

NS_ASSUME_NONNULL_END
