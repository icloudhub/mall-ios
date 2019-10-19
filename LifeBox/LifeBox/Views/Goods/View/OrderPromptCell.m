//
//  OrderPromptCell.m
//  LifeBox
//
//  Created by Lucky on 2019/10/15.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "OrderPromptCell.h"

@implementation OrderPromptCell

#pragma mark - 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
        self.backgroundColor = S_COBackground;
    }
    return self;
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 温馨提示
     */
    UILabel *title1 = [[UILabel alloc] init];
    title1.font = [UIFont systemFontOfSize:Scale750(30)];
    title1.textColor = RGBColor(235, 62, 49);
    title1.text = @"温馨提示:";
    [self.contentView addSubview:title1];
    [title1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(30));
        make.left.mas_equalTo(Scale750(30));
        make.width.height.mas_greaterThanOrEqualTo(10);
    }];
    /*
     * 副标题提示
     */
    UILabel *title2 = [[UILabel alloc] init];
    title2.font = [UIFont systemFontOfSize:Scale750(24)];
    title2.textColor = RGBColor(235, 62, 49);
    title2.text = @"您支付的每笔订单，我们都会抽出0.5元用于公益";
    [self.contentView addSubview:title2];
    [title2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title1.mas_bottom).mas_offset(Scale750(10));
        make.left.mas_equalTo(Scale750(30));
        make.width.height.mas_greaterThanOrEqualTo(10);
    }];
}

@end
