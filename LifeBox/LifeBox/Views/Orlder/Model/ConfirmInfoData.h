//
//  ConfirmInfoData.h
//  LifeBox
//
//  Created by admin on 2019/9/8.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface ConfirmInfoAmount : NSObject

@property(strong, nonatomic) NSString* freightAmount;//运费
@property(strong, nonatomic) NSString* payAmount;//支付金额
@property(strong, nonatomic) NSString* promotionAmount;//优惠金额
@property(strong, nonatomic) NSString* totalAmount;//订单金额

@end

@interface ConfirmInfoaddress : NSObject

@property(assign, nonatomic) NSInteger id;//运费
@property(strong, nonatomic) NSString* city;//运费
@property(assign, nonatomic) NSInteger defaultStatus;//是否默认地址
@property(strong, nonatomic) NSString* detailAddress;//详细地址
@property(strong, nonatomic) NSString* postCode;//省
@property(strong, nonatomic) NSString* province;//市
@property(strong, nonatomic) NSString* region;//县

@end

@interface ConfirmInfoData : NSObject

@property(strong, nonatomic) ConfirmInfoaddress* defualAddress;//收获地址列表

@property(strong, nonatomic) NSArray *productList;//商品列表

@property(strong, nonatomic) ConfirmInfoAmount *amountdata;//商品列表

@end

NS_ASSUME_NONNULL_END
