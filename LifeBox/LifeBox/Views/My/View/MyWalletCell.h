//
//  MyWalletCell.h
//  LifeBox
//
//  Created by Lucky on 2019/8/21.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WalletCellDelegate <NSObject>

- (void)walletCellSelectWithTag:(NSInteger)selectIndex;

@end

@interface MyWalletCell : UITableViewCell<UICollectionViewDelegate, UICollectionViewDataSource>

///钱包模块代理
@property (assign, nonatomic) id<WalletCellDelegate> walletDelegate;

@end

NS_ASSUME_NONNULL_END
