//
//  ConfigData.h
//  LifeBox
//
//  Created by admin on 2019/9/5.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ConfigData : NSObject

+ (instancetype)shared;

-(void)updateConfigGlobal:(void(^)(NSError *error))block;
@end

NS_ASSUME_NONNULL_END
