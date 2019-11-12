//
//  CommentsCell.m
//  LifeBox
//
//  Created by Lucky on 2019/9/26.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "CommentsCell.h"

@implementation CommentsCell {
    ///头像
    UIImageView *headImg;
    ///昵称
    UILabel *nickLab;
    ///评价图片
    UIImageView *comImg;
    ///评价文字
    UILabel *comLab;
    ///时间
    UILabel *timeLab;
    ///评价内容
    UILabel *infoLab;
}

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
     * 头像
     */
    headImg = [[UIImageView alloc] init];
    headImg.backgroundColor = [UIColor redColor];
    headImg.layer.cornerRadius = Scale750(25);
    [self.contentView addSubview:headImg];
    [headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(25));
        make.left.mas_equalTo(Scale750(30));
        make.width.height.mas_equalTo(Scale750(50));
    }];
    /*
     * 昵称
     */
    nickLab = [[UILabel alloc] init];
    nickLab.font = [UIFont systemFontOfSize:Scale750(24)];
    nickLab.textColor = RGBColor(51, 51, 51);
    nickLab.text = @"Lucky";
    [self.contentView addSubview:nickLab];
    [nickLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(headImg);
        make.left.mas_equalTo(headImg.mas_right).mas_offset(Scale750(20));
        make.width.height.mas_greaterThanOrEqualTo(Scale750(30));
    }];
    /*
     * 评价显示
     */
    comLab = [[UILabel alloc] init];
    comLab.font = [UIFont systemFontOfSize:Scale750(24)];
    comLab.textColor = S_CORedText;
    NSMutableAttributedString *attri =     [[NSMutableAttributedString alloc] initWithString:@" 好评"];
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    // 表情图片
    attch.image = [UIImage imageNamed:@"ic_comments"];
    // 设置图片大小
    //attch.bounds = CGRectMake(0, 0, 30/2, 27/2);
    // 创建带有图片的富文本
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    //在文字下标第几个添加图片  0就是文字前面添加图片
    [attri insertAttributedString:string atIndex:0];
    comLab.attributedText = attri;
    [self.contentView addSubview:comLab];
    [comLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(nickLab.mas_bottom).mas_offset(Scale750(Scale750(20)));
        make.left.mas_equalTo(nickLab);
        make.width.height.mas_greaterThanOrEqualTo(Scale750(20));
    }];
    /*
     * 时间
     */
    timeLab = [[UILabel alloc] init];
    timeLab.font = [UIFont systemFontOfSize:Scale750(24)];
    timeLab.textColor = RGBColor(189, 189, 189);
    timeLab.text = @"2019-10-10";
    [self.contentView addSubview:timeLab];
    [timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(headImg);
        make.right.mas_equalTo(-Scale750(30));
        make.width.height.mas_greaterThanOrEqualTo(10);
    }];
    /*
     * 评论内容
     */
    infoLab = [[UILabel alloc] init];
    infoLab.font = [UIFont systemFontOfSize:Scale750(24)];
    infoLab.textColor = RGBColor(51, 51, 51);
    infoLab.numberOfLines = 0;
    infoLab.text = @"好货超级好评好货超级好评";
    [self.contentView addSubview:infoLab];
    [infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(comLab.mas_bottom).mas_offset(Scale750(20));
        make.left.mas_equalTo(nickLab);
        make.right.mas_equalTo(-Scale750(40));
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-Scale750(20));
    }];
    /*
     * 分割线
     */
//    UIView *line = [[UIView alloc] init];
//    line.backgroundColor = [UIColor redColor];
//    [self.contentView addSubview:line];
//    [line mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(infoLab.mas_bottom).mas_offset(Scale750(4));
//        make.left.right.mas_equalTo(0);
//        make.height.mas_equalTo(1);
//    }];
    /*
     * 适配
     */
//    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.mas_equalTo(0);
//        make.bottom.mas_equalTo(line.mas_bottom).mas_offset(20);
//    }];
    
}

-(void)reloadUI:(ProductCommentModel*)commdata{
    
    [headImg sd_setImageWithURL:UG_URL(commdata.memberIcon)];
    nickLab.text = commdata.memberNickName;
    
    infoLab.text = commdata.content;
    
    timeLab.text = [commdata.createTime ug_dayTime];
    
    NSString *starstr = @"";
    if (commdata.star>3) {
        starstr = @" 好评";
    }else if(commdata.star>2){
        starstr = @" 中评";
    }else{
        starstr = @" 差评";
    }
    NSMutableAttributedString *attri =     [[NSMutableAttributedString alloc] initWithString:starstr];
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    // 表情图片
    attch.image = [UIImage imageNamed:@"ic_comments"];
    // 设置图片大小
    //attch.bounds = CGRectMake(0, 0, 30/2, 27/2);
    // 创建带有图片的富文本
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    //在文字下标第几个添加图片  0就是文字前面添加图片
    [attri insertAttributedString:string atIndex:0];
    comLab.attributedText = attri;
}
@end
