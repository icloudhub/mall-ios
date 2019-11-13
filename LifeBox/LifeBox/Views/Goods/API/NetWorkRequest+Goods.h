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
/**
 * 获取商品详情
 */
-(void)productproductInfo:(NSInteger)productid block:(NREndBlock)endblock;

/**
 * /cart/add post
 * 添加商品到购物车
 */
-(void)addCar:(NSString*)productId skuId:(NSString*)skuId block:(NREndBlock)endblock;

/**
 * /product/commentlist
 * 添加商品到购物车
 */
-(void)commentlist:(NSString*)productId pageSize:(NSInteger)pageSize pageNum:(NSInteger)pageNum block:(NREndBlock)endblock;
@end

NS_ASSUME_NONNULL_END
