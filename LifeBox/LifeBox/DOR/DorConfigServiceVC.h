//
//  DorConfigServiceVC.h
//  LifeBox
//
//  Created by xiaoqy on 2019/11/7.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlockTableView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ServiecData : NSObject

@property(strong, nonatomic) NSString *title;
@property(strong, nonatomic) NSString *url;
@property(strong, nonatomic) NSString *port;
@property(strong, nonatomic) NSString *searchPort;//搜索端口
@property(assign, nonatomic) BOOL isselect;

@end

@interface ServiecInputview : UIView

@property(strong, nonatomic) UITextField *inputTF;
@property(strong, nonatomic) UILabel *titleLab;

@end

@interface ServiecAddview : UIView
@property(strong, nonatomic) UIView *centview;
@property(strong, nonatomic) ServiecInputview *titleInput;
@property(strong, nonatomic) ServiecInputview *urlInput;
@property(strong, nonatomic) ServiecInputview *portInput;
@property(strong, nonatomic) ServiecInputview *searchPortInput;
@property(strong, nonatomic) UIButton *commitBtn;
@property(strong, nonatomic) ServiecData *editdata;

@end



@interface DorConfigServiceVC : UIViewController

@end



NS_ASSUME_NONNULL_END
