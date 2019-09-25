//
//  BirthdaySheet.m
//  LifeBox
//
//  Created by Lucky on 2019/9/24.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "BirthdaySheet.h"

@implementation BirthdaySheet {
    ///日期选择器
    UIDatePicker *datePicker;
}

#pragma mark - 高度
- (NSInteger)viewHeight {
    return Scale750(480);
}

#pragma mark - 视图布局
- (void)makeSubview {
    /*
     * 取消Btn
     */
    UIButton *cannelBtn = [[UIButton alloc] init];
    cannelBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(28)];
    [cannelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cannelBtn setTitleColor:RGBColor(51, 51, 51) forState:UIControlStateNormal];
    cannelBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [cannelBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    cannelBtn.tag = 100;
    [self.bottomView addSubview:cannelBtn];
    [cannelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(30));
        make.left.mas_equalTo(Scale750(50));
        make.width.mas_equalTo(Scale750(100));
        make.height.mas_equalTo(Scale750(50));
    }];
    /*
     * 确实Btn
     */
    UIButton *sureBtn = [[UIButton alloc] init];
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(28)];
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [sureBtn setTitleColor:RGBColor(51, 51, 51) forState:UIControlStateNormal];
    sureBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [sureBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    sureBtn.tag = 101;
    [self.bottomView addSubview:sureBtn];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(30));
        make.right.mas_equalTo(-Scale750(50));
        make.width.mas_equalTo(Scale750(100));
        make.height.mas_equalTo(Scale750(50));
    }];
    /*
     * 时间选择器
     */
    datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    NSLocale *local = [NSLocale localeWithLocaleIdentifier:@"zh"];
    datePicker.locale = local;
    if (@available(iOS 13.0, *)) {
        datePicker.maximumDate = NSDate.now;
    } else {
        // Fallback on earlier versions
    }
    [datePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    [self.bottomView addSubview:datePicker];
    [datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(cannelBtn.mas_bottom).mas_offset(Scale750(30));
        make.left.mas_equalTo(Scale750(60));
        make.right.mas_equalTo(-Scale750(60));
        make.bottom.mas_equalTo(-Scale750(60));
    }];
}

#pragma mark - btn点击
- (void)btnClicked:(UIButton *)btn {
    if (btn.tag == 100) {
        [self dismissView];
    }else{
        // 把日期转成字符串.
        NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
        //设置日期格式
        fmt.dateFormat = @"yyyy-MM-dd";
        // 格式化日期.
        NSString *dateString =  [fmt stringFromDate:datePicker.date];
        DDLogVerbose(@"%@", dateString);
    }
}

@end
