//
//  OrderViewCell.h
//  LifeBox
//
//  Created by Lucky on 2019/9/6.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrderViewCell : UITableViewCell

///订单号
@property (strong, nonatomic) UILabel *orderNumLab;

///时间Lab
@property (strong, nonatomic) UILabel *timeLab;

///状态Lab
@property (strong, nonatomic) UILabel *stateLab;

///状态Img
@property (strong, nonatomic) UIImageView *stateImg;

///商品图片
@property (strong, nonatomic) UIImageView *goodsImg;

///商品名称
@property (strong, nonatomic) UILabel *goodsName;

///商品数量
@property (strong, nonatomic) UILabel *goodsNum;

///商品价格
@property (strong, nonatomic) UILabel *goodsPrice;

///商品合计个数
@property (strong, nonatomic) UILabel *goodsAllNum;

///商品应付价格
@property (strong, nonatomic) UILabel *allPrice;

///类型按钮1
@property (strong, nonatomic) UIButton *leftBtn;

///类型按钮2
@property (strong, nonatomic) UIButton *rightBtn;

///类型按钮3
@property (strong, nonatomic) UIButton *otherBtn;

@end

NS_ASSUME_NONNULL_END