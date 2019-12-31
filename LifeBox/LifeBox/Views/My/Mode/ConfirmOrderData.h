//
//  ConfirmOrderData.h
//  LifeBox
//
//  Created by admin on 2019/12/31.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AddressData.h"
#import "HomeProductdata.h"
NS_ASSUME_NONNULL_BEGIN

//确认订单金额
@interface CalcAmountData : NSObject
@property(assign, nonatomic) CGFloat freightAmount; //邮费
@property(assign, nonatomic) CGFloat  payAmount; //支付金额
@property(assign, nonatomic) CGFloat  promotionAmount;//优惠金额
@property(assign, nonatomic) CGFloat  totalAmount;//总金额
@end

@interface ProductItemlist : NSObject
@property(assign, nonatomic) CGFloat freightAmount; //邮费
@property(assign, nonatomic) CGFloat  quantity; //购买数量
@property(assign, nonatomic) CGFloat  reduceAmount;//优惠金额
@property(assign, nonatomic) NSString*  skuCode;//sku

@property(strong, nonatomic) HomeProductdata *product;
@end



//确认订单数据
@interface ConfirmOrderData : NSObject
//默认收货地址
@property(strong, nonatomic) AddressData *defualaddress;

//价格
@property(strong, nonatomic) CalcAmountData *calcAmountData;

//订单商品列表

@property(strong, nonatomic) NSMutableArray<ProductItemlist*> *productItemlist;
@end

NS_ASSUME_NONNULL_END
