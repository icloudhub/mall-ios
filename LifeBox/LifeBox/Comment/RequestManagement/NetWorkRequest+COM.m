//
//  NetWorkRequest+COM.m
//  LifeBox
//
//  Created by admin on 2019/9/5.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NetWorkRequest+COM.h"

@implementation NetWorkRequest (COM)
-(void)getcfgvalueType:(NSInteger)type block:(void(^)(NSDictionary *result, NSError *error))endblock{
    NSString *url = [NSString stringWithFormat:@"%@/cfg/getvalue",BASEURL];
    NSDictionary *param = @{@"typeid":[NSNumber numberWithInteger:type]};
    [self get:url param:param head:nil endblock:endblock];
}
@end
