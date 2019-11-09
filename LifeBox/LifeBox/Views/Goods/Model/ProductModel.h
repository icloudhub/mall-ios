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

@interface ProductModel : NSObject

@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *detailMobileHtml;
@property(strong, nonatomic) NSString *detailHtml;
@property(strong, nonatomic) NSString *productid;
<<<<<<< HEAD
@property(strong, nonatomic) NSString *albumPics;  //画册图片用逗号分割

=======
@property(strong, nonatomic) NSString *albumPics;//画册图片用逗号分割
@property(strong, nonatomic) NSArray<ProductSKUModel*> *skuStockList;
>>>>>>> 39f6af04a36ebbc346a7f5fc62bc16103b0c23a8
@end

NS_ASSUME_NONNULL_END
