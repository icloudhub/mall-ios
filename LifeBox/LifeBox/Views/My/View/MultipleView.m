//
//  MultipleView.m
//  LifeBox
//
//  Created by Lucky on 2019/12/29.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "MultipleView.h"

@implementation MultipleView {
    ///商品个数数组
    NSMutableArray *goodsArr;
    ///更多Lab
    UIImageView *moreImg;
}

#pragma mark - 初始化
- (instancetype)init {
    self = [super init];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)setDataArr:(NSArray *)dataArr {
    goodsArr = [[NSMutableArray alloc] init];
    NSInteger i=0;
    for (NSString *str in dataArr) {
        UIImageView *view = [[UIImageView alloc] init];
        view.backgroundColor = [UIColor yellowColor];
        [view sd_setImageWithURL:UG_URL(str) placeholderImage:[UIImage imageWithIcon:@"fa-github" backgroundColor:UIColor.clearColor iconColor:COLOR23 andSize:CGSizeMake(20, 20)]];
        [self addSubview:view];
        [goodsArr addObject:view];
        i++;
        if (i==3) {
            break;
        }
    }
    /*
     * 更多
     */
    moreImg = [[UIImageView alloc] init];
    moreImg.contentMode = UIViewContentModeScaleAspectFill;
    moreImg.image = [UIImage imageNamed:@"orderMoreImg"];
    [self addSubview:moreImg];
    
}

#pragma mark - 创建UI
- (void)createView {
    
}

- (void)layoutSubviews {
    CGFloat width = self.frame.size.width;
    CGFloat viewW = width - (4*Scale750(120) + 4*Scale750(20));
    if (goodsArr.count>0) {
            // 实现masonry水平固定间隔方法
        [goodsArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:Scale750(120) leadSpacing:Scale750(20) tailSpacing:viewW];
        // 设置array的垂直方向的约束
        [goodsArr mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(Scale750(15));
            make.width.height.mas_equalTo(Scale750(120));
        }];
    }

    [moreImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-Scale750(15));
        make.right.mas_equalTo(-viewW + Scale750(60));
        make.width.mas_equalTo(Scale750(50));
        make.height.mas_equalTo(Scale750(15));
    }];
}



@end
