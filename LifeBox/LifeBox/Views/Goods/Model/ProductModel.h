//
//  ProductModel.h
//  LifeBox
//
//  Created by admin on 2019/8/25.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface ProductSKUModel : NSObject

@property(strong, nonatomic) NSString *skuid;
@property(assign, nonatomic) NSInteger *lockStock;//锁定库存
@property(assign, nonatomic) NSInteger *lowStock;
@property(assign, nonatomic) CGFloat originalPrice;// 市场价格 ,
@property(assign, nonatomic) CGFloat price;// 价格 ,
@property(assign, nonatomic) CGFloat promotionPrice;// 单品促销价格 ,
@property(assign, nonatomic) NSInteger sale;//销量
@property(strong, nonatomic) NSString *skuCode; //sku编码
@property(strong, nonatomic) NSString *sp1; //销售属性1 ,
@property(strong, nonatomic) NSString *sp2; //销售属性2 ,
@property(strong, nonatomic) NSString *sp3; //销售属性3 ,
@property(assign, nonatomic) NSInteger stock;//库存


@end

// 规格
@interface ProductSpecModel : NSObject
@property(strong, nonatomic) NSString *id;
@property(strong, nonatomic) NSString *productAttributeId;
@property(strong, nonatomic) NSString *productId;
@property(strong, nonatomic) NSString *value;

@end

// 评价回复
@interface ProductCommentReplayModel : NSObject
@property(strong, nonatomic) NSString *id;
@property(strong, nonatomic) NSString *commentId; //评价id
@property(strong, nonatomic) NSString *content;// 回复内容
@property(strong, nonatomic) NSDate *createTime; // 回复时间
@property(strong, nonatomic) NSString *memberIcon; // 回复人头像
@property(strong, nonatomic) NSString *memberNickName;// 回复人昵称
@property(strong, nonatomic) NSString *type;// 评论人员类型；0->会员；1->管理员

@end

// 评价
@interface ProductCommentModel : NSObject
@property(strong, nonatomic) NSString *id;
@property(strong, nonatomic) NSString *content;// 评价内容
@property(strong, nonatomic) NSDate *createTime; //评价时间,
@property(strong, nonatomic) NSString *memberIcon; // 评论用户头像 ,
@property(strong, nonatomic) NSString *memberNickName; // 评论用户
@property(strong, nonatomic) NSString *pics;// 上传图片地址，以逗号隔开 ,
@property(strong, nonatomic) NSString *productAttribute;// 购买时的商品属性 ,
@property(strong, nonatomic) NSArray<ProductCommentReplayModel*> *replayList; //产品评价回复表 ,
@property(assign, nonatomic) NSInteger star; //评价星数：0->5

@end

@interface ProductModel : NSObject

@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *detailMobileHtml;
@property(strong, nonatomic) NSString *detailHtml;
@property(strong, nonatomic) NSString *productid;
@property(strong, nonatomic) NSString *albumPics;//画册图片用逗号分割
@property(strong, nonatomic) NSString *pic;//图片
@property(strong, nonatomic) NSArray<ProductSKUModel*> *skuList;//sku list
@property(strong, nonatomic) NSArray<ProductSpecModel*> *specList;//规格 list
@property(strong, nonatomic) NSArray<ProductCommentModel*> *commentList;//评论 list

@end

NS_ASSUME_NONNULL_END
