//
//  NetWorkRequest.h
//  LifeBox
//
//  Created by Lucky on 2019/8/4.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BASEURL [NSString stringWithFormat:@"%@:%@",\
[[Global_Variable shared] getSeverIp],\
[[Global_Variable shared] getDefaultPort]\
]

#define SEARCHURL [NSString stringWithFormat:@"%@:%@",[[Global_Variable shared] getSeverIp],[[Global_Variable shared] getSearchPort]]

NS_ASSUME_NONNULL_BEGIN


typedef void(^NREndBlock)(NSDictionary *_Nullable dataDict,  NSError *_Nullable error);


@interface NetWorkRequest : NSObject

/**
 * 请求接口路径
 */
@property (strong, nonatomic) NSString *requstLocation;

-(void)post:(NSString*)url param:(NSDictionary * _Nullable )param head:(NSDictionary *_Nullable )head endblock:(NREndBlock)endblock;

-(void)get:(NSString*)url param:(NSDictionary *_Nullable )param head:(NSDictionary *_Nullable )head endblock:(NREndBlock)endblock;

@end

NS_ASSUME_NONNULL_END
