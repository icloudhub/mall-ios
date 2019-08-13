//
//  NetWorkRequest+Login.h
//  LifeBox
//
//  Created by admin on 2019/8/13.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NetWorkRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetWorkRequest (Login)

-(void)passlogin:(NSString*)name passwd:(NSString*)passwd block:(NREndBlock)endblock;

@end

NS_ASSUME_NONNULL_END
