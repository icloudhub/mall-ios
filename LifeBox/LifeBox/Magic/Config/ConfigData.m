//
//  ConfigData.m
//  LifeBox
//
//  Created by admin on 2019/9/5.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "ConfigData.h"
#import "NetWorkRequest+COM.h"

static ConfigData *share = nil;
@implementation ConfigData

+(instancetype)shared{
    if (!share) {
        share = [ConfigData new];
    }
    return share;
}

-(void)updateConfigGlobal:(void(^)(NSError *error))block{
    [[[NetWorkRequest alloc]init] getcfgvalueType:1001 block:^(NSDictionary * _Nonnull result, NSError * _Nonnull error) {
        if (!error) {
            NSLog(@"%@",result);
        }
        block(error);
    }];
}
@end
