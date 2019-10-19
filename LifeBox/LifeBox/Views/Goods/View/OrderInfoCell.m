//
//  OrderInfoCell.m
//  LifeBox
//
//  Created by Lucky on 2019/10/15.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "OrderInfoCell.h"

@implementation OrderInfoCell

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
     * 底部View
     */
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = S_COBackground;
    [self.contentView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(10));
        make.left.mas_equalTo(Scale750(30));
        make.right.mas_equalTo(-Scale750(30));
        make.bottom.mas_equalTo(0);
    }];
    /*
     * 商品图片
     */
    _goodsImg = [[UIImageView alloc] init];
    _goodsImg.backgroundColor = [UIColor redColor];
    [bottomView addSubview:_goodsImg];
    [_goodsImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(bottomView);
        make.left.mas_equalTo(Scale750(20));
        make.width.height.mas_equalTo(Scale750(140));
    }];
    /*
     * 价格
     */
    _goodsPrice = [[UILabel alloc] init];
    _goodsPrice.font = [UIFont systemFontOfSize:Scale750(30)];
    _goodsPrice.textColor = RGBColor(51, 51, 51);
    _goodsPrice.textAlignment = NSTextAlignmentRight;
    _goodsPrice.text = @"¥120.90";
    [bottomView addSubview:_goodsPrice];
    [_goodsPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_goodsImg.mas_top);
        make.right.mas_equalTo(-Scale750(20));
        make.width.mas_equalTo(Scale750(120));
        make.height.mas_greaterThanOrEqualTo(10);
    }];
    /*
     * 商品名称
     */
    _goodsName = [[UILabel alloc] init];
    _goodsName.font = [UIFont systemFontOfSize:Scale750(30)];
    _goodsName.textColor = RGBColor(51, 51, 51);
    _goodsName.text = @"高山苹果 400g";
    [bottomView addSubview:_goodsName];
    [_goodsName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_goodsImg.mas_top);
        make.left.mas_equalTo(_goodsImg.mas_right).mas_offset(Scale750(20));
        make.right.mas_equalTo(_goodsPrice.mas_left).mas_offset(-Scale750(10));
        make.height.mas_greaterThanOrEqualTo(10);
    }];
    /*
     * 商品副标题
     */
    _goodsTitle = [[UILabel alloc] init];
    _goodsTitle.font = [UIFont systemFontOfSize:Scale750(24)];
    _goodsTitle.textColor = RGBColor(189, 189, 189);
    _goodsTitle.text = @"果色艳丽，果肉鲜美";
    [bottomView addSubview:_goodsTitle];
    [_goodsTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_goodsName.mas_bottom).mas_offset(Scale750(5));
        make.left.mas_equalTo(_goodsName);
        make.width.height.mas_greaterThanOrEqualTo(10);
    }];
    /*
     * 商品规格
     */
    _goodsSpe = [[UILabel alloc] init];
    _goodsSpe.font = [UIFont systemFontOfSize:Scale750(20)];
    _goodsSpe.textColor = RGBColor(153, 153, 153);
    _goodsSpe.text = @"规格: 400g/盒";
    [bottomView addSubview:_goodsSpe];
    [_goodsSpe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_goodsTitle.mas_bottom).mas_offset(Scale750(15));
        make.left.mas_equalTo(_goodsName);
        make.width.height.mas_greaterThanOrEqualTo(1);
    }];
    /*
     * 商品数量
     */
    _goodsNum = [[UILabel alloc] init];
    _goodsNum.font = [UIFont systemFontOfSize:Scale750(20)];
    _goodsNum.textColor = RGBColor(153, 153, 153);
    _goodsNum.text = @"数量: 1盒";
    [bottomView addSubview:_goodsNum];
    [_goodsNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_goodsImg.mas_bottom);
        make.left.mas_equalTo(_goodsName);
        make.width.height.mas_greaterThanOrEqualTo(1);
    }];
}

@end
