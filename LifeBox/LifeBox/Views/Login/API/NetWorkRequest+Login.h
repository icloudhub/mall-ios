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

#pragma mark - 密码登录接口
/// 密码登录接口
/// @param name 用户名
/// @param passwd 密码
/// @param endblock 接口回调
-(void)passlogin:(NSString *)name passwd:(NSString *)passwd block:(NREndBlock)endblock;

#pragma mark - 注册接口
/// 注册接口
/// @param username 用户名
/// @param passwd 密码
/// @param tel 电话号码
/// @param authCode 验证码
/// @param reccode 邀请码
/// @param endblock 接口回调
-(void)registerWithTel:(NSString*)tel passwd:(NSString*)passwd authCode:(NSString*)authCode reccode:(NSString*)reccode username:(NSString *)username block:(NREndBlock)endblock;

#pragma mark - 获取验证码
/// 获取验证码
/// @param tel 电话号码
/// @param endblock 接口回调
-(void)getAuthCode:(NSString*)tel block:(NREndBlock)endblock;

#pragma mark - 验证码登录接口
/// 验证码登录接口
/// @param code 验证码
/// @param phone 手机号码
/// @param endblock 接口回调
- (void)loginWihtCode:(NSString *)code phone:(NSString *)phone endBlock:(NREndBlock)endblock;

#pragma mark - 修改密码接口
/// 修改密码接口
/// @param authCode 验证码
/// @param telephone 电话号码
/// @param password 新密码
/// @param endblock 接口回调
- (void)updataPasswdWihtCode:(NSString *)authCode phone:(NSString *)telephone password:(NSString *)password endBlock:(NREndBlock)endblock;

@end

NS_ASSUME_NONNULL_END
