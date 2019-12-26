//
//  AddressManageCell.m
//  LifeBox
//
//  Created by Lucky on 2019/9/10.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "AddressManageCell.h"

@implementation AddressManageCell {
    UIView *line;
}

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
     * 姓名
     */
    _nameLab = [[UILabel alloc] init];
    _nameLab.font = [UIFont systemFontOfSize:Scale750(30)];
    _nameLab.textColor = RGBColor(51, 51, 51);
    [self.contentView addSubview:_nameLab];
    /*
     * 电话
     */
    _phoneLab = [[UILabel alloc] init];
    _phoneLab.font = [UIFont systemFontOfSize:Scale750(30)];
    _phoneLab.textColor = RGBColor(189, 189, 189);
    [self.contentView addSubview:_phoneLab];
    /*
     * 默认
     */
    _defaultLab = [[UILabel alloc] init];
    _defaultLab.layer.cornerRadius = Scale750(4);
    _defaultLab.backgroundColor = RGBColor(252, 225, 222);
    _defaultLab.font = [UIFont systemFontOfSize:Scale750(24)];
    _defaultLab.textColor = RGBColor(250, 75, 37);
    _defaultLab.textAlignment = NSTextAlignmentCenter;
    _defaultLab.text = @"默认";
    [self.contentView addSubview:_defaultLab];
    /*
     * 编辑按钮
     */
    _editBtn = [[UIButton alloc] init];
    _editBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    [_editBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [_editBtn setTitleColor:RGBColor(189, 189, 189) forState:UIControlStateNormal];
    [self.contentView addSubview:_editBtn];
    /*
     * 分割线
     */
    line = [[UIView alloc] init];
    line.backgroundColor = RGBColor(189, 189, 189);
    [self.contentView addSubview:line];
    /*
     * 地址
     */
    _addressLab = [[UILabel alloc] init];
    _addressLab.numberOfLines = 0;
    _addressLab.font = [UIFont systemFontOfSize:Scale750(24)];
    _addressLab.textColor = RGBColor(51, 51, 51);
    [self.contentView addSubview:_addressLab];
}

#pragma mark - 适配
- (void)layoutIfNeeded {
    [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(30));
        make.left.mas_equalTo(Scale750(30));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    [_phoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->_nameLab);
        make.left.mas_equalTo(self->_nameLab.mas_right).mas_offset(Scale750(30));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    [_defaultLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->_nameLab);
        make.top.mas_equalTo(self->_nameLab.mas_bottom).mas_offset(Scale750(10));
        make.width.mas_equalTo(Scale750(74));
        make.height.mas_equalTo(Scale750(34));
    }];
    [_editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-Scale750(30));
        make.centerY.mas_equalTo(self);
        make.width.mas_equalTo(Scale750(100));
        make.height.mas_equalTo(Scale750(60));
    }];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.right.mas_equalTo(self->_editBtn.mas_left);
        make.width.mas_equalTo(1);
        make.height.mas_equalTo(Scale750(60));
    }];
    [_addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->_defaultLab.mas_right).mas_offset(Scale750(10));
        make.top.mas_equalTo(self->_defaultLab);
        make.right.mas_equalTo(self->line.mas_left).mas_offset(-Scale750(40));
        make.height.mas_greaterThanOrEqualTo(0);
    }];
}

#pragma mark - 刷新数据
- (void)reloadCellUIWith:(AddressData *)data {
    /*
     * 姓名
     */
    _nameLab.text = data.name;
    /*
     * 电话号码
     */
    _phoneLab.text = data.phoneNumber;
    /*
     * 是否默认
     */
    if ([data.defaultStatus intValue] == 1) {
        _defaultLab.hidden = NO;
    }else{
        _defaultLab.hidden = YES;
    }
    /*
     * 地址
     */
    NSString *addressStr = [NSString stringWithFormat:@"%@%@%@%@", data.province, data.city, data.region, data.detailAddress];
    _addressLab.text = addressStr;
}


@end
