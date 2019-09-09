//
//  FeedbackController.m
//  LifeBox
//
//  Created by Lucky on 2019/9/7.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "FeedbackController.h"

@interface FeedbackController ()<UITextViewDelegate> {
    ///问题类型
    UILabel *typeLab;
    ///输入View
    UITextView *textView;
    ///标题
    UILabel *textLab;
    ///输入提示
    UILabel *inputLab;
}

@end

@implementation FeedbackController

#pragma mark - 视图层
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setWhiteNaviWithTitle:@"问题反馈"];
    self.view.backgroundColor = S_COBackground;
    [self createUI];
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 提示文字
     */
    UILabel *textLab = [[UILabel alloc] init];
    textLab.font = [UIFont systemFontOfSize:Scale750(30)];
    textLab.textColor = RGBColor(153, 153, 153);
    textLab.text = @"对您给予的反馈和支持，深表感谢!";
    [self.view addSubview:textLab];
    [textLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(50));
        make.left.mas_equalTo(Scale750(30));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 选择类型View
     */
    UIView *chooseType = [[UIView alloc] init];
    chooseType.layer.cornerRadius = Scale750(5);
    chooseType.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:chooseType];
    [chooseType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(textLab.mas_bottom).mas_offset(Scale750(30));
        make.left.mas_equalTo(Scale750(30));
        make.right.mas_equalTo(-Scale750(30));
        make.height.mas_equalTo(Scale750(90));
    }];
    /*
     * 类型Lab
     */
    typeLab = [[UILabel alloc] init];
    typeLab.font = [UIFont systemFontOfSize:Scale750(30)];
    typeLab.textColor = RGBColor(153, 153, 153);
    typeLab.text = @"请选择问题类型";
    [chooseType addSubview:typeLab];
    [typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(chooseType);
        make.left.mas_equalTo(Scale750(20));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 箭头指示
     */
    UIImageView *arrowImg = [[UIImageView alloc] init];
    arrowImg.image = [UIImage imageNamed:@"ic_drop_down"];
    [chooseType addSubview:arrowImg];
    [arrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(chooseType);
        make.right.mas_equalTo(-Scale750(20));
        make.width.mas_equalTo(Scale750(30));
        make.height.mas_equalTo(Scale750(30));
    }];
    /*
     * 出发Btn
     */
    UIButton *selectBtn = [[UIButton alloc] init];
    [selectBtn addTarget:self action:@selector(selectBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [chooseType addSubview:selectBtn];
    [selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(chooseType);
        make.width.mas_equalTo(Scale750(280));
    }];
    /*
     * 输入View
     */
    UIView *inputView = [[UIView alloc] init];
    inputView.layer.cornerRadius = Scale750(5);
    inputView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:inputView];
    [inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(chooseType.mas_bottom).mas_offset(Scale750(30));
        make.left.mas_equalTo(Scale750(30));
        make.right.mas_equalTo(-Scale750(30));
        make.height.mas_equalTo(Scale750(280));
    }];
    /*
     * 输入
     */
    textView = [[UITextView alloc] init];
    //字体
    textView.font = [UIFont systemFontOfSize:Scale750(30)];
    //字体颜色
    textView.textColor = RGBColor(153, 153, 153);
    textView.delegate = self;
    [inputView addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(30));
        make.left.mas_equalTo(Scale750(20));
        make.right.mas_equalTo(-Scale750(20));
        make.bottom.mas_equalTo(-Scale750(30));
    }];
    /*
     * 输入提示
     */
    inputLab = [[UILabel alloc] init];
    inputLab.font = [UIFont systemFontOfSize:Scale750(30)];
    inputLab.textColor = RGBColor(153, 153, 153);
    inputLab.text = @"请输入问题描述";
    [textView addSubview:inputLab];
    [inputLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 提交Btn
     */
    UIButton *submit = [[UIButton alloc] init];
    submit.layer.cornerRadius = Scale750(45);
    submit.titleLabel.font = [UIFont systemFontOfSize:Scale750(35)];
    [submit setBackgroundColor:S_COGreenBack];
    [submit setTitle:@"提交" forState:UIControlStateNormal];
    [submit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:submit];
    [submit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(inputView.mas_bottom).mas_offset(Scale750(110));
        make.left.mas_equalTo(Scale750(30));
        make.right.mas_equalTo(-Scale750(30));
        make.height.mas_equalTo(Scale750(90));
    }];
    [self.view addSubview:submit];
}

#pragma mark - 选择类型点击
- (void)selectBtnClick {
    
}

#pragma mark - UITextView代理
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSString *tempStr = [textView.text stringByReplacingCharactersInRange:range withString:text];
    if (tempStr.length == 0) {
        inputLab.hidden = NO;
    }else{
        inputLab.hidden = YES;
        //控制文本输入内容
        if (range.location >= 100) {
            [UIView ug_msg:@"最多输入100字!"];
            return  NO;
        }
    }
    if ([text isEqualToString:@"\n"]){
        //禁止输入换行
        return NO;
    }
    
    return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    inputLab.hidden = YES;
    return YES;
}


@end
