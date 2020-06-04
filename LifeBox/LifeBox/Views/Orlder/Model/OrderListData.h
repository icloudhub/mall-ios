//
//  OrderListData.h
//  LifeBox
//
//  Created by admin on 2020/4/3.
//  Copyright © 2020 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrderListData : NSObject

@property(strong, nonatomic) NSDate* createTime; //创建时间
@property(strong, nonatomic) NSDate* modifyTime; //修改时间
@property(strong, nonatomic) NSString* id;
@property(strong, nonatomic) NSString* memberId;
@property(strong, nonatomic) NSString* orderSn; // 订单编号;
@property(strong, nonatomic) NSString* status; // 订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
@property(readonly, nonatomic) NSString* statusStr;
@property(assign, nonatomic) CGFloat totalAmount;
@property(strong, nonatomic) NSArray* orderItemList;//订单商品列表
@property(assign, nonatomic) NSInteger deliveryType;//'物流类型：0->物流配送；1->买家上门自提；2->买家自提点自提；3->骑手派送',
@property(readonly, nonatomic) NSString *deliveryTypeStr;

@end

NS_ASSUME_NONNULL_END
