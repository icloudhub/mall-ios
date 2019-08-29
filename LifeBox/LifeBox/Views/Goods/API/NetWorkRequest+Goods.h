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
-(void)productproductInfo:(NSInteger)productid block:(NREndBlock)endblock;
@end

NS_ASSUME_NONNULL_END
