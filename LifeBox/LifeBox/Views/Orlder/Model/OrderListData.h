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

@property(strong, nonatomic) NSArray* orderItemList;//订单商品列表
@end

NS_ASSUME_NONNULL_END
