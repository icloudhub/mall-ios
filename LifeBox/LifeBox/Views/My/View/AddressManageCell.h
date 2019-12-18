//
//  AddressManageCell.h
//  LifeBox
//
//  Created by Lucky on 2019/9/10.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressData.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddressManageCell : UITableViewCell

///姓名
@property (strong, nonatomic) UILabel *nameLab;

///电话
@property (strong, nonatomic) UILabel *phoneLab;

///地址
@property (strong, nonatomic) UILabel *addressLab;

///编辑Btn
@property (strong, nonatomic) UIButton *editBtn;

///默认
@property (strong, nonatomic) UILabel *defaultLab;

#pragma mark - 刷新数据
- (void)reloadCellUIWith:(AddressData *)data;

@end

NS_ASSUME_NONNULL_END
