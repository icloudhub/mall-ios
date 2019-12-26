//
//  AddressSheet.h
//  LifeBox
//
//  Created by Lucky on 2019/9/19.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "BaseSheet.h"
#import "AreaData.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ChooseAddressDelegate <NSObject>

- (void)selectProvince:(NSString *)province city:(NSString *)city area:(NSString *)area;

@end

@interface AddressSheet : BaseSheet<UITableViewDelegate, UITableViewDataSource>

///传入的省数据
@property (strong, nonatomic) AreaData *provinceData;

///传入的市数据
@property (strong, nonatomic) AreaData *cityData;

///传入的区数据
@property (strong, nonatomic) AreaData *areaData;

@property (weak, nonatomic) id<ChooseAddressDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
