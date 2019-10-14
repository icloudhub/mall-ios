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
/**
 用户名。密码登陆
 */
-(void)passlogin:(NSString*)name passwd:(NSString*)passwd block:(NREndBlock)endblock;

/**
 注册
 */
-(void)register:(NSString*)name passwd:(NSString*)passwd tel:(NSString*)tel  authCode:(NSString*)authCode  reccode:(nullable NSString *)reccode block:(NREndBlock)endblock;

/**
 获取验证码
 */
-(void)getAuthCode:(NSString*)tel block:(NREndBlock)endblock;

@end

NS_ASSUME_NONNULL_END
