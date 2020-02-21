//
//  CategoryModel.h
//  LifeBox
//
//  Created by admin on 2020/2/13.
//  Copyright © 2020 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CategoryModel : NSObject


@property(strong, nonatomic) NSString* icon; // (string, optional): 图标 ,
@property(strong, nonatomic) NSString* id; // (integer, optional),
@property(strong, nonatomic) NSString* keywords; // (string, optional),
@property(strong, nonatomic) NSString* level; //  (integer, optional): 分类级别：0->1级；1->2级 ,
@property(strong, nonatomic) NSString* name; //  (string, optional),
@property(strong, nonatomic) NSString* navStatus; //  (integer, optional): 是否显示在导航栏：0->不显示；1->显示 ,
@property(strong, nonatomic) NSString* parentId; //  (integer, optional): 上机分类的编号：0表示一级分类 ,
@property(strong, nonatomic) NSString* productCount; // (integer, optional),
@property(strong, nonatomic) NSString* productUnit; //  (string, optional),
@property(strong, nonatomic) NSString* showStatus; //  (integer, optional): 显示状态：0->不显示；1->显示 ,


@end

NS_ASSUME_NONNULL_END
