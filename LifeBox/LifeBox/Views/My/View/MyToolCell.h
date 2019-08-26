//
//  MyToolCell.h
//  LifeBox
//
//  Created by Lucky on 2019/8/21.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TooltCellDelegate <NSObject>

- (void)toolCellSelectWithTag:(NSInteger)selectIndex;

@end

@interface MyToolCell : UITableViewCell<UICollectionViewDelegate, UICollectionViewDataSource>

///工具模块代理
@property (assign, nonatomic) id<TooltCellDelegate> tooltDelegate;

@end

NS_ASSUME_NONNULL_END
