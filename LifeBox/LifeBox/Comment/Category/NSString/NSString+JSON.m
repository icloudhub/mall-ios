//
//  NSString+JSON.m
//  LifeBox
//
//  Created by admin on 2019/9/5.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NSString+JSON.h"

@implementation NSString (JSON)
// 字典转json字符串方法

+(NSString*)dicToJsonstr:(NSDictionary*)dict{

    NSError*error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];

    NSString*jsonString;
    if(!jsonData) {
       
        NSLog(@"%@",error);
   
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}
@end
