//
//  NetWorkRequest+Login.m
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/17.
//  Copyright © 2020 admin. All rights reserved.
//

#import "NetWorkRequest+Login.h"



@implementation NetWorkRequest (Login)

-(void)register:(NSString *)phone password:(NSString *)password authCode:(NSString *)authCode block:(NREndBlock)endblock{
    NSString *url = [NSString stringWithFormat:@"%@/sso/register",BASEURL];
    NSDictionary *param = @{
        @"username":phone,
        @"telephone":phone,
        @"password":password,
        @"authCode":authCode
    };
      [self post:url param:param head:nil endblock:endblock];
}

/**
 获取验证码
 */
-(void)getAuthCode:(NSString *)phone block:(NREndBlock)endblock{
    NSString *url = [NSString stringWithFormat:@"%@/sso/getAuthCode",BASEURL];
    NSDictionary *param = @{
        @"telephone":phone,
    };
    [self get:url param:param head:nil endblock:endblock];
}

/**
 密码登陆
 */
-(void)passwordLogin:(NSString *)username password:(NSString *)password block:(NREndBlock)endblock{
    NSString *url = [NSString stringWithFormat:@"%@/sso/passlogin",BASEURL];
       NSDictionary *param = @{
                               @"username":username,
                               @"password":password,
                               };
       [self post:url param:param head:nil endblock:endblock];
}
@end
