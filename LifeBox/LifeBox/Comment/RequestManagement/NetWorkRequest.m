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
        afManager.requestSerializer = [AFJSONRequestSerializer serializer];
        afManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/JavaScript",@"text/html",@"text/plain",@"image/jpeg",
                                                               @"image/png", @"application/octet-stream",  nil];
        [afManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        //设置网络延时
        afManager.requestSerializer.timeoutInterval = 30;
    }
    return self;
}

-(void)post:(NSString*)url param:(NSDictionary *)param head:(NSDictionary *)head endblock:(NREndBlock)endblock{
    
    if ([Global_Variable shared].token) {
        [afManager.requestSerializer setValue:[Global_Variable shared].token forHTTPHeaderField:@"Authorization"];
    }
    NSString *cookie = [[NSUserDefaults standardUserDefaults] objectForKey:@"Set-Cookie"];
    if (cookie != nil) {
        [afManager.requestSerializer setValue:cookie forHTTPHeaderField:@"Cookie"];
    }
    
    [afManager.requestSerializer setValue:[self getclientAgent] forHTTPHeaderField:@"client_Agent"];
    if (head) {
        for (NSString *key in head) {
            [afManager.requestSerializer setValue:head[key] forHTTPHeaderField:key];
        }
    }
    
    //网络判断

    //开始请求
    [afManager POST:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSHTTPURLResponse* response = (NSHTTPURLResponse* )task.response;
        NSDictionary *allHeaderFieldsDic = response.allHeaderFields;
        NSString *setCookie = allHeaderFieldsDic[@"Set-Cookie"];
        if (setCookie != nil) {
            NSString *cookie = [[setCookie componentsSeparatedByString:@";"] objectAtIndex:0];
            [[NSUserDefaults standardUserDefaults]setObject:cookie forKey:@"Set-Cookie"];
        }
        if (responseObject) {
            /*
             * 解析请求返回码
             */
            NSInteger code = [responseObject[@"code"] integerValue];
            if (code == 200) {
                DDLogVerbose(@"{POST}url:%@ \nheader:%@ \nparame:%@ \nresult:%@", url, afManager.requestSerializer, param, responseObject);
                NSDictionary *dic = responseObject[@"data"];
                if (endblock) {
                    endblock(dic,nil);
                }
            }else{
                if (code == 401) {
                    [UIApplication gotoLoginCtl];
                }
                NSError *error = [NSError errorWithDomain:responseObject[@"message"] code:[responseObject[@"code"] integerValue] userInfo:responseObject];
                DDLogWarn(@"❗️{POST}url:%@ \nheader:%@ \nparame:%@ \nerror:%@", url, afManager.requestSerializer, param, responseObject);
                
                if (endblock) {
                    endblock(nil,error);
                }
            }

        }else{
          
            DDLogWarn(@"❗️{POST}url:%@ \nheader:%@ \nparame:%@ \nerror:%@", url, afManager.requestSerializer, param, @"接口未返回数据");
            if (endblock) {
                endblock(nil,[NSError errorWithDomain:@"接口未返回数据" code:-1 userInfo:nil]);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
        DDLogWarn(@"❗️{POST}url:%@ \nheader:%@ \nparame:%@ \nerror:%@", url, [afManager.requestSerializer modelDescription], param, error);
        if (endblock) {
            endblock(nil,error);
        }
    }];
    
}

-(void)get:(NSString*)url param:(NSDictionary *)param head:(NSDictionary *)head endblock:(NREndBlock)endblock{
    
    if ([Global_Variable shared].token) {
        [afManager.requestSerializer setValue:[Global_Variable shared].token forHTTPHeaderField:@"Authorization"];
    }
    NSString *cookie = [[NSUserDefaults standardUserDefaults] objectForKey:@"Set-Cookie"];
    if (cookie != nil) {
        [afManager.requestSerializer setValue:cookie forHTTPHeaderField:@"Cookie"];
    }
    [afManager.requestSerializer setValue:[self getclientAgent] forHTTPHeaderField:@"client_Agent"];
    [afManager GET:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSHTTPURLResponse* response = (NSHTTPURLResponse* )task.response;
        NSDictionary *allHeaderFieldsDic = response.allHeaderFields;
        NSString *setCookie = allHeaderFieldsDic[@"Set-Cookie"];
        if (setCookie != nil) {
            NSString *cookie = [[setCookie componentsSeparatedByString:@";"] objectAtIndex:0];
            [[NSUserDefaults standardUserDefaults]setObject:cookie forKey:@"Set-Cookie"];
        }
        if (responseObject) {
            /*
             * 解析请求返回码
             */
            NSInteger code = [responseObject[@"code"] integerValue];
            if (code == 200) {
                DDLogVerbose(@"{GET}url:%@ \nheader:%@ \nparame:%@ \nresult:%@", url, [Global_Variable shared].token, param, responseObject);
                NSDictionary *dic = responseObject[@"data"];
                if (endblock) {
                    endblock(dic,nil);
                }
            }else{
                if (code == 401) {
                    [UIApplication gotoLoginCtl];
                }
                NSError *error = [NSError errorWithDomain:responseObject[@"message"] code:[responseObject[@"code"] integerValue] userInfo:responseObject];
                DDLogWarn(@"❗️{GET}url:%@ \nheader:%@ \nparame:%@ \nerror:%@", url, [Global_Variable shared].token, param, responseObject);
                
                if (endblock) {
                    endblock(nil,error);
                }
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        DDLogWarn(@"❗️{GET}url:%@ \nheader:%@ \nparame:%@ \nerror:%@", url, [Global_Variable shared].token, param, error);
        if (endblock) {
            endblock(nil,[NSError errorWithDomain:@"加载失败" code:error.code userInfo:nil]);
        }
    }];
}

-(NSString *) getclientAgent{
    NSDictionary *dic = @{@"verstion":@"v1.0.1",@"platform":@"iOS"};
    return @"{verstion:\"v1.0.1\",platform:\"iOS\"}";
    
}

@end
