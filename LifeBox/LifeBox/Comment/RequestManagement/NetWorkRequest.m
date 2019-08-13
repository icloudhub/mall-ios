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
-(void)post:(NSString*)url param:(NSDictionary *)param head:(NSDictionary *)head endblock:(NREndBlock)endblock{
    //网络判断
    
    //开始请求
    [afManager POST:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            /*
             * 解析请求返回码
             */
            NSInteger code = [responseObject[@"code"] integerValue];
            if (code == 200) {
                DDLogVerbose(@"url:%@ \nheader:%@ \nparame:%@ \nresult:%@", url, afManager.requestSerializer, param, responseObject);
                NSDictionary *dic = responseObject[@"data"];
                if (endblock) {
                    endblock(dic,nil);
                }
            }else{
                
                NSError *error = [NSError errorWithDomain:responseObject[@"message"] code:[responseObject[@"code"] integerValue] userInfo:responseObject];
                DDLogWarn(@"❗️url:%@ \nheader:%@ \nparame:%@ \nerror:%@", url, afManager.requestSerializer, param, responseObject);
                
                if (endblock) {
                    endblock(nil,error);
                }
            }

        }else{
          
            DDLogWarn(@"❗️url:%@ \nheader:%@ \nparame:%@ \nerror:%@", url, afManager.requestSerializer, param, @"接口未返回数据");
            if (endblock) {
                endblock(nil,[NSError errorWithDomain:@"接口未返回数据" code:-1 userInfo:nil]);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
        DDLogWarn(@"❗️url:%@ \nheader:%@ \nparame:%@ \nerror:%@", url, afManager.requestSerializer, param, error);
        if (endblock) {
            endblock(nil,error);
        }
    }];
    
}

-(void)get:(NSString*)url param:(NSDictionary *)param head:(NSDictionary *)head endblock:(NREndBlock)endblock{
    
    [afManager GET:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        /*
         * 解析请求返回码
         */
        NSInteger code = [responseObject[@"code"] integerValue];
        if (code == 200) {
            DDLogVerbose(@"url:%@ \nheader:%@ \nparame:%@ \nresult:%@", url, afManager.requestSerializer, param, responseObject);
            NSDictionary *dic = responseObject[@"data"];
            if (endblock) {
                endblock(dic,nil);
            }
        }else{
            
            NSError *error = [NSError errorWithDomain:responseObject[@"message"] code:[responseObject[@"code"] integerValue] userInfo:responseObject];
            DDLogWarn(@"❗️url:%@ \nheader:%@ \nparame:%@ \nerror:%@", url, afManager.requestSerializer, param, responseObject);
            
            if (endblock) {
                endblock(nil,error);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        DDLogWarn(@"❗️url:%@ \nheader:%@ \nparame:%@ \nerror:%@", url, afManager.requestSerializer, param, error);
        if (endblock) {
            endblock(nil,[NSError errorWithDomain:@"加载失败" code:error.code userInfo:nil]);
        }
    }];
}



@end
