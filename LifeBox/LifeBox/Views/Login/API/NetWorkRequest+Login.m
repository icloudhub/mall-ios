//
//  NetWorkRequest+Login.m
//  LifeBox
//
//  Created by admin on 2019/8/13.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NetWorkRequest+Login.h"

@implementation NetWorkRequest (Login)

#pragma mark - 密码登录接口
-(void)passlogin:(NSString*)name passwd:(NSString*)passwd block:(NREndBlock)endblock {
    NSString *url = [NSString stringWithFormat:@"%@/sso/passlogin",BASEURL];
    NSDictionary *param = @{
                            @"username":name,
                            @"password":passwd
                            };
    [self post:url param:param head:nil endblock:endblock];
}

#pragma mark - 注册接口
-(void)registerWithTel:(NSString*)tel passwd:(NSString*)passwd authCode:(NSString*)authCode reccode:(NSString*)reccode username:(NSString *)username block:(NREndBlock)endblock {
    NSString *url = [NSString stringWithFormat:@"%@/sso/register",BASEURL];
    NSDictionary *param = @{
                               @"password": passwd,
                               @"telephone": tel,
                               @"authCode": authCode,
                               @"username": username
                               };
    NSMutableDictionary *muparam = [[NSMutableDictionary alloc]initWithDictionary:param];
    if(reccode.length != 0){
        [muparam setObject:reccode forKey:@"reccode"];
    }
    [self post:url param:muparam head:nil endblock:endblock];
}

#pragma mark - 获取验证码
-(void)getAuthCode:(NSString*)tel block:(NREndBlock)endblock {
    NSString *url = [NSString stringWithFormat:@"%@/sso/getAuthCode",BASEURL];
    NSDictionary *param = @{
                            @"telephone":tel
                            };
    [self get:url param:param head:nil endblock:endblock];
}

#pragma mark - 验证码登录接口
- (void)loginWihtCode:(NSString *)code phone:(NSString *)phone endBlock:(NREndBlock)endblock {
    NSString *url = [NSString stringWithFormat:@"%@/sso/smslogin",BASEURL];
    NSDictionary *param = @{
                            @"authCode": code,
                            @"telephone": phone
                            };
    [self post:url param:param head:nil endblock:endblock];
}

#pragma mark - 修改密码接口
- (void)updataPasswdWihtCode:(NSString *)authCode phone:(NSString *)telephone password:(NSString *)password endBlock:(NREndBlock)endblock {
    NSString *url = [NSString stringWithFormat:@"%@/sso/smslogin",BASEURL];
    NSDictionary *param = @{
                            @"authCode": authCode,
                            @"telephone": telephone,
                            @"password": password
                            };
    [self post:url param:param head:nil endblock:endblock];
}

@end
