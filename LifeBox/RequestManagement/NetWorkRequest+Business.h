//
//  NetWorkRequest+Business.h
//  LifeBox
//
//  Created by Lucky on 2019/8/5.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NetWorkRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetWorkRequest (Business)

- (void)getHomeInfoHttpBeginBlock:(BeginBlock)beginBlock FinishBlock:(FinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
