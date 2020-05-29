//
//  ChangeNickNameController.m
//  LifeBox
//
//  Created by Lucky on 2019/9/23.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "ChangeNickNameController.h"

@interface ChangeNickNameController ()
    ///输入View
@property(strong, nonatomic)    UIView *inputView;
    ///输入框
@property(strong, nonatomic)    UITextField *infoTF;
    ///提示Lab
@property(strong, nonatomic)    UILabel *titleLab;
    ///保存按钮
@property(strong, nonatomic)    UIButton *sureBtn;

@end

@implementation ChangeNickNameController

#pragma mark - 视图层
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"修改昵称"];
    self.view.backgroundColor = S_COBackground;
    [self createUI];
    [self updateUI];
}

#pragma mark - 创建UI
- (void)createUI {
    /*
     * 输入View
     */

    [self.view addSubview:self.inputView];
    /*
     * 输入框
     */
    self.infoTF = [[UITextField alloc] init];
    _infoTF.borderStyle = UITextBorderStyleNone;
    _infoTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _infoTF.textColor = RGBColor(51, 51, 51);
    NSString *nameHolder = @"请输入昵称";
    NSMutableAttributedString *placeName = [[NSMutableAttributedString alloc] initWithString:nameHolder];
    [placeName addAttribute:NSForegroundColorAttributeName
                        value:RGBColor(189, 189, 189)
                        range:NSMakeRange(0, nameHolder.length)];
    [placeName addAttribute:NSFontAttributeName
                        value:[UIFont boldSystemFontOfSize:Scale750(30)]
                        range:NSMakeRange(0, nameHolder.length)];
    _infoTF.attributedPlaceholder = placeName;
    _infoTF.font = [UIFont systemFontOfSize:Scale750(30)];
    [_inputView addSubview:_infoTF];
    /*
     * 提示
     */
    _titleLab = [[UILabel alloc] init];
    _titleLab.font = [UIFont systemFontOfSize:Scale750(24)];
    _titleLab.textColor = RGBColor(189, 189, 189);
    _titleLab.numberOfLines = 0;
    _titleLab.text = @"昵称要求为4—10位字符，支持中文、英文、数字";
    [self.view addSubview:_titleLab];
    /*
     * 确认Btn
     */
    self.sureBtn = [[UIButton alloc] init];
    _sureBtn.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    _sureBtn.layer.cornerRadius = Scale750(40);
    [_sureBtn setBackgroundColor:S_COGreenBackNoClick];
    [_sureBtn setTitle:@"保存" forState:UIControlStateNormal];
    [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_sureBtn ug_addEvents:UIControlEventTouchUpInside andBlock:^(id  _Nonnull sender) {
        UG_WEAKSELF
        [[NetWorkRequest new] updateUserInfo:@{@"nickname":weakSelf.infoTF.text} endBlock:^(NSDictionary * _Nonnull result, NSError * _Nonnull error) {
            if(error){
                [weakSelf.view ug_msg:error.domain];
            }else{
               [weakSelf.view ug_msg:@"修改成功"];
                [[Global_Variable shared] updateUserInfo:^(NSDictionary * _Nonnull result, NSError * _Nonnull error) {
                    NSLog(@"");
                }];
            }
        }];
    }];
    
    [self.view addSubview:_sureBtn];
}
-(void)updateUI{
    _infoTF.text = [Global_Variable shared].nickname;
}
-(UIView *)inputView{
    if (!_inputView) {
        _inputView = [[UIView alloc] init];
        _inputView.backgroundColor = [UIColor whiteColor];
    }
    return _inputView;
}

#pragma mark - 适配
- (void)viewLayoutMarginsDidChange {
    [super viewLayoutMarginsDidChange];
    [_inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(90));
    }];
    [_infoTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(Scale750(30));
        make.right.mas_equalTo(-Scale750(30));
        make.height.mas_equalTo(Scale750(90));
    }];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.inputView.mas_bottom).mas_offset(Scale750(20));
        make.left.mas_equalTo(Scale750(30));
        make.right.mas_equalTo(-Scale750(30));
        make.height.mas_greaterThanOrEqualTo(0);
    }];
    [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLab.mas_bottom).mas_offset(Scale750(120));
        make.left.mas_equalTo(Scale750(30));
        make.right.mas_equalTo(-Scale750(30));
        make.height.mas_equalTo(Scale750(80));
    }];
}

@end
