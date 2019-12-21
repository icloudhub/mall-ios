//
//  AddressChooseCell.h
//  LifeBox
//
//  Created by Lucky on 2019/9/22.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AreaData.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddressChooseCell : UITableViewCell

///名称
@property (strong, nonatomic) UILabel *nameLab;

///图标
@property (strong, nonatomic) UIImageView *markImg;

#pragma mark - 刷新数据
- (void)reloadCellUIWithData:(AreaData *)data;

@end

NS_ASSUME_NONNULL_END
