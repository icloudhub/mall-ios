//
//  InvitationCell.m
//  LifeBox
//
//  Created by Lucky on 2019/9/4.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "InvitationCell.h"

@implementation InvitationCell

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
     * 顶部分割线
     */
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = S_COLine;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    /*
     * 头像
     */
    _headImg = [[UIImageView alloc] init];
    _headImg.backgroundColor = [UIColor redColor];
    _headImg.layer.cornerRadius = Scale750(25);
    [self addSubview:_headImg];
    [_headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(Scale750(30));
        make.centerY.mas_equalTo(self.mas_centerY);
        make.width.height.mas_equalTo(Scale750(50));
    }];
    /*
     * 昵称
     */
    _nameLab = [[UILabel alloc] init];
    _nameLab.font = [UIFont systemFontOfSize:Scale750(30)];
    _nameLab.textColor = RGBColor(102, 102, 102);
    _nameLab.text = @"我是昵称";
    [self addSubview:_nameLab];
    [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->_headImg.mas_right).mas_offset(Scale750(30));
        make.centerY.mas_equalTo(self.mas_centerY).mas_offset(-Scale750(15));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
}

@end
