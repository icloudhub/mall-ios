//
//  MyOrderCell.h
//  LifeBox
//
//  Created by Lucky on 2019/8/21.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol OrderCellDelegate <NSObject>

- (void)orderCellSelectWithTag:(NSInteger)selectIndex;

@end

@interface MyOrderCell : UITableViewCell<UICollectionViewDelegate, UICollectionViewDataSource>

///订单模块代理
@property (assign, nonatomic) id<OrderCellDelegate> orderDelegate;

@end

NS_ASSUME_NONNULL_END
