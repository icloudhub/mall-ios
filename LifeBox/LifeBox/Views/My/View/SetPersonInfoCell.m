//
//  SetPersonInfoCell.m
//  LifeBox
//
//  Created by Lucky on 2019/9/7.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "SetPersonInfoCell.h"

@implementation SetPersonInfoCell

#pragma mark - 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 昵称
     */
    _nickName = [[UILabel alloc] init];
    _nickName.font = [UIFont systemFontOfSize:Scale750(30)];
    _nickName.textColor = RGBColor(189, 189, 189);
    _nickName.text = @"天上掉下个小哥哥";
    [self.contentView addSubview:_nickName];
    [_nickName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(Scale750(30));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 头像
     */
    _headImg = [[UIImageView alloc] init];
    _headImg.layer.cornerRadius = Scale750(38);
    _headImg.image = [UIImage imageNamed:@"ic_avatar"];
    [self.contentView addSubview:_headImg];
    [_headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(-Scale750(30));
        make.width.height.mas_equalTo(Scale750(76));
    }];
    /*
     * 分割线
     */
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = S_COBackground;
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
}

@end
