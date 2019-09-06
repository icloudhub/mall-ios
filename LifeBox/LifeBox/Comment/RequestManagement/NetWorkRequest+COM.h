//
//  NetWorkRequest+COM.h
//  LifeBox
//
//  Created by admin on 2019/9/5.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NetWorkRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetWorkRequest (COM)
-(void)getcfgvalueType:(NSInteger)type block:(void(^)(NSDictionary *result, NSError *error))endblock;
@end

NS_ASSUME_NONNULL_END
