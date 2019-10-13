//
//  SetInfoCell.m
//  LifeBox
//
//  Created by Lucky on 2019/9/7.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "SetInfoCell.h"

@implementation SetInfoCell

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
     * 标题
     */
    _titleLab = [[UILabel alloc] init];
    _titleLab.font = [UIFont systemFontOfSize:Scale750(30)];
    _titleLab.textColor = RGBColor(51, 51, 51);
    [self.contentView addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(Scale750(30));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 进入
     */
    _arrowImg = [[UIImageView alloc] init];
    _arrowImg.image = [UIImage imageNamed:@"ic_enter"];
    [self.contentView addSubview:_arrowImg];
    [_arrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(-Scale750(30));
        make.width.mas_equalTo(Scale750(32));
        make.height.mas_equalTo(Scale750(30));
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

#pragma mark - 刷新UI
- (void)reloadCellUIWith:(NSString *)title {
    _titleLab.text = title;
}

@end
