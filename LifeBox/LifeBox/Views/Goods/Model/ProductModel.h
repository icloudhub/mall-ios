//
//  ProductModel.h
//  LifeBox
//
//  Created by admin on 2019/8/25.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductModel : NSObject

@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *detailMobileHtml;
@property(strong, nonatomic) NSString *detailHtml;
@property(strong, nonatomic) NSString *productid;
@property(strong, nonatomic) NSString *albumPics;//画册图片用逗号分割

@end

NS_ASSUME_NONNULL_END
