//
//  AppDelegate+KeyValue.m
//  BattBox
//
//  Created by Lucky on 2018/12/5.
//  Copyright © 2018 Lucky. All rights reserved.
//

#import "AppDelegate+KeyValue.h"
#import <CoreLocation/CLLocationManager.h>
#import <Photos/PHPhotoLibrary.h>
#import <AVFoundation/AVFoundation.h>

@implementation AppDelegate (KeyValue)

#pragma mark - 添加Key
+(void)addObjectIndateDic:(NSString*)key{
    datedic = [[NSMutableDictionary alloc] initWithDictionary:[[NSUserDefaults standardUserDefaults]objectForKey:@"AppDelegate+KeyValue"]];
    if (!datedic) {
        datedic = [[NSMutableDictionary alloc]initWithCapacity:1];
    }
    NSDate* nowdate = [NSDate date];
    [datedic setObject:nowdate forKey:key];
    [[NSUserDefaults standardUserDefaults] setObject:datedic forKey:@"AppDelegate+KeyValue"];
    //    DbgLog(@"添加了一个新的键值对：%@",datedic);
}

#pragma mark - 获取key的时间于当前时间比较
+(NSTimeInterval)getimeIntervalBy:(NSString*)key{
    if (!datedic) {
        datedic = [[NSMutableDictionary alloc]initWithDictionary:[[NSUserDefaults standardUserDefaults]objectForKey:@"AppDelegate+KeyValue"]];
    }
    NSTimeInterval timeInterval = [[datedic objectForKey:key] timeIntervalSinceNow];
    //    DbgLog(@"与当前的时间差：%f",timeInterval);
    return timeInterval;
}

#pragma mark - 获取key的时间
+(NSTimeInterval)getimeIntervalBy:(NSString*)key wirhMax:(NSInteger)maxTimer{
    
    if (!datedic) {
        datedic = [[NSMutableDictionary alloc]initWithDictionary:[[NSUserDefaults standardUserDefaults]objectForKey:@"AppDelegate+KeyValue"]];
    }
    if ([datedic objectForKey:key]) {
        if (maxTimer+[self getimeIntervalBy:key] < 0) {
            [datedic removeObjectForKey:key];
            return 0;
        }
        return maxTimer+[self getimeIntervalBy:key];
    }else{
        return 0;
    }
}

#pragma mark - 移除key的时间记录
+(void)removeObjectKey:(NSString*)key {
//    NSInteger error = [errorCode integerValue];
    if (!datedic) {
        datedic = [[NSMutableDictionary alloc]initWithDictionary:[[NSUserDefaults standardUserDefaults]objectForKey:@"AppDelegate+KeyValue"]];
    }
    [datedic removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] setObject:datedic forKey:@"AppDelegate+KeyValue"];
}

/**
 * app开启一个定时器
 */
static  NSTimer *appTimewInformation;
+(void)starappTimeInformation{
    
    if (!appTimewInformation) {
        appTimewInformation = [NSTimer scheduledTimerWithTimeInterval:1 target:[AppDelegate shareInstance] selector:@selector(timeDoit) userInfo:nil repeats:YES];
    }else{
        if (![appTimewInformation isValid])return ;
        [appTimewInformation setFireDate:[NSDate distantPast]];
    }
}

/**
 * 关闭app全局定时器
 */
+(void)stopappTimeInformation{
    if (![appTimewInformation isValid]) {
        return ;
    }
    [appTimewInformation setFireDate:[NSDate distantFuture]];
    appTimewInformation = nil;
    
}

-(void)timeDoit{
    [[NSNotificationCenter defaultCenter] postNotificationName:APPTIMEINFORMATION object:self userInfo:nil];
}


#pragma mark - 判断用户是否开启定位
/**
 判断用户是否开始定位
 @return (YES:开启、NO:没有开启)
 */
+ (BOOL)userIsOpenLocation {
    if ([CLLocationManager authorizationStatus] ==  kCLAuthorizationStatusNotDetermined) {
//        CLLocationManager *sdf = ;
        [[[CLLocationManager alloc] init] requestWhenInUseAuthorization];
        return YES;
    }
    if ([CLLocationManager authorizationStatus] ==   kCLAuthorizationStatusRestricted) {
        //定位服务授权状态受限制
        return NO;
    }
    if ([CLLocationManager authorizationStatus] ==    kCLAuthorizationStatusDenied) {
        //用户在设置中关闭定位功能，或者用户明确的在弹框之后选择禁止定位
        return NO;
    }
    return YES;
}

#pragma mark - 判断用户是否开启相册权限
/**
 判断用户是否开启相册权限
 @return (YES:开启、NO:没有开启)
 */
+ (BOOL)userIsOpenAlbumPermissions {
    if ([PHPhotoLibrary authorizationStatus] == PHAuthorizationStatusNotDetermined) {
        //默认还没做出选择
        return NO;
    }
    if ([PHPhotoLibrary authorizationStatus] == PHAuthorizationStatusRestricted) {
        //此应用程序没有被授权访问的照片数据
        return NO;
    }
    if ([PHPhotoLibrary authorizationStatus] == PHAuthorizationStatusDenied) {
        //用户已经明确否认了这一照片数据的应用程序访问
        return NO;
    }
    return YES;
}

#pragma mark - 判断用户是否开启相机权限
/**
 判断用户是否开启相机权限
 @return (YES:开启、NO:没有开启)
 */
+ (BOOL)userIsOpenCameraPermissions {
    //读取设备授权状态
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusNotDetermined) {
        //用户还没有对应用程序授权进行操作
        return NO;
    }
    if (authStatus == AVAuthorizationStatusRestricted) {
        //还没有授权访问的照片数据
        return NO;
    }
    if (authStatus == AVAuthorizationStatusDenied) {
        //用户拒绝对应用程序授权
        return NO;
    }
    return YES;
}


@end
