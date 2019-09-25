//
//  SetPersonInfoCell.m
//  LifeBox
//
//  Created by Lucky on 2019/9/7.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "SetPersonInfoCell.h"

@implementation SetPersonInfoCell {
    ///第一段标题数组
    NSArray *oneArr;
    ///第二段标题数组
    NSArray *twoArr;
    ///第三段标题数组
    NSArray *thrArr;
}

#pragma mark - 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
        /*
         * cell标题数据封装
         */
        oneArr = [[NSArray alloc] initWithObjects:@"头像", @"昵称", nil];
        twoArr = [[NSArray alloc] initWithObjects:@"姓名", @"手机号", @"微信号", nil];
        thrArr = [[NSArray alloc] initWithObjects:@"生日", @"性别", nil];
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
    _nickName.textColor = RGBColor(153, 153, 153);
    _nickName.text = @"头像";
    [self.contentView addSubview:_nickName];
    [_nickName mas_makeConstraints:^(MASConstraintMaker *make) {
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
     * 内容
     */
    _infoLab = [[UILabel alloc] init];
    _infoLab.font = [UIFont systemFontOfSize:Scale750(30)];
    _infoLab.text = @"我就是我";
    [self.contentView addSubview:_infoLab];
    [_infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(_arrowImg.mas_left).mas_offset(-Scale750(10));
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

#pragma mark - 刷新UI
- (void)reloadCellUIWith:(NSIndexPath *)indexPath {
    /*
     * UI布局
     */
    if (indexPath.section == 0 && indexPath.row == 0) {
        _headImg.hidden = NO;
        _infoLab.hidden = YES;
    }else{
        _headImg.hidden = YES;
        _infoLab.hidden = NO;
    }
    /*
     * 标题赋值
     */
    if (indexPath.section == 0) {
        _nickName.text = [oneArr objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 1) {
        _nickName.text = [twoArr objectAtIndex:indexPath.row];
    }else{
        _nickName.text = [thrArr objectAtIndex:indexPath.row];
    }
}

@end
