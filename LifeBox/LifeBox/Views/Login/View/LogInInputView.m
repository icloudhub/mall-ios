//
//  LogInInputView.m
//  LifeBox
//
//  Created by admin on 2019/8/16.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "LogInInputView.h"

@implementation LogInInputView

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
    [self ug_Radius:S_Radius];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    [_inputTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
}
@end
