//
//  CarBottomView.m
//  LifeBox
//
//  Created by admin on 2019/9/7.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "CarBottomView.h"

@implementation CarBottomView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}

-(void)configUI{

    /*
     * 全选Btn
     */
    self.allBtn = [[UIButton alloc] init];
    _allBtn.layer.borderWidth = 1;
    _allBtn.layer.borderColor = [RGBColor(189, 189, 189) CGColor];
    _allBtn.layer.cornerRadius = Scale750(18);
    [self addSubview:_allBtn];
 
    /*
     * 全选文字
     */
    self.allLab = [[UILabel alloc] init];
    _allLab.font = [UIFont systemFontOfSize:Scale750(30)];
    _allLab.text = @"全选";
    [self addSubview:_allLab];

    /*
     * 结算Btn
     */
    self.settlementBtn = [[UIButton alloc] init];
    _settlementBtn.backgroundColor = S_COGreenBack;
    _settlementBtn.layer.cornerRadius = Scale750(30);
    _settlementBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    [_settlementBtn setTitle:@"结算(0)" forState:UIControlStateNormal];
    [_settlementBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:_settlementBtn];

    
    /*
     * 合计lab
     */
    self.combinedLab = [[UILabel alloc] init];
    _combinedLab.font = [UIFont systemFontOfSize:Scale750(30)];
    _combinedLab.textAlignment = NSTextAlignmentRight;
    NSString *tempStr = @"合计: ¥0";
    _combinedLab.attributedText = [tempStr strChangFlagWithStr:@"¥0" Color:S_CORedText Font:Scale750(30)];
    [self addSubview:_combinedLab];

}

-(void)layoutSubviews{
    [super layoutSubviews];
    [_allBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(Scale750(30));
        make.centerY.mas_equalTo(self);
        make.width.height.mas_equalTo(Scale750(36));
    }];
    [_allLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.allBtn.mas_right).mas_offset(Scale750(10));
        make.centerY.mas_equalTo(self.allBtn);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    [_settlementBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-Scale750(30));
        make.centerY.mas_equalTo(self);
        make.width.mas_equalTo(Scale750(170));
        make.height.mas_equalTo(Scale750(60));
    }];
    [_combinedLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.settlementBtn.mas_left).mas_offset(-Scale750(15));
        make.centerY.mas_equalTo(self);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    
}
@end
