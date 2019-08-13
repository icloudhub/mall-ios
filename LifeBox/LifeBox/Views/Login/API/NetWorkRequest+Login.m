//
//  NetWorkRequest+Login.m
//  LifeBox
//
//  Created by admin on 2019/8/13.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NetWorkRequest+Login.h"

@implementation NetWorkRequest (Login)

-(void)passlogin:(NSString*)name passwd:(NSString*)passwd block:(NREndBlock)endblock{
    NSString *url = [NSString stringWithFormat:@"%@/sso/passlogin",BASEURL];
    NSDictionary *param = @{
                            @"username":name,
                            @"password":passwd
                            };
    [self post:url param:param head:nil endblock:endblock];
}
@end
