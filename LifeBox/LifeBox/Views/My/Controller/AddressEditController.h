//
//  AddressEditController.h
//  LifeBox
//
//  Created by Lucky on 2019/9/9.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "LifeBoxViewController.h"
#import "AddressData.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddressEditController : LifeBoxViewController

#pragma mark - 属性
///传入的地址数据
@property (strong, nonatomic) AddressData *passData;

@end

NS_ASSUME_NONNULL_END
