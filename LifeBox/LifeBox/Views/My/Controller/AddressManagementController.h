//
//  AddressManagementController.h
//  LifeBox
//
//  Created by Lucky on 2019/9/9.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "LifeBoxViewController.h"
#import "AddressData.h"
#import "OrderDefData.h"
NS_ASSUME_NONNULL_BEGIN

@interface AddressManagementController : LifeBoxViewController

@property(copy, nonatomic) void (^didselectAddress)(AddressData* selectData, NSString * deliveryType);

@property(strong, nonatomic) OrderDefData *orderDefData;
@end

NS_ASSUME_NONNULL_END
