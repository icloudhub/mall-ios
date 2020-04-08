//
//  OrderViewCell.h
//  LifeBox
//
//  Created by Lucky on 2019/9/6.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderListData.h"


NS_ASSUME_NONNULL_BEGIN


@interface OrderViewHeadView : UIView

///订单号
@property (strong, nonatomic) UILabel *orderNumLab;

///时间Lab
@property (strong, nonatomic) UILabel *timeLab;

///状态Lab
@property (strong, nonatomic) UILabel *stateLab;

// 状态图片
@property (strong, nonatomic) UIImageView *stateImg;

@end

@interface OrderViewBodyView : UIView <UICollectionViewDelegate, UICollectionViewDataSource>

@property(strong, nonatomic) UICollectionView *collectionView;

@property(strong, nonatomic) NSArray *dataList;

@end

@interface OrderViewFooterView : UIView


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

@interface OrderViewCell : UITableViewCell

@property (strong, nonatomic) UIView *coustomView;
@property (strong, nonatomic) OrderViewHeadView *headView;
@property (strong, nonatomic) OrderViewBodyView *bodyView;
@property (strong, nonatomic) OrderViewFooterView *fotterView;

-(void)reloadUI:(OrderListData*)data;

@end

NS_ASSUME_NONNULL_END
