//
//  OrderDefData.h
//  LifeBox
//
//  Created by admin on 2019/9/8.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 订单详情
 */
@interface OrderDefData : NSObject

@property(strong, nonatomic) NSString* autoConfirmDay;// (integer, optional): 自动确认时间（天） ,
@property(strong, nonatomic) NSString* billContent ;//(string, optional): 发票内容 ,
@property(strong, nonatomic) NSString* billHeader;// (string, optional): 发票抬头 ,
@property(strong, nonatomic) NSString* billReceiverEmail;// (string, optional): 收票人邮箱 ,
@property(strong, nonatomic) NSString* billReceiverPhone;// (string, optional): 收票人电话 ,
@property(strong, nonatomic) NSString* billType;// (integer, optional): 发票类型：0->不开发票；1->电子发票；2->纸质发票 ,
@property(strong, nonatomic) NSString* commentTime;// (string, optional): 评价时间 ,
@property(strong, nonatomic) NSString* confirmStatus;// (integer, optional): 确认收货状态：0->未确认；1->已确认 ,
@property(strong, nonatomic) NSString* couponAmount;// (number, optional): 优惠券抵扣金额 ,
@property(strong, nonatomic) NSString* couponId;// (integer, optional),
@property(strong, nonatomic) NSDate* createTime;// (string, optional): 提交时间 ,
@property(strong, nonatomic) NSString* deleteStatus;// (integer, optional): 删除状态：0->未删除；1->已删除 ,
@property(strong, nonatomic) NSString* deliveryCompany;// (string, optional): 物流公司(配送方式) ,
@property(strong, nonatomic) NSString* deliverySn;// (string, optional): 物流单号 ,
@property(strong, nonatomic) NSString* deliveryTime;// (string, optional): 发货时间 ,
@property(assign, nonatomic) CGFloat discountAmount ;//(number, optional): 管理员后台调整订单使用的折扣金额 ,
@property(assign, nonatomic) CGFloat freightAmount;// (number, optional): 运费金额 ,
@property(strong, nonatomic) NSString* growth;// (integer, optional): 可以活动的成长值 ,
@property(strong, nonatomic) NSString* id;// (integer, optional): 订单id ,
@property(strong, nonatomic) NSString* integration ;//(integer, optional): 可以获得的积分 ,
@property(strong, nonatomic) NSString* integrationAmount;// (number, optional): 积分抵扣金额 ,
@property(strong, nonatomic) NSString* memberId;// (integer, optional),
@property(strong, nonatomic) NSString* memberUsername;// (string, optional): 用户帐号 ,
@property(strong, nonatomic) NSString* modifyTime;// (string, optional): 修改时间 ,
@property(strong, nonatomic) NSString* note;// (string, optional): 订单备注 ,
@property(strong, nonatomic) NSString* orderSn;// (string, optional): 订单编号 ,
@property(strong, nonatomic) NSString* orderType;// (integer, optional): 订单类型：0->正常订单；1->秒杀订单 ,
@property(strong, nonatomic) NSString* payAmount;// (number, optional): 应付金额（实际支付金额） ,
@property(strong, nonatomic) NSString* payType;// (integer, optional): 支付方式：0->未支付；1->支付宝；2->微信 ,
@property(strong, nonatomic) NSString* paymentTime;// (string, optional): 支付时间 ,
@property(strong, nonatomic) NSString* promotionAmount;// (number, optional): 促销优化金额（促销价、满减、阶梯价） ,
@property(strong, nonatomic) NSString* promotionInfo;// (string, optional): 活动信息 ,
@property(strong, nonatomic) NSString* receiveTime;// (string, optional): 确认收货时间 ,
@property(strong, nonatomic) NSString* receiverCity;// (string, optional): 城市 ,
@property(strong, nonatomic) NSString* receiverDetailAddress;// (string, optional): 详细地址 ,
@property(strong, nonatomic) NSString* receiverName;// (string, optional): 收货人姓名 ,
@property(strong, nonatomic) NSString* receiverPhone;// (string, optional): 收货人电话 ,
@property(strong, nonatomic) NSString* receiverPostCode;// (string, optional): 收货人邮编 ,
@property(strong, nonatomic) NSString* receiverProvince ;//(string, optional): 省份/直辖市 ,
@property(strong, nonatomic) NSString* receiverRegion;// (string, optional): 区 ,
@property(strong, nonatomic) NSString* sourceType;// (integer, optional): 订单来源：0->PC订单；1->app订单 ,
@property(strong, nonatomic) NSString*  status;// (integer, optional): 订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单 ,
@property(assign, nonatomic) CGFloat totalAmount;// (number, optional): 订单总金额 ,
@property(strong, nonatomic) NSString* useIntegration;// (integer, optional): 下单时使用的积分
@property(strong, nonatomic) NSArray * orderItemList;//商品列表
@property(assign, nonatomic) NSInteger deliveryType;//'物流类型：0->物流配送；1->买家上门自提；2->买家自提点自提；3->骑手派送',

@property(readonly, nonatomic) NSString *deliveryTypeStr;

@end

NS_ASSUME_NONNULL_END
