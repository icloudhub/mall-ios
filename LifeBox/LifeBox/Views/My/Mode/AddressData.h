//
//  AddressData.h
//  LifeBox
//
//  Created by Lucky on 2019/12/9.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddressData : NSObject

///地址ID
@property (strong, nonatomic) NSString *addressId;
///收货人姓名
@property (strong, nonatomic) NSString *name;
///收货人电话
@property (strong, nonatomic) NSString *phoneNumber;
///是否默认地址(0、非默认，1、默认)
@property (strong, nonatomic) NSString *defaultStatus;
///邮政编码
@property (strong, nonatomic) NSString *postCode;
///省
@property (strong, nonatomic) NSString *province;
///市
@property (strong, nonatomic) NSString *city;
///区
@property (strong, nonatomic) NSString *region;
///详细地址
@property (strong, nonatomic) NSString *detailAddress;

@end

NS_ASSUME_NONNULL_END
