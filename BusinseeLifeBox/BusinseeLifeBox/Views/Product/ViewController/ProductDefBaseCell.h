//
//  ProductDefBaseCell.h
//  BusinseeLifeBox
//
//  Created by admin on 2020/4/27.
//  Copyright © 2020 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductCellData.h"
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN
typedef void(^ProductDefBaseCellHeightChangeBlock)(ProductCellData *data);


@interface ProductDefAddCell : UICollectionViewCell

@property(strong, nonatomic) UIImageView* icon;

@end

@interface ProductDefBaseCell : UICollectionViewCell<WKNavigationDelegate>

@property(strong, nonatomic)UILabel *typeLab;

@property(strong, nonatomic) WKWebView *webview;

@property(strong, nonatomic) ProductCellData *cellData;

@property(copy, nonatomic) ProductDefBaseCellHeightChangeBlock cellHeightChangeBlock;

-(void)reload:(ProductCellData*)data;
@end

NS_ASSUME_NONNULL_END
