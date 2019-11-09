//
//  GoodsSpeSheet.m
//  LifeBox
//
//  Created by Lucky on 2019/9/27.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "GoodsSpeSheet.h"

@implementation GoodsSpeSheet {
    ///商品图片
    UIImageView *goodsImg;
    ///商品名称
    UILabel *goodsLab;
    ///商品价格
    UILabel *goodsPrice;
    ///商品规格
    UILabel *speLab;
    ///商品数量
    UILabel *numLab;
    ///数量
    NSInteger num;
}

#pragma mark - 高度
- (NSInteger)viewHeight {
    return Screen_height/2;
}

#pragma mark - 视图布局
- (void)makeSubview {
    num = 1;
    /*
     * 关闭Btn
     */
    UIButton *closeBtn = [[UIButton alloc] init];
    [closeBtn setBackgroundImage:[UIImage imageNamed:@"ic_address_close"] forState:UIControlStateNormal];
    [closeBtn setBackgroundImage:[UIImage imageNamed:@"ic_address_close"] forState:UIControlStateHighlighted];
    [closeBtn bk_addEventHandler:^(id sender) {
        [self dismissView];
    } forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(30));
        make.right.mas_equalTo(-Scale750(30));
        make.width.height.mas_equalTo(Scale750(50));
    }];
    /*
     * 商品图片
     */
    goodsImg = [[UIImageView alloc] init];
    goodsImg.backgroundColor = [UIColor redColor];
    goodsImg.layer.cornerRadius = Scale750(8);
    [self.bottomView addSubview:goodsImg];
    [goodsImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(30));
        make.left.mas_equalTo(Scale750(30));
        make.width.height.mas_equalTo(Scale750(180));
    }];
    /*
     * 商品名称
     */
    goodsLab = [[UILabel alloc] init];
    goodsLab.font = [UIFont systemFontOfSize:Scale750(30)];
    goodsLab.textColor = RGBColor(51, 51, 51);
    goodsLab.numberOfLines = 2;
    goodsLab.text = @"高山苹果 400g";
    [self.bottomView addSubview:goodsLab];
    [goodsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(goodsImg);
        make.left.mas_equalTo(goodsImg.mas_right).mas_offset(Scale750(20));
        make.right.mas_equalTo(closeBtn.mas_left).mas_offset(-Scale750(20));
        make.height.mas_greaterThanOrEqualTo(Scale750(40));
    }];
    /*
     * 商品价格
     */
    goodsPrice = [[UILabel alloc] init];
    goodsPrice.font = [UIFont systemFontOfSize:Scale750(25)];
    goodsPrice.textColor = S_CORedText;
    NSString *priceStr = @"¥12.90";
    goodsPrice.attributedText = [priceStr strChangFlagWithStr:@"12" Color:S_CORedText Font:Scale750(35)];
    [self.bottomView addSubview:goodsPrice];
    [goodsPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(goodsLab.mas_bottom).mas_offset(Scale750(20));
        make.left.mas_equalTo(goodsLab);
        make.width.height.mas_greaterThanOrEqualTo(Scale750(40));
    }];
    /*
     * 上分割线
     */
    UIView *lineView1 = [[UIView alloc] init];
    lineView1.backgroundColor = COLOREE;
    [self.bottomView addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(goodsImg.mas_bottom).mas_offset(Scale750(30));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    /*
     * 规格
     */
    speLab = [[UILabel alloc] init];
    speLab.font = [UIFont systemFontOfSize:Scale750(30)];
    speLab.textColor = RGBColor(51, 51, 51);
    speLab.text = @"规格: 400g/盒";
    [self.bottomView addSubview:speLab];
    [speLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView1.mas_bottom).mas_offset(Scale750(30));
        make.left.mas_equalTo(Scale750(30));
        make.width.height.mas_greaterThanOrEqualTo(Scale750(20));
    }];
    /*
     * 下分割线
     */
    UIView *lineView2 = [[UIView alloc] init];
    lineView2.backgroundColor = COLOREE;
    [self.bottomView addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(speLab.mas_bottom).mas_offset(Scale750(30));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    /*
     * 购物数量显示
     */
    UILabel *numTlab = [[UILabel alloc] init];
    numTlab.font = [UIFont systemFontOfSize:Scale750(30)];
    numTlab.textColor = RGBColor(51, 51, 51);
    numTlab.text = @"购物数量";
    [self.bottomView addSubview:numTlab];
    [numTlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView2.mas_bottom).mas_offset(Scale750(30));
        make.left.mas_equalTo(Scale750(30));
        make.width.height.mas_greaterThanOrEqualTo(Scale750(10));
    }];
    /*
     * 加号Btn
     */
    UIButton *addBtn = [[UIButton alloc] init];
    [addBtn setBackgroundImage:[UIImage imageNamed:@"ic_plus_goods"] forState:UIControlStateNormal];
    [addBtn setBackgroundImage:[UIImage imageNamed:@"ic_plus_goods"] forState:UIControlStateHighlighted];
    addBtn.tag = 1000;
    [addBtn addTarget:self action:@selector(numBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:addBtn];
    [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(numTlab);
        make.right.mas_equalTo(-Scale750(30));
        make.width.height.mas_equalTo(Scale750(44));
    }];
    /*
     * 数量
     */
    numLab = [[UILabel alloc] init];
    numLab.textColor = RGBColor(51, 51, 51);
    numLab.font = [UIFont systemFontOfSize:Scale750(30)];
    numLab.textAlignment = NSTextAlignmentCenter;
    numLab.text = [NSString stringWithFormat:@"%ld", (long)num];
    [self.bottomView addSubview:numLab];
    [numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.height.mas_equalTo(addBtn);
        make.right.mas_equalTo(addBtn.mas_left).mas_offset(-Scale750(10));
        make.width.mas_equalTo(Scale750(70));
    }];
    /*
     * 减号Btn
     */
    UIButton *reduceBtn = [[UIButton alloc] init];
    [reduceBtn setBackgroundImage:[UIImage imageNamed:@"ic_less_goods"] forState:UIControlStateNormal];
    [reduceBtn setBackgroundImage:[UIImage imageNamed:@"ic_less_goods"] forState:UIControlStateHighlighted];
    reduceBtn.tag = 1001;
    [reduceBtn addTarget:self action:@selector(numBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:reduceBtn];
    [reduceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(addBtn);
        make.right.mas_equalTo(numLab.mas_left).mas_offset(-Scale750(10));
        make.width.height.mas_equalTo(Scale750(44));
    }];
    /*
     * 加入购物车
     */
    UIButton *addShop = [[UIButton alloc] init];
    addShop.backgroundColor = S_COGreenBack;
    addShop.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    [addShop setTitle:@"加入购物车" forState:UIControlStateNormal];
    [addShop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.bottomView addSubview:addShop];
    [addShop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.bottomView.mas_bottom).mas_offset(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(90));
    }];
}

#pragma mark - 数量选择点击
- (void)numBtnClicked:(UIButton *)btn {
    if (btn.tag == 1000) {
        num = num + 1;
    }else{
        if (num == 1) {
            return;
        }
        num = num - 1;
    }
    numLab.text = [NSString stringWithFormat:@"%ld", (long)num];
}

@end
