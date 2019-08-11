//
//  NetWorkRequest.m
//  LifeBox
//
//  Created by Lucky on 2019/8/4.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NetWorkRequest.h"
#import "AFNetworking.h"

@implementation NetWorkRequest

/**
 * 静态变量
 */
static AFHTTPSessionManager *afManager = nil;

#pragma mark - 初始化
- (instancetype)init {
    self = [super init];
    if (self) {
        afManager = nil;
        afManager = [AFHTTPSessionManager manager];
        afManager.responseSerializer = [AFJSONResponseSerializer serializer];
        afManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        afManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/JavaScript",@"text/html",@"text/plain",@"image/jpeg",
                                                               @"image/png", @"application/octet-stream",  nil];
        //设置网络延时
        afManager.requestSerializer.timeoutInterval = 30;
    }
    return self;
}

#pragma mark - 单例初始化
//+ (instancetype)shared {
//    return [[self alloc] init];
//}

/*
 * 重写allocWithZone方法
 */
//+ (instancetype)allocWithZone:(struct _NSZone *)zone
//{
//    static dispatch_once_t onceToken;
//    //由于alloc方法内部会调用allocWithZone: 所以我们只需要保证在该方法只创建一个对象即可
//    dispatch_once(&onceToken,^{
//        //只执行1次的代码(这里面默认是线程安全的)
//        manager = [super allocWithZone:zone];
//        afManager = [AFHTTPSessionManager manager];
//        afManager.responseSerializer = [AFJSONResponseSerializer serializer];
//        afManager.requestSerializer = [AFHTTPRequestSerializer serializer];
//        afManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/JavaScript",@"text/html",@"text/plain",@"image/jpeg",
//                                                               @"image/png", @"application/octet-stream",  nil];
//        /*
//         * 设置网络延时
//         */
//        afManager.requestSerializer.timeoutInterval = 30;
//    });
//    return manager;
//}
//
///*
// * 重写copy和mutableCopy内部的方法
// */
//- (id)copyWithZone:(nullable NSZone *)zone {
//    return manager;
//}
//
//- (id)mutableCopyWithZone:(nullable NSZone *)zone {
//    return manager;
//}

#pragma mark - 初始化网络请求
/**
 网络请求初始化
 @param params 请求入参
 */
- (void)requestHttpWithParams:(nullable NSDictionary *)params {
    /*
     * 判断请求方式
     */
    if (_requestType == POST) {
        [self postHttpRequestPparams:params requestBegin:_beginBlock Finish:_finishBlock];
    }
    else if (_requestType == GET) {
        [self getHttpRequestParams:params requestBegin:_beginBlock Finish:_finishBlock];
    }else{
        DEBUGLog(@"⚠️网络请求方式缺失⚠️");
    }
}

#pragma mark - POST请求
- (void)postHttpRequestPparams:(nullable NSDictionary *)params requestBegin:(BeginBlock)beginBlock Finish:(FinishBlock)finishBlock {
    DEBUGLog(@"\n ******Post请求头:****** \n %@", afManager.requestSerializer.HTTPRequestHeaders);
    /*
     * 判断请求路径和IP是否为空不为空则开始请求
     */
    NSString *serviceIp = [[Global_Variable shared] getSeverIp];
    NSString *port;
    if (_businessType == DEFAULT) {
        port = [[Global_Variable shared] getDefaultPort];
    }else{
        port = [[Global_Variable shared] getSearchPort];
    }
    NSString *tempUrl = [NSString stringWithFormat:@"%@:%@/", serviceIp, port];
    if ((_requstLocation == nil || [_requstLocation isEqualToString:@""]) || (tempUrl == nil || [tempUrl isEqualToString:@""])) {
        DEBUGLog(@"⚠️POST接口路径或IP不存在⚠️");
    }else{
        if (beginBlock == nil || finishBlock == nil) {
            DEBUGLog(@"⚠️POST回调不存在⚠️");
        }else{
            DEBUGLog(@"\n ******POST接口请求****** \n✨请求路径: %@ \n✨请求接口名: %@ \n✨请求参数: %@ \n******请求END******\n", serviceIp, _requstLocation, params);
            /*
             * 开始请求
             */
            _beginBlock(_requstLocation);
            NSString *requestUrl = [tempUrl stringByAppendingString:_requstLocation];
            [afManager POST:requestUrl parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (responseObject) {
                    /*
                     * 解析请求返回码
                     */
                    NSInteger code = [responseObject[@"status"] integerValue];
                    NSString *resmsg = responseObject[@"resmsg"];
                    if (code != 200) {
                        dispatch_main_async_safe(^{
                            Warning(resmsg);
                        });
                    }
                    /*
                     * 解析请求到数据
                     */
                    NSDictionary *dic = responseObject[@"data"];
                    DEBUGLog(@"\n ******请求到的数据****** \n %@", dic);
                    self.finishBlock(dic, code, self->_requstLocation, nil);
                }else{
                    DEBUGLog(@"❗️接口未返回数据❗️");
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                DEBUGLog(@"\n❗️请求出错❗️\nErrorCode: %ld ErrorText:%@", (long)error.code, error.localizedDescription);
                self.finishBlock(nil, 0, self->_requstLocation, error);
            }];
        }
    }
}

#pragma mark - Get请求
- (void)getHttpRequestParams:(nullable NSDictionary *)params requestBegin:(BeginBlock)beginBlock Finish:(FinishBlock)finishBlock {
    DEBUGLog(@"\n ******Get请求头:****** \n %@", afManager.requestSerializer.HTTPRequestHeaders);
    /*
     * 判断请求路径和IP是否为空不为空则开始请求
     */
    NSString *serviceIp = [[Global_Variable shared] getSeverIp];
    NSString *port;
    if (_businessType == DEFAULT) {
        port = [[Global_Variable shared] getDefaultPort];
    }else{
        port = [[Global_Variable shared] getSearchPort];
    }
    NSString *tempUrl = [NSString stringWithFormat:@"%@:%@/", serviceIp, port];
    if ((_requstLocation == nil || [_requstLocation isEqualToString:@""]) || (tempUrl == nil || [tempUrl isEqualToString:@""])) {
        DEBUGLog(@"⚠️GET接口路径或IP不存在⚠️");
    }else{
        if (beginBlock == nil || finishBlock == nil) {
            DEBUGLog(@"⚠️GET回调不存在⚠️");
        }else{
            DEBUGLog(@"\n ******GET接口请求****** \n✨请求路径: %@ \n✨请求接口名: %@ \n✨请求参数: %@ \n******请求END******\n", serviceIp, _requstLocation, params);
            /*
             * 开始请求
             */
            _beginBlock(_requstLocation);
            NSString *requestUrl = [tempUrl stringByAppendingString:_requstLocation];
            [afManager GET:requestUrl parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (responseObject) {
                    /*
                     * 解析请求返回码
                     */
                    NSInteger code = [responseObject[@"code"] integerValue];
                    NSString *resmsg = responseObject[@"message"];
                    if (code != 200) {
                        dispatch_main_async_safe(^{
                            Warning(resmsg);
                        });
                    }
                    /*
                     * 解析请求到数据
                     */
                    NSDictionary *dic = responseObject[@"data"];
                    DEBUGLog(@"\n ******请求到的数据****** \n %@", dic);
                    self.finishBlock(dic, code, self->_requstLocation, nil);
                }else{
                    DEBUGLog(@"❗️接口未返回数据❗️");
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                DEBUGLog(@"\n❗️请求出错❗️\nErrorCode: %ld ErrorText:%@", (long)error.code, error.localizedDescription);
                self.finishBlock(nil, 0, self->_requstLocation, error);
            }];
        }
    }
}

@end
