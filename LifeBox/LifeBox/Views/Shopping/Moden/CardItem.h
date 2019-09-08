//
//  CardItem.h
//  LifeBox
//
//  Created by admin on 2019/9/6.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//购物车商品信息
@interface CardItemProduct : NSObject
@property(assign, nonatomic) CGFloat price;//商品价格
@property(strong, nonatomic) NSString *name;//商品名
@property(strong, nonatomic) NSString *pic;//图片 “,”分隔
@property(strong, nonatomic) NSString *unit;//单位 件 个

@end

//购物车商品选中sku信息
@interface CardItemSKU : NSObject
@property(assign, nonatomic) NSInteger skuid;//sku id
@property(assign, nonatomic) NSInteger stock;//库存
@property(assign, nonatomic) CGFloat price;//sku id
@property(strong, nonatomic) NSString* pic;//规格值1
@property(strong, nonatomic) NSString* sp1;//规格值1
@property(strong, nonatomic) NSString* sp2;//规格值2
@property(strong, nonatomic) NSString* sp3;//规格值3
@end

@interface CardItem : NSObject

@property(assign, nonatomic) NSInteger id;//购物车id
@property(assign, nonatomic) NSInteger quantity;//购买数量
@property(assign, nonatomic) NSInteger productId;//商品id
@property(assign, nonatomic) NSInteger productSkuId;//商品sku id
@property(strong, nonatomic) CardItemProduct *pmsProduct;
@property(strong, nonatomic) CardItemSKU *pmsSkuStock;


//get
@property(strong, nonatomic) NSString* spstr;//规格
@property(strong, nonatomic) NSString* icon; //图片
@end


NS_ASSUME_NONNULL_END
