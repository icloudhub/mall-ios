//
//  NSArray+UG.m
//  LifeBox
//
//  Created by admin on 2020/4/2.
//  Copyright © 2020 Lucky. All rights reserved.
//

#import "NSArray+UG.h"



@implementation NSArray (UG)
/**
 判断两个数组中元素是否一致，不管顺序
 */
-(BOOL)isEqualItem:(NSArray*)array{
    if (self.count != array.count) {
        return NO;
    }
    bool bol = false;
    //创建俩新的数组
    NSMutableArray *oldArr = [NSMutableArray arrayWithArray:self];
    NSMutableArray *newArr = [NSMutableArray arrayWithArray:array];
      
    //对数组1排序。
    [oldArr sortUsingComparator:^NSComparisonResult(id obj1, id obj2){
      return obj1 > obj2;
    }];
     
    ////上个排序好像不起作用，应采用下面这个
    [oldArr sortUsingComparator:^NSComparisonResult(id obj1, id obj2){return [obj1 localizedStandardCompare: obj2];}];
      
    //对数组2排序。
    [newArr sortUsingComparator:^NSComparisonResult(id obj1, id obj2){
       return obj1 > obj2;
       }];
    ////上个排序好像不起作用，应采用下面这个
    [newArr sortUsingComparator:^NSComparisonResult(id obj1, id obj2){return [obj1 localizedStandardCompare: obj2];}];
     
      
    if (newArr.count == oldArr.count) {
        
      bol = true;
      for (int16_t i = 0; i < oldArr.count; i++) {
          
        id c1 = [oldArr objectAtIndex:i];
        id newc = [newArr objectAtIndex:i];
         
        if (![newc isEqualToString:c1]) {
         bol = false;
         break;
         }
       }
     }
      
    return bol;
}

@end
