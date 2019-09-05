//
//  InvitationCell.h
//  LifeBox
//
//  Created by Lucky on 2019/9/4.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InvitationCell : UITableViewCell

#pragma mark - 属性
///用户头像
@property (strong, nonatomic) UIImageView *headImg;

///用户名称
@property (strong, nonatomic) UILabel *nameLab;

///时间
@property (strong, nonatomic) UILabel *timeLab;

///获得金额
@property (strong, nonatomic) UILabel *moneyLab;

@end

NS_ASSUME_NONNULL_END
