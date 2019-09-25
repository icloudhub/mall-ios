//
//  AppDelegate+KeyValue.h
//  BattBox
//
//  Created by Lucky on 2018/12/5.
//  Copyright © 2018 Lucky. All rights reserved.
//

/*
 1：调用时先调用[addObjectIndateDic:]添加一个记录
 2：根据需要调用[getimeIntervalBy:]或[getimeIntervalBy：wirhMax]获取时间差
 3：出错或成功后都需调用[removeObjectKey]移除记录
 */

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

static NSMutableDictionary* datedic = nil;
@interface AppDelegate (KeyValue)

#pragma mark - 添加Key
/**
 添加要记录的key
 @param key 存储关键字：验证码相关时传入获取验证码的编号
 */
+(void)addObjectIndateDic:(NSString*)key;

#pragma mark - 获取key的时间于当前时间比较

/**
 获取记录的key时间与现在的时间差
 @param key 存储关键字：验证码相关时传入获取验证码的编号
 @return 返回的时间
 */
+(NSTimeInterval)getimeIntervalBy:(NSString*)key;

#pragma mark - 获取key的时间

/**
 获取key的时间
 @param key 存储关键字：验证码相关时传入获取验证码的编号
 @param maxTimer 最大时间
 @return 返回的时间
 */
+(NSTimeInterval)getimeIntervalBy:(NSString*)key wirhMax:(NSInteger)maxTimer;

#pragma mark - 移除key的时间记录
/**
 移除key的时间记录
 @param key 存储关键字：验证码相关时传入获取验证码的编号
 */
+(void)removeObjectKey:(NSString*)key;

#pragma mark - 定时器
/**
 app开启一个定时器
 */
+(void)starappTimeInformation;

/**
 关闭app全局定时器
 */
+(void)stopappTimeInformation;

#pragma mark - 判断用户是否开始定位
/**
 判断用户是否开始定位
 @return (YES:开启、NO:没有开启)
 */
+ (BOOL)userIsOpenLocation;

#pragma mark - 判断用户是否开启相册权限
/**
 判断用户是否开启相册权限
 @return (YES:开启、NO:没有开启)
 */
+ (BOOL)userIsOpenAlbumPermissions;

#pragma mark - 判断用户是否开启相机权限
/**
 判断用户是否开启相机权限
 @return (YES:开启、NO:没有开启)
 */
+ (BOOL)userIsOpenCameraPermissions;

@end

NS_ASSUME_NONNULL_END
