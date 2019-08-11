//
//  NetWorkRequest.h
//  LifeBox
//
//  Created by Lucky on 2019/8/4.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * 网络请求类型
 */
typedef enum {
    GET,
    POST,
}REQUEST_TYPE;

/**
 * 网络请求业务类型
 */
typedef enum {
    DEFAULT,
    SEARCH,
}BUSINESS_TYPE;

/**
 开始请求的Block
 @param interFaceName 返回对应的接口名
 */
typedef void(^BeginBlock)(NSString * interFaceName);

/**
 结束请求block
 @param dataDict 返回的数据
 @param respCode 返回的请求码
 @param interFaceName 返回的接口名字
 @param error 请求错误
 */
typedef void(^FinishBlock)(NSDictionary *_Nullable dataDict, NSInteger respCode, NSString *interFaceName, NSError *_Nullable error);

@interface NetWorkRequest : NSObject

#pragma mark - 属性和变量
/**
 * 请求类型
 */
@property (assign, nonatomic) REQUEST_TYPE requestType;

/**
 * 请求业务类型
 */
@property (assign, nonatomic) BUSINESS_TYPE businessType;

/**
 * 请求接口路径
 */
@property (strong, nonatomic) NSString *requstLocation;

/**
 * 开始请求的Block
 */
@property (copy, nonatomic) BeginBlock beginBlock;

/**
 * 请求完成的block回调
 */
@property (copy, nonatomic) FinishBlock finishBlock;

#pragma mark - 初始化
/**
 * 单利初始化
 */
//+ (instancetype)shared;

#pragma mark - 初始化网络请求
/**
 网络请求初始化
 @param params 请求入参
 */
- (void)requestHttpWithParams:(nullable NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
