//
//  OrderTopCell.m
//  LifeBox
//
//  Created by Lucky on 2019/10/15.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "OrderTopCell.h"

@implementation OrderTopCell

#pragma mark - 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 时间图片
     */
    UIImageView *timeImg = [[UIImageView alloc] init];
    timeImg.image = [UIImage imageNamed:@"ic_time"];
    [self.contentView addSubview:timeImg];
    [timeImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(Scale750(30));
        make.width.height.mas_equalTo(Scale750(34));
    }];
    /*
     * 送达方式显示
     */
    UILabel *typeLab = [[UILabel alloc] init];
    typeLab.font = [UIFont systemFontOfSize:Scale750(30)];
    typeLab.textColor = RGBColor(102, 102, 102);
    typeLab.text = @"送达方式";
    [self.contentView addSubview:typeLab];
    [typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(timeImg);
        make.left.mas_equalTo(timeImg.mas_right).mas_offset(Scale750(20));
        make.width.height.mas_greaterThanOrEqualTo(10);
    }];
    /*
     * 进入图片
     */
    UIImageView *enterImg = [[UIImageView alloc] init];
    enterImg.image = [UIImage imageNamed:@"ic_enter"];
    [self.contentView addSubview:enterImg];
    [enterImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-Scale750(20));
        make.centerY.mas_equalTo(self);
        make.width.mas_equalTo(Scale750(32));
        make.height.mas_equalTo(Scale750(30));
    }];
    /*
     * 时间显示
     */
    _timeLab = [[UILabel alloc] init];
    _timeLab.font = [UIFont systemFontOfSize:Scale750(24)];
    _timeLab.textColor = RGBColor(100, 185, 130);
    _timeLab.text = @"选择送达时间";
    [self.contentView addSubview:_timeLab];
    [_timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.right.mas_equalTo(enterImg.mas_left).mas_offset(-Scale750(20));
        make.width.height.mas_greaterThanOrEqualTo(10);
    }];
}

@end
