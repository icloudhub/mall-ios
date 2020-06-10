//
//  OrderViewCell.m
//  LifeBox
//
//  Created by Lucky on 2019/9/6.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "OrderViewCell.h"
#import "MultipleView.h"
#import "SingleView.h"
#import "BlockCollectionViewCell.h"

@implementation OrderViewHeadView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self confitUI];
    }
    return self;
}

-(void)confitUI{
    
    // 订单号
    [self addSubview:self.orderNumLab];
    // 时间
    [self addSubview:self.timeLab];
    // 状态图片
    [self addSubview:self.stateImg];
    // 状态
    [self addSubview:self.stateLab];
    
    UIView* lineView = [[UIView alloc] init];
    lineView.backgroundColor = S_COBackground;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
}
#pragma mark get
-(UILabel *)orderNumLab{
    
    if (!_orderNumLab) {
        _orderNumLab = [UILabel new];
        _orderNumLab.font = [UIFont systemFontOfSize:Scale750(30)];
        _orderNumLab.textColor = RGBColor(51, 51, 51);
    }
    return _orderNumLab;
}

-(UILabel *)timeLab{
    if (!_timeLab) {
        _timeLab = [UILabel new];
        _timeLab.font = [UIFont systemFontOfSize:Scale750(24)];
        _timeLab.textColor = RGBColor(189, 189, 189);
    }
    return _timeLab;
}

-(UILabel *)stateLab{
    if (!_stateLab) {
        _stateLab = [UILabel new];
        _stateLab.font = [UIFont systemFontOfSize:Scale750(30)];
        _stateLab.textColor = S_COGreenText;
    }
    return _stateLab;
}
-(UIImageView *)stateImg{
    if (!_stateImg) {
        _stateImg = [UIImageView new];
        _stateImg.layer.cornerRadius = Scale750(20);
        _stateImg.backgroundColor = [UIColor yellowColor];
        _stateImg.hidden = YES;
    }
    return _stateImg;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_orderNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.mas_centerY).mas_offset(Scale750(10));
        make.left.mas_equalTo(Scale750(20));
    }];
    [_timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_centerY).mas_offset(Scale750(10));
        make.left.mas_equalTo(self->_orderNumLab);
        
    }];
    [_stateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).mas_offset(-Scale750(20));
        make.centerY.mas_equalTo(self);
    }];
    [_stateImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).mas_offset(-Scale750(20));
        make.centerY.mas_equalTo(self);
        make.width.height.mas_equalTo(CGSizeMake(60, 40));
    }];
}

@end

@implementation OrderViewBodyView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self confitUI];
    }
    return self;
}

-(void)setDataList:(NSArray *)dataList{
    _dataList = dataList;
    [self.collectionView reloadData];
}

-(void)confitUI{
    [self addSubview:self.collectionView];
    UIView* lineView = [[UIView alloc] init];
    lineView.backgroundColor = S_COBackground;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumInteritemSpacing = 8;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollEnabled = YES;
        _collectionView.pagingEnabled = YES;
        _collectionView.bounces = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[OrderViewBodyViewCollectionCell class] forCellWithReuseIdentifier:@"OrderViewBodyViewCollectionCell"];
        _collectionView.userInteractionEnabled = NO;
    }
    return _collectionView;
}
#pragma mark - CollectionView代理
//设置CollectionCell的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = [_dataList objectAtIndex:indexPath.row];
    if (_dataList.count==1) {
        OrderViewBodyViewCollectionCell *cell = (OrderViewBodyViewCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"OrderViewBodyViewCollectionCell" forIndexPath:indexPath];

        [cell.imageView sd_setImageWithURL: UG_URL([dic stringValueForKey:@"productPic" default:@""])];
        return cell;
    }else{
        OrderViewBodyViewCollectionCell *cell = (OrderViewBodyViewCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"OrderViewBodyViewCollectionCell" forIndexPath:indexPath];
 
        [cell.imageView sd_setImageWithURL: UG_URL([dic stringValueForKey:@"productPic" default:@""])];
       
        return cell;
    }
    
    
}

//设置CollectionView的组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//设置CollectionView每组所包含的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataList.count<=4? _dataList.count :4;
}

//定义每个UICollectionView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(46, 46);
}

//定义整个CollectionViewCell与整个View的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(8, 8, 8, 8);//（上、左、下、右）
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
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}

@end

@implementation OrderViewFooterView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self confitUI];
    }
    return self;
}

-(void)confitUI{
    [self addSubview:self.goodsAllNum];
    [self addSubview:self.allPrice];
    [self addSubview:self.leftBtn];
}
-(UILabel *)goodsAllNum{
    if (!_goodsAllNum) {
        _goodsAllNum = [UILabel new];
        _goodsAllNum.font = [UIFont systemFontOfSize:Scale750(30)];
        _goodsAllNum.textColor = RGBColor(51, 51, 51);
        _goodsAllNum.textAlignment = NSTextAlignmentLeft;
        _goodsAllNum.text = @"共1件商品";
    }
    return _goodsAllNum;
}

-(UILabel *)allPrice{
    if (!_allPrice) {
        _allPrice = [UILabel new];
        _allPrice.font = [UIFont systemFontOfSize:Scale750(30)];
        _allPrice.textAlignment = NSTextAlignmentRight;
        _allPrice.textColor = RGBColor(51, 51, 51);
        _allPrice.text = @"应付款: ¥1.99";
    }
    return _allPrice;
}
-(UIButton *)leftBtn{
    if (!_leftBtn) {
        _leftBtn = [UIButton new];
    }
    return _leftBtn;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_goodsAllNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).mas_offset(Scale750(20));
        make.centerY.mas_equalTo(self);
    }];
    [_allPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).mas_offset(-Scale750(20));
        make.centerY.mas_equalTo(self);
    }];
}
@end
@implementation OrderViewCell {
    
    UIView *lineView;
    UIView *lineView1;
    ///单个商品展示view
    SingleView *singleView;
    ///多个商品展示view
    MultipleView *multipleView;
}

#pragma mark - 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}

#pragma mark - 创建UI
- (void)createUI {
    self.backgroundColor = UIColor.whiteColor;
    [self addSubview:self.coustomView];
    /*
     * headView
     */
    [self.coustomView addSubview:self.headView];
    [self.coustomView addSubview:self.bodyView];
    [self.coustomView addSubview:self.fotterView];
    [self.coustomView ug_radius:4];
}

#pragma mark - get
-(OrderViewHeadView *)headView{
    if (!_headView) {
        _headView = [OrderViewHeadView new];

        _headView.layer.cornerRadius = Scale750(20);
    }
    return _headView;
}
-(OrderViewBodyView *)bodyView{
    if (!_bodyView) {
        _bodyView = [OrderViewBodyView new];
     
    }
    return _bodyView;
}

-(OrderViewFooterView *)fotterView{
    if (!_fotterView) {
        _fotterView = [OrderViewFooterView new];
     
    }
    return _fotterView;
}
-(UIView *)contentView{
    if (!_coustomView) {
        _coustomView = [UIView new];
        _coustomView.backgroundColor = UIColor.whiteColor;
    }
    return _coustomView;
}
-(void)reloadUI:(OrderListData*)data{
    
    _headView.timeLab.text = [data.createTime stringWithFormat:@"YYYY-MM-dd HH:ss"];
    _headView.orderNumLab.text = data.orderSn;
    _headView.stateLab.text = [NSString stringWithFormat:@"%@(%@)",data.statusStr,data.deliveryTypeStr] ;
    
    [_bodyView setDataList:data.orderItemList];
    _fotterView.goodsAllNum.text = [NSString stringWithFormat:@"共%zd件商品",data.orderItemList.count];
    _fotterView.allPrice.text =[NSString stringWithFormat:@"金额: ¥%.2f",data.totalAmount];
    NSMutableArray *images = [NSMutableArray new];
    for (NSDictionary *dic in data.orderItemList) {
        [images addObject:[dic stringValueForKey:@"productPic" default:@""]];
    }
    if (images.count==1) {
        NSDictionary *dic = [data.orderItemList firstObject];
        multipleView.hidden = YES;
        singleView.hidden = NO;
        singleView.goodsName.text = [dic stringValueForKey:@"productName" default:@""];
        [singleView.goodsImg sd_setImageWithURL:UG_URL([dic stringValueForKey:@"productPic" default:@""]) placeholderImage:[UIImage imageWithIcon:@"fa-github" backgroundColor:UIColor.clearColor iconColor:COLOR23 andSize:CGSizeMake(20, 20)]];
    }else{
        singleView.hidden = YES;
        multipleView.hidden = NO;
        multipleView.dataArr = images;
    }
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [_coustomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(20));
        make.left.mas_equalTo(Scale750(20));
        make.right.mas_equalTo(-Scale750(20));
        make.bottom.mas_equalTo(0);
    }];
    [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(44);
        
    }];
    [_bodyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(62);
        
    }];
    [_fotterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bodyView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(self.contentView);
    }];
}

@end
