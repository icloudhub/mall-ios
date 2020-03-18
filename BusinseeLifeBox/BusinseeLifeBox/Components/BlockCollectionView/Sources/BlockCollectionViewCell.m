//
//  BlockCollectionViewCell.m
//  UbunGit_OC
//
//  Created by MBA on 2019/5/18.
//  Copyright © 2019 admin. All rights reserved.
//

#import "BlockCollectionViewCell.h"
#import "Masonry.h"

@implementation BlockCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
        self.imageView = [UIImageView new];
        _imageView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_imageView];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
        [_imageView ug_radius:3];
        
        
        self.titleLab = [UILabel new];
        [self.contentView addSubview:_titleLab];
        [_titleLab setFont:FONT_SYS10];
        [_titleLab setTextColor:COLOR_23];
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.numberOfLines = 0;
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.bottom.mas_equalTo(self).mas_offset(-KPAND_MID);
    }];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.bottom.mas_equalTo(self.titleLab.mas_top).mas_offset(-KPAND_MIN);
    }];
    
    
}


@end
