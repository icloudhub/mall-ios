//
//  ShoppingCarCell.h
//  LifeBox
//
//  Created by Lucky on 2019/8/28.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CellNumBtnDelegate <NSObject>

- (void)addBtnClicked:(UIButton *)btn;

- (void)reduceBtnClicked:(UIButton *)btn;

@end

@interface ShoppingCarCell : UITableViewCell

///选择Btn
@property (strong, nonatomic) UIButton *chooseBtn;

///商品图片
@property (strong, nonatomic) UIImageView *goodsImg;

///商品名称
@property (strong, nonatomic) UILabel *goodsName;

///商品描述
@property (strong, nonatomic) UILabel *goodsTitle;

///商品规格
@property (strong, nonatomic) UILabel *speciLab;

//商品价格
@property (strong, nonatomic) UILabel *goodsMoney;

///商品原价格
@property (strong, nonatomic) UILabel *original;

///添加Btn
@property (strong, nonatomic) UIButton *addBtn;

///减少Btn
@property (strong, nonatomic) UIButton *reduceBtn;

///数量Lab
@property (strong, nonatomic) UILabel *numLab;

///选择数量代理
@property (assign, nonatomic) id<CellNumBtnDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
