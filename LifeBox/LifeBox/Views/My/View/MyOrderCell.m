//
//  MyOrderCell.m
//  LifeBox
//
//  Created by Lucky on 2019/8/21.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "MyOrderCell.h"
#import "PersonalCenterCell.h"
#import "PersonIconData.h"

@implementation MyOrderCell {
    ///数据展示
    UICollectionView *collectionView;
    ///数据数组
    NSMutableArray *dataArr;
}

#pragma mark - 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatCellUI];
    }
    return self;
}

#pragma mark - 创建UI
- (void)creatCellUI {
    /*
     * 底部视图
     */
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor whiteColor];
    bottomView.layer.cornerRadius = Scale750(20);
    [self addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(20));
        make.left.mas_equalTo(Scale750(30));
        make.right.mas_equalTo(-Scale750(30));
        make.bottom.mas_equalTo(self);
    }];
    /*
     * 标题
     */
    UILabel *titleLab = [[UILabel alloc] init];
    titleLab.text = @"我的订单";
    titleLab.font = [UIFont systemFontOfSize:Scale750(30)];
    [bottomView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(20));
        make.left.mas_equalTo(Scale750(20));
        make.width.height.mas_greaterThanOrEqualTo(0);
    }];
    /*
     * 分割线
     */
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = RGBColor(245, 245, 245);
    [bottomView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLab.mas_bottom).mas_offset(Scale750(20));
        make.right.left.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    /*
     * 可点击数据区域
     */
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.scrollEnabled = YES;
    collectionView.pagingEnabled = YES;
    collectionView.bounces = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.backgroundColor = [UIColor whiteColor];
    [collectionView registerClass:[PersonalCenterCell class] forCellWithReuseIdentifier:@"PersonalCenterCellID"];
    [bottomView addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView.mas_bottom).mas_offset(0);
        make.left.mas_equalTo(bottomView);
        make.width.mas_equalTo((Screen_width - Scale750(60)));
        make.bottom.mas_equalTo(bottomView);
    }];
    /*
     * 创建数据
     */
    PersonIconData *oneData = [[PersonIconData alloc] init];
    oneData.imgStr = @"ic_pending_payment";
    oneData.titleStr = @"待付款";
    PersonIconData *twoData = [[PersonIconData alloc] init];
    twoData.imgStr = @"ic_pending_delivery";
    twoData.titleStr = @"待自提";
    PersonIconData *thrData = [[PersonIconData alloc] init];
    thrData.imgStr = @"ic_pending_receipt";
    thrData.titleStr = @"待配送";
    PersonIconData *fourData = [[PersonIconData alloc] init];
    fourData.imgStr = @"ic_comment";
    fourData.titleStr = @"待评价";
    dataArr = [[NSMutableArray alloc] initWithObjects:oneData, twoData, thrData, fourData, nil];
    [collectionView reloadData];
}

#pragma mark - CollectionView代理
//设置CollectionCell的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PersonalCenterCell *cell = (PersonalCenterCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"PersonalCenterCellID" forIndexPath:indexPath];
    PersonIconData *cellData = [dataArr objectAtIndex:indexPath.row];
    [cell reloadCellUIWithData:cellData];
    return cell;
}

//设置CollectionView的组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//设置CollectionView每组所包含的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

//定义每个UICollectionView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((Screen_width - Scale750(65))/4, Scale750(170));
}

//定义整个CollectionViewCell与整个View的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);//（上、左、下、右）
}

//定义每个UICollectionView的横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

//定义每个UICollectionView的纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([_orderDelegate respondsToSelector:@selector(orderCellSelectWithTag:)]) {
        [_orderDelegate orderCellSelectWithTag:indexPath.row];
    }
}

@end
