//
//  VerCodeInputView.m
//  LifeBox
//
//  Created by xiaoqy on 2019/10/14.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "VerCodeInputView.h"

@implementation VerCodeInputView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        [self configView];
    }
    return self;
    
}

-(void)configView{
    
    [self ug_border:COLOREE white:1];
    self.inputTF = [UITextField new];
    [self addSubview:_inputTF];
    
    self.getVerBtn = [UIButton new];
    [self addSubview:_getVerBtn];
    [_getVerBtn setBackgroundColor:UIColor.ug_random];
    [self ug_Radius:S_Radius];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    [_getVerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self);
        make.right.mas_equalTo(self);
        make.width.mas_equalTo(120);
    }];
    [_inputTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.mas_equalTo(self);
        make.right.mas_equalTo(self.getVerBtn.mas_left);
    }];
  
}
@end
