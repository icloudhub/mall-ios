//
//  Global_Variable.m
//  LifeBox
//
//  Created by Lucky on 2019/8/4.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "Global_Variable.h"

@implementation Global_Variable

/**
 * 创建静态的实例变量
 */
static Global_Variable *sharedInstance = nil;

#pragma mark - 单例初始化
+ (instancetype)shared {
    return [[self alloc] init];
}

/*
 * 重写allocWithZone方法
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    //由于alloc方法内部会调用allocWithZone: 所以我们只需要保证在该方法只创建一个对象即可
    dispatch_once(&onceToken,^{
        //只执行1次的代码(这里面默认是线程安全的)
        sharedInstance = [super allocWithZone:zone];
    });
    return sharedInstance;
}

/*
 * 重写copy和mutableCopy内部的方法
 */
- (id)copyWithZone:(nullable NSZone *)zone {
    return sharedInstance;
}

- (id)mutableCopyWithZone:(nullable NSZone *)zone {
    return sharedInstance;
}

#pragma mark - App版本
- (NSString *)getAppVersion {
    NSString *strCurAppVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    return strCurAppVersion;
}

#pragma mark - 获取服务IP地址
- (NSString *)serviceIP{
    if (!_serviceIP) {
//        _serviceIP = @"http://120.77.202.156";  //测试环境
        _serviceIP = @"http://10.10.11.171";  //测试环境
    }
    return _serviceIP;
}

#pragma mark - 获取默认服务端口
- (NSString *)defaultPort {
    if (!_defaultPort) {
        _defaultPort = @"15674";  //测试环境
    }
    return _defaultPort;
}

#pragma mark - 获取搜索服务端口
- (NSString *)searchPort {

    if (!_searchPort) {
        _searchPort = @"15673";  //测试环境
    }
    return _searchPort;
}

#pragma mark - 获取用户ID
-(NSString *)userid {
    NSDictionary *userinfo = [[NSUserDefaults standardUserDefaults]objectForKey:@"LoginUserInfo"];
    if (![userinfo objectForKey:@"userinfo"]) {
        return nil;
    }
    return [[userinfo objectForKey:@"userinfo"] objectForKey:@"id"];
}

#pragma mark - 获取用户昵称
-(NSString *)nickname {
    NSDictionary *userinfo = [[NSUserDefaults standardUserDefaults]objectForKey:@"LoginUserInfo"];
    if (![userinfo objectForKey:@"userinfo"]) {
        return nil;
    }
    return [[userinfo objectForKey:@"userinfo"] objectForKey:@"nickname"];
}
-(NSString *)phone{
    NSDictionary *userinfo = [[NSUserDefaults standardUserDefaults]objectForKey:@"LoginUserInfo"];
      if (![userinfo objectForKey:@"userinfo"]) {
          return nil;
      }
      return [[userinfo objectForKey:@"userinfo"] objectForKey:@"phone"];
}

#pragma mark - 获取用户token
-(NSString *)token {
    
    NSDictionary *userinfo = [[NSUserDefaults standardUserDefaults] objectForKey:@"LoginUserInfo"];
    if (![userinfo objectForKey:@"userinfo"]) {
        return nil;
    }
    return [NSString stringWithFormat:@"Bearer%@",[userinfo objectForKey:@"token"]];
}

/**
 刷新用户数据
 */
-(void)updateUserInfo:(void(^)(NSDictionary *result, NSError *error))endblock{
    NSString *url = [NSString stringWithFormat:@"%@/sso/myInfo", BASEURL];
    [[NetWorkRequest new] get:url param:@{} head:nil endblock:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
        if(!error){
            NSMutableDictionary *userinfo =[[NSMutableDictionary alloc]initWithDictionary:[[NSUserDefaults standardUserDefaults] objectForKey:@"LoginUserInfo"]];
            
            [userinfo setValue:dataDict forKey:@"userinfo"];
            [[NSUserDefaults standardUserDefaults] setValue:userinfo forKey:@"LoginUserInfo"];
        }
        endblock(dataDict,error);
    }];
    
}

/**
 清理用户数据（注销）
 */
-(void)clearUserData{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"LoginUserInfo"];
}

@end
