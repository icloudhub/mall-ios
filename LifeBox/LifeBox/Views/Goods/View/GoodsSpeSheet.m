//
//  GoodsSpeSheet.m
//  LifeBox
//
//  Created by Lucky on 2019/9/27.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "GoodsSpeSheet.h"
#import "SpeSheetHeadView.h"
#import "NSArray+UG.h"
@implementation GoodsSpeSheet {
    ///商品图片
    UIImageView *goodsImg;
    ///商品名称
    UILabel *goodsLab;
    ///商品价格
    UILabel *goodsPrice;
    ///商品规格
    UILabel *speLab;
    ///商品数量
    UILabel *numLab;
    ///数量
    NSInteger num;
    
    
}

#pragma mark - 高度
- (NSInteger)viewHeight {
    return Screen_height/2;
}

#pragma mark - 视图布局
- (void)makeSubview {
    num = 1;
    /*
     * 关闭Btn
     */
    UIButton *closeBtn = [[UIButton alloc] init];
    [closeBtn setBackgroundImage:[UIImage imageNamed:@"ic_address_close"] forState:UIControlStateNormal];
    [closeBtn setBackgroundImage:[UIImage imageNamed:@"ic_address_close"] forState:UIControlStateHighlighted];
    [closeBtn bk_addEventHandler:^(id sender) {
        [self dismissView];
    } forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(30));
        make.right.mas_equalTo(-Scale750(30));
        make.width.height.mas_equalTo(Scale750(50));
    }];
    /*
     * 商品图片
     */
    goodsImg = [[UIImageView alloc] init];
    goodsImg.backgroundColor = [UIColor redColor];
    goodsImg.layer.cornerRadius = Scale750(8);
    [goodsImg ug_Radius:4];
    [self.bottomView addSubview:goodsImg];
    [goodsImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Scale750(30));
        make.left.mas_equalTo(Scale750(30));
        make.width.height.mas_equalTo(Scale750(180));
    }];
    /*
     * 商品名称
     */
    goodsLab = [[UILabel alloc] init];
    goodsLab.font = [UIFont systemFontOfSize:Scale750(30)];
    goodsLab.textColor = RGBColor(51, 51, 51);
    goodsLab.numberOfLines = 2;
    goodsLab.text = @"高山苹果 400g";
    [self.bottomView addSubview:goodsLab];
    [goodsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(goodsImg);
        make.left.mas_equalTo(goodsImg.mas_right).mas_offset(Scale750(20));
        make.right.mas_equalTo(closeBtn.mas_left).mas_offset(-Scale750(20));
        make.height.mas_greaterThanOrEqualTo(Scale750(40));
    }];
    /*
     * 商品价格
     */
    goodsPrice = [[UILabel alloc] init];
    goodsPrice.font = [UIFont systemFontOfSize:Scale750(25)];
    goodsPrice.textColor = S_CORedText;
    NSString *priceStr = @"¥12.90";
    goodsPrice.attributedText = [priceStr strChangFlagWithStr:@"12" Color:S_CORedText Font:Scale750(35)];
    [self.bottomView addSubview:goodsPrice];
    [goodsPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(goodsLab.mas_bottom).mas_offset(Scale750(20));
        make.left.mas_equalTo(goodsLab);
        make.width.height.mas_greaterThanOrEqualTo(Scale750(40));
    }];
    /*
     * 上分割线
     */
    UIView *lineView1 = [[UIView alloc] init];
    lineView1.backgroundColor = COLOREE;
    [self.bottomView addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(goodsImg.mas_bottom).mas_offset(Scale750(30));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    
    /*
     * 购物数量显示
     */
    UILabel *numTlab = [[UILabel alloc] init];
    numTlab.font = [UIFont systemFontOfSize:Scale750(30)];
    numTlab.textColor = RGBColor(51, 51, 51);
    numTlab.text = @"购物数量";
    [self.bottomView addSubview:numTlab];
    [numTlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView1.mas_bottom).mas_offset(Scale750(30));
        make.left.mas_equalTo(Scale750(30));
        make.width.height.mas_greaterThanOrEqualTo(Scale750(10));
    }];
    /*
     * 加号Btn
     */
    UIButton *addBtn = [[UIButton alloc] init];
    [addBtn setBackgroundImage:[UIImage imageNamed:@"ic_plus_goods"] forState:UIControlStateNormal];
    [addBtn setBackgroundImage:[UIImage imageNamed:@"ic_plus_goods"] forState:UIControlStateHighlighted];
    addBtn.tag = 1000;
    [addBtn addTarget:self action:@selector(numBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:addBtn];
    [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(numTlab);
        make.right.mas_equalTo(-Scale750(30));
        make.width.height.mas_equalTo(Scale750(44));
    }];
    /*
     * 数量
     */
    numLab = [[UILabel alloc] init];
    numLab.textColor = RGBColor(51, 51, 51);
    numLab.font = [UIFont systemFontOfSize:Scale750(30)];
    numLab.textAlignment = NSTextAlignmentCenter;
    numLab.text = [NSString stringWithFormat:@"%ld", (long)num];
    [self.bottomView addSubview:numLab];
    [numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.height.mas_equalTo(addBtn);
        make.right.mas_equalTo(addBtn.mas_left).mas_offset(-Scale750(10));
        make.width.mas_equalTo(Scale750(70));
    }];
    /*
     * 减号Btn
     */
    UIButton *reduceBtn = [[UIButton alloc] init];
    [reduceBtn setBackgroundImage:[UIImage imageNamed:@"ic_less_goods"] forState:UIControlStateNormal];
    [reduceBtn setBackgroundImage:[UIImage imageNamed:@"ic_less_goods"] forState:UIControlStateHighlighted];
    reduceBtn.tag = 1001;
    [reduceBtn addTarget:self action:@selector(numBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:reduceBtn];
    [reduceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(addBtn);
        make.right.mas_equalTo(numLab.mas_left).mas_offset(-Scale750(10));
        make.width.height.mas_equalTo(Scale750(44));
    }];
    
    //    /*
    //     * 规格
    //     */
    //    speLab = [[UILabel alloc] init];
    //    speLab.font = [UIFont systemFontOfSize:Scale750(30)];
    //    speLab.textColor = RGBColor(51, 51, 51);
    //    speLab.text = @"规格: 400g/盒";
    //    [self.bottomView addSubview:speLab];
    //    [speLab mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.mas_equalTo(lineView1.mas_bottom).mas_offset(Scale750(30));
    //        make.left.mas_equalTo(Scale750(30));
    //        make.width.height.mas_greaterThanOrEqualTo(Scale750(20));
    //    }];
    //
    
    
    /*
     * 下分割线
     */
    UIView *lineView2 = [[UIView alloc] init];
    lineView2.backgroundColor = COLOREE;
    [self.bottomView addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(numTlab.mas_bottom).mas_offset(Scale750(30));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    [self.bottomView addSubview:self.collectionView];
    //    _collectionView.backgroundColor = UIColor.ug_random;
    
    /*
     * 加入购物车
     */
    self.addShop = [[UIButton alloc] init];
    _addShop.backgroundColor = S_COGreenBack;
    _addShop.titleLabel.font = [UIFont systemFontOfSize:Scale750(30)];
    [_addShop setTitle:@"加入购物车" forState:UIControlStateNormal];
    [_addShop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_addShop setTitleColor:COLOR23 forState:UIControlStateDisabled];
    [_addShop setTitle:@"备货中..." forState:UIControlStateDisabled];
    [self.bottomView addSubview:_addShop];
    [_addShop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.bottomView.mas_bottom).mas_offset(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(Scale750(90));
    }];
    [self reloadUI];
    
}

-(void)setProduct:(ProductModel *)product{
    _product = product;
    if (!self.selectsku) {
        for (ProductSKUModel *skuitem in _product.skuList) {
            if ([skuitem.skuid isEqualToString:_product.defualSku]) {
                self.selectsku = skuitem;
                self.selectSpeDic =[[NSMutableDictionary alloc]initWithDictionary:self.selectsku.spDic];
            }
        }
    }
    
    [_collectionView reloadData];
}
-(void)setSelectsku:(ProductSKUModel *)selectsku{
    _selectsku = selectsku;
    if (_selectskuChange) {
        _selectskuChange(_selectsku);
    }
    [self reloadUI];
}
-(void)reloadUI{
    if (_selectsku) {
        [_addShop setEnabled:YES];
        NSString *priceStr = [NSString stringWithFormat:@"¥%0.2f",_selectsku.price];
        goodsPrice.attributedText = [priceStr strChangFlagWithStr:[NSString stringWithFormat:@"%0.2f",_selectsku.price] Color:S_CORedText Font:Scale750(35)];
    }else{
        [_addShop setEnabled:NO];
        goodsPrice.text = @"无货";
    }
    NSString *url = _selectsku.pic?:_product.pic;
    [goodsImg sd_setImageWithURL:UG_URL(url)];
    goodsLab.text =_product.name;
}

-(NSDictionary *)selectSpeDic{
    if (!_selectSpeDic) {
        _selectSpeDic = [[NSMutableDictionary alloc]initWithCapacity:0];
    }
    return _selectSpeDic;
}
-(BlockCollectionView *)collectionView{
    UG_WEAKSELF
    if (!_collectionView) {
        _collectionView = [BlockCollectionView new];
        _collectionView.flowLayout.minimumLineSpacing = 8.f;
        _collectionView.flowLayout.minimumInteritemSpacing = 8.f;
        [_collectionView registerClass:[SpeSheetHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SpeSheetHeadView"];
        _collectionView.ug_numberOfSectionsInCollectionView = ^NSInteger(UICollectionView * _Nonnull collectionView) {
            return weakSelf.product.attributeList.count;
        };
        _collectionView.ug_numberOfItemsInSection = ^NSInteger(UICollectionView * _Nonnull collectionView, NSInteger section) {
            ProductSpecModel *data = [weakSelf.product.attributeList objectAtIndex:section];
            return data.valueList.count;
        };
        _collectionView.ug_cellForItemAtIndexPath = ^__kindof UICollectionViewCell * _Nonnull(UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
            BlockCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
            [cell ug_Radius:2];
            
            ProductSpecModel *data = [weakSelf.product.attributeList objectAtIndex:indexPath.section];
            NSDictionary *dic = [data.valueList objectAtIndex:indexPath.row];
            cell.titleLab.text = dic[@"value"];
            if ([[weakSelf.selectSpeDic objectForKey:data.id] isEqualToString:dic[@"value"]]) {
                cell.backgroundColor = S_COGreenBack;
                cell.titleLab.textColor = UIColor.whiteColor;
                [cell ug_border:S_COGreenBack white:0.5];
            }else{
                cell.backgroundColor = UIColor.whiteColor;
                cell.titleLab.textColor = COLOR23;
                [cell ug_border:COLOREE white:0.5];
            }
            
            return cell;
        };
        _collectionView.ug_sizeForItemAtIndexPath = ^CGSize(UICollectionView * _Nonnull collectionView, UICollectionViewLayout * _Nonnull layout, NSIndexPath * _Nonnull indexPath) {
            return CGSizeMake((Screen_width-16)/3, 40);
        };
        _collectionView.ug_referenceSizeForHeaderInSection = ^CGSize(UICollectionView * _Nonnull collectionView, UICollectionViewLayout * _Nonnull collectionViewLayout, NSInteger section) {
            
            return CGSizeMake(Screen_width, 40);
            
        };
        _collectionView.ug_viewForSupplementaryElementOfKind = ^UICollectionReusableView * _Nonnull(UICollectionView * _Nonnull collectionView, NSString * _Nonnull kind, NSIndexPath * _Nonnull indexPath) {
            
            if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
                
                SpeSheetHeadView *resusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"SpeSheetHeadView" forIndexPath:indexPath];
                ProductSpecModel *data = [weakSelf.product.attributeList objectAtIndex:indexPath.section];
                resusableView.titleLab.text =data.name;
                return resusableView;
            }
            
            return nil;
        };
        _collectionView.ug_didSelectItemAtIndexPath = ^(UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
            ProductSpecModel *data = [weakSelf.product.attributeList objectAtIndex:indexPath.section];
            NSDictionary *dic = [data.valueList objectAtIndex:indexPath.row];
            [weakSelf.selectSpeDic setValue:dic[@"value"] forKey:data.id];
            NSLog(@"%@", [NSString stringWithFormat:@"%@ indexsecton:%zd indexrow:%zd",weakSelf.selectSpeDic,indexPath.section,indexPath.row]);
            [weakSelf updateSKU];
            [weakSelf.collectionView reloadData];
        };
    }
    return _collectionView;
}

-(void)updateSKU{
    
    
    for (ProductSKUModel *temitem in self.product.skuList) {
        
        if ([temitem.spDic isEqualToDictionary:self.selectSpeDic]) {
            self.selectsku = temitem;
            return;
        }
    }
    self.selectsku = nil;
    return;
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(numLab.mas_bottom).mas_offset(Scale750(30));
        make.left.mas_equalTo(self.bottomView).mas_offset(SPanding_DEF);
        make.right.mas_equalTo(self.bottomView).mas_offset(-SPanding_DEF);
        make.bottom.mas_equalTo(self.bottomView);
    }];
}

#pragma mark - 数量选择点击
- (void)numBtnClicked:(UIButton *)btn {
    if (btn.tag == 1000) {
        num = num + 1;
    }else{
        if (num == 1) {
            return;
        }
        num = num - 1;
    }
    numLab.text = [NSString stringWithFormat:@"%ld", (long)num];
}

@end
