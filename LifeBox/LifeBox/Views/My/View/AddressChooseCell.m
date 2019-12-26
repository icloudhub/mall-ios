//
//  AddressChooseCell.m
//  LifeBox
//
//  Created by Lucky on 2019/9/22.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "AddressChooseCell.h"

@implementation AddressChooseCell

#pragma mark - 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self createUI];
    }
    return self;
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 名称
     */
    _nameLab = [[UILabel alloc] init];
    _nameLab.font = [UIFont systemFontOfSize:Scale750(24)];
    _nameLab.textColor = RGBColor(51, 51, 51);
    [self.contentView addSubview:_nameLab];
    [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(Scale750(40));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 图标
     */
    _markImg = [[UIImageView alloc] init];
    _markImg.image = [UIImage imageNamed:@"ic_selected_address"];
    [self.contentView addSubview:_markImg];
    [_markImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.right.mas_equalTo(-Scale750(40));
        make.width.height.mas_equalTo(Scale750(30));
    }];
}

#pragma mark - 刷新数据
- (void)reloadCellUIWithData:(AreaData *)data {
    _nameLab.text = data.name;
    if ([data.isSelect intValue] == 1) {
        _markImg.hidden = NO;
    }else{
        _markImg.hidden = YES;
    }
}

@end
