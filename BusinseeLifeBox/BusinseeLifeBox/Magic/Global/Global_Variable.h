//
//  Global_Variable.h
//  LifeBox
//
//  Created by Lucky on 2019/8/4.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Global_Variable : NSObject

#pragma mark - 单例初始化
+ (instancetype)shared;

#pragma mark - 全局变量
///http请求Ip
@property (strong, nonatomic) NSString *serviceIP;

///http默认请求端口
@property (strong, nonatomic) NSString *defaultPort;

///http搜索请求端口
@property (strong, nonatomic) NSString *searchPort;

///http搜索请求端口
@property (strong, nonatomic) NSString *webPort;

@property (readonly) NSString *userid;//用户id

@property (readonly) NSString *nickname;//用户id

@property (readonly) NSString *token;//用户token

@property(assign, readonly) BOOL islogin; //token

#pragma mark - App版本
- (NSString *)getAppVersion;


@end

NS_ASSUME_NONNULL_END
