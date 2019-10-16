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

-(void)register:(NSString*)name passwd:(NSString*)passwd tel:(NSString*)tel  authCode:(NSString*)authCode  reccode:(NSString*)reccode  block:(NREndBlock)endblock{
    NSString *url = [NSString stringWithFormat:@"%@/sso/register",BASEURL];
    NSDictionary *param = @{
                               @"username":name,
                               @"password":passwd,
                               @"telephone":tel,
                               @"authCode":authCode,
                               };
    NSMutableDictionary *muparam = [[NSMutableDictionary alloc]initWithDictionary:param];
    if(reccode){
        [muparam setObject:reccode forKey:reccode];
    }
    
   
    [self post:url param:muparam head:nil endblock:endblock];
}

/**
 获取验证码
 */
-(void)getAuthCode:(NSString*)tel block:(NREndBlock)endblock{
    NSString *url = [NSString stringWithFormat:@"%@/sso/getAuthCode",BASEURL];
    NSDictionary *param = @{
                            @"telephone":tel
                            };
    [self get:url param:param head:nil endblock:endblock];
}

@end
