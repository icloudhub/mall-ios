//
//  UGSuperPlayView.m
//  LifeBox
//
//  Created by admin on 2020/4/13.
//  Copyright © 2020 Lucky. All rights reserved.
//

#import "UGSuperPlayView.h"
static UGSuperPlayView *_playerView = nil;

@implementation UGSuperPlayView

+ (UGSuperPlayView *)shareInstance {
    
    if (!_playerView) {
        _playerView = [[UGSuperPlayView alloc] init];
    }
    return _playerView;
}


@end
