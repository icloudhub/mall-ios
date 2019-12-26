//
//  AreaData.h
//  LifeBox
//
//  Created by Lucky on 2019/12/20.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AreaData : NSObject

///地址名称
@property (strong, nonatomic) NSString *name;

///区域ID
@property (strong, nonatomic) NSString *areaCode;

///是否选择
@property (strong, nonatomic) NSString *isSelect;

@end

NS_ASSUME_NONNULL_END
