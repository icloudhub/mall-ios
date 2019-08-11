//
//  NetWorkRequest+Business.m
//  LifeBox
//
//  Created by Lucky on 2019/8/5.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NetWorkRequest+Business.h"

@implementation NetWorkRequest (Business)

- (void)getHomeInfoHttpBeginBlock:(BeginBlock)beginBlock FinishBlock:(FinishBlock)finishBlock {
    self.requestType = GET;
    self.requstLocation = @"home/content";
    self.beginBlock = beginBlock;
    self.finishBlock = finishBlock;
    [self requestHttpWithParams:nil];
}

@end
