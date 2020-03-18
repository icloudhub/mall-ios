//
//  HomeViewCollectionCell.h
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/18.
//  Copyright © 2020 admin. All rights reserved.
//

#import "BlockCollectionViewCell.h"


NS_ASSUME_NONNULL_BEGIN

@interface RemarkLabView : UIView

@property (nonatomic, strong) UILabel * titleLab; // 标题

@property (nonatomic, strong) UILabel * valueLab; // 值

@end

@interface HomeViewCollectionCell : UICollectionViewCell

@property (nonatomic, strong) RemarkLabView * amountaView; // 交易金额

@property (nonatomic, strong) RemarkLabView * visitorView; // 访客

@property (nonatomic, strong) RemarkLabView * addvisitorView; // 新增客户

@property (nonatomic, strong) RemarkLabView * orderView; // 7日订单数量

@end

@interface HomeViewCollectionToDoCell : UICollectionViewCell

@property (nonatomic, strong) UILabel * titleLab; // 标题

@property (nonatomic, strong) UILabel * valueLab; // 值

@end

@interface HomeViewCollectionBandleCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView * imageView; // 图片

@end

NS_ASSUME_NONNULL_END
