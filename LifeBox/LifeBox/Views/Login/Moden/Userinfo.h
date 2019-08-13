//
//  Userinfo.h
//  LifeBox
//
//  Created by admin on 2019/8/13.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Userinfo : NSObject

@property(assign, nonatomic) NSInteger id;//
@property(assign, nonatomic) NSInteger memberLevelId;//等级id
@property(strong, nonatomic) NSString *username;//用户名
@property(strong, nonatomic) NSString *nickname;//昵称
@property(strong, nonatomic) NSString *phone;//手机号码
@property(assign, nonatomic) NSInteger status;//状态
@property(strong, nonatomic) NSString *createTime;//注册时间
@property(assign, nonatomic) NSInteger gender;//性别
@property(strong, nonatomic) NSString *birthday;//生日
@property(strong, nonatomic) NSString *city;//城市
@property(strong, nonatomic) NSString *job;//职业
@property(strong, nonatomic) NSString *personalizedSignature;//个性签名
@property(strong, nonatomic) NSString *integration;//积分

@end

NS_ASSUME_NONNULL_END
