//
//  NetWorkRequest+Login.h
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/17.
//  Copyright © 2020 admin. All rights reserved.
//



#import "NetWorkRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetWorkRequest (Login)
/**
 注册
 */
-(void)register:(NSString *)phone password:(NSString *)password authCode:(NSString *)authCode block:(NREndBlock)endblock;

/**
 获取验证码
 */
-(void)getAuthCode:(NSString *)phone block:(NREndBlock)endblock;

/**
 密码登陆
 */
-(void)passwordLogin:(NSString *)username password:(NSString *)password block:(NREndBlock)endblock;

@end

NS_ASSUME_NONNULL_END
