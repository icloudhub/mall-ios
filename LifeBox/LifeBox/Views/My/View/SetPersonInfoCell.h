//
//  SetPersonInfoCell.h
//  LifeBox
//
//  Created by Lucky on 2019/9/7.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SetPersonInfoCell : UITableViewCell

///用户昵称
@property (strong, nonatomic) UILabel *nickName;

///头像
@property (strong, nonatomic) UIImageView *headImg;

///内容
@property (strong, nonatomic) UILabel *infoLab;

///箭头
@property (strong, nonatomic) UIImageView *arrowImg;

#pragma mark - 刷新UI
- (void)reloadCellUIWith:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
