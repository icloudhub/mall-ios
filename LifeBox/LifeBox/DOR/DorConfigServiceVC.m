//
//  DorConfigServiceVC.m
//  LifeBox
//
//  Created by xiaoqy on 2019/11/7.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "DorConfigServiceVC.h"

@implementation ServiecData
@end

@implementation ServiecInputview

-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}
-(void)configUI{
    
    self.titleLab = [UILabel new];
    [self addSubview:_titleLab];
    _titleLab.font = FONT_SYS12;
    _titleLab.textAlignment = NSTextAlignmentRight;
    
    self.inputTF = [UITextField new];
    [self addSubview:_inputTF];
    [_inputTF ug_borderColor:COLOREE width:1];
   
}

-(void)layoutSubviews{
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(self).mas_offset(SPanding_MIN);
        make.width.mas_equalTo(50);
    }];
    
    [_inputTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(self.titleLab.mas_right).mas_offset(SPanding_MIN);
        make.right.mas_equalTo(self).mas_offset(-SPanding_DEF);
        make.height.mas_equalTo(36);
    }];
}
@end


@implementation ServiecAddview

-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}
-(void)configUI{
    self.backgroundColor = [UIColor ug_R:0 G:0 B:0 A:0.1];
    
    self.centview = [UIView new];
    [self addSubview:_centview];
    _centview.backgroundColor = UIColor.whiteColor;
    [_centview ug_borderColor:COLOREE width:1];
    [_centview ug_radius:S_Radius_MIN];
    
    self.titleInput = [ServiecInputview new];
    [_centview addSubview:_titleInput];
    _titleInput.titleLab.text = @"备注";
    
    self.urlInput = [ServiecInputview new];
    [_centview addSubview:_urlInput];
    _urlInput.titleLab.text = @"地址";
    
    self.portInput = [ServiecInputview new];
    [_centview addSubview:_portInput];
    _portInput.titleLab.text = @"端口";
    
    self.searchPortInput = [ServiecInputview new];
    [_centview addSubview:_searchPortInput];
    _searchPortInput.titleLab.text = @"搜索端口";
    
    self.commitBtn = [UIButton new];
    [self addSubview:_commitBtn];
    [_commitBtn setTitle:@"添加" forState:UIControlStateNormal];
    [_commitBtn ug_borderColor:COLOREE width:1];
    [_commitBtn ug_radius:S_Radius_MIN];
    _commitBtn.backgroundColor = S_COGreenBack;
}
-(void)setEditdata:(ServiecData *)editdata{
    _editdata = editdata;
    if (_editdata) {
        _titleInput.inputTF.text = editdata.title;
        _urlInput.inputTF.text = editdata.url;
        _portInput.inputTF.text = editdata.port;
        _searchPortInput.inputTF.text = editdata.searchPort;
    }else{
        _urlInput.inputTF.text = @"http://";
    }

}
-(void)didAddSubview:(UIView *)subview{
    [super didAddSubview:subview];
    UG_WEAKSELF
    CABasicAnimation *forwardAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    forwardAnimation.duration = 0.4;
    forwardAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.5f :1.7f :0.6f :0.85f];
    forwardAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    forwardAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    [UIView animateWithDuration:forwardAnimation.duration
                          delay:0.35
                        options:0
                     animations:^{
        [weakSelf.centview.layer addAnimation:forwardAnimation
                               forKey:@"choiceRewardAnima"];
    }
                     completion:^(BOOL finished) {
        
    }];
}
-(void)layoutSubviews{
    
    [_centview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(240);
    }];
    
    [_titleInput mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.centview).mas_offset(40);
        make.left.mas_equalTo(self.centview).mas_offset(SPanding_DEF);
        make.right.mas_equalTo(self.centview).mas_offset(-SPanding_DEF);
        make.height.mas_equalTo(44);
    }];
    
    [_urlInput mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.mas_equalTo(self.titleInput.mas_bottom);
         make.left.mas_equalTo(self.centview).mas_offset(SPanding_DEF);
         make.right.mas_equalTo(self.centview).mas_offset(-SPanding_DEF);
         make.height.mas_equalTo(44);
     }];
    
    [_portInput mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.mas_equalTo(self.urlInput.mas_bottom);
         make.left.mas_equalTo(self.centview).mas_offset(SPanding_DEF);
         make.right.mas_equalTo(self.centview).mas_offset(-SPanding_DEF);
         make.height.mas_equalTo(44);
     }];
    
    [_searchPortInput mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.mas_equalTo(self.portInput.mas_bottom);
         make.left.mas_equalTo(self.centview).mas_offset(SPanding_DEF);
         make.right.mas_equalTo(self.centview).mas_offset(-SPanding_DEF);
         make.height.mas_equalTo(44);
     }];
    
    [_commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.centview.mas_bottom).mas_offset(SPanding_DEF);;
        make.left.mas_equalTo(self.centview);
        make.right.mas_equalTo(self.centview);
        make.height.mas_equalTo(44);
    }];

}
@end



@interface DorConfigServiceVC ()
@property(strong, nonatomic) BlockTableView *blocktableview;
@property(strong, nonatomic) NSMutableArray *serviceList;
@property(strong, nonatomic) ServiecData *selectdata;
@property(strong, nonatomic) ServiecAddview *serviecAddview;

@end

@implementation DorConfigServiceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self configUI];
}

-(void)initData{
    
    NSString *datastr = [[NSUserDefaults standardUserDefaults]objectForKey:@"DorConfigServiceVC.ipdata"];
    self.serviceList = [[NSMutableArray alloc]initWithCapacity:0];
    
    ServiecData* data = [ServiecData new];
    data.title = @"默认";
    data.url = [Global_Variable shared].serviceIP;
    data.port =  [Global_Variable shared].defaultPort;
    data.searchPort =  [Global_Variable shared].searchPort;

    if (datastr.length>5) {
        [self.serviceList addObjectsFromArray:[NSArray modelArrayWithClass:[ServiecData class] json:datastr]];
        for (ServiecData *tdata in _serviceList) {
            if ([tdata.url isEqualToString:data.url] && [tdata.port isEqualToString:data.port] && [tdata.searchPort isEqualToString:data.searchPort]) {
                [self setSelectdata:tdata];
            }else{
                tdata.isselect = NO;
            }
        }
    }else{
        [self.serviceList addObject:data];
        [self setSelectdata:data];
    }
}

-(void)setSelectdata:(ServiecData *)selectdata{
    
    if (_selectdata) {
        _selectdata.isselect = NO;
    }
    _selectdata = selectdata;
    _selectdata.isselect = YES;
}

-(void)configUI{
    
    /*
     * 导航栏返回Btn
     */
    UIButton *itemButtom = [UIButton  buttonWithType:UIButtonTypeContactAdd];
    [itemButtom setFrame:CGRectMake(0, 0, 30, 40)];
    
    [itemButtom ug_addEvents:UIControlEventTouchUpInside andBlock:^(id  _Nonnull sender) {
        [self showServiecAddview:nil];
    }];
    UIBarButtonItem *button = [[UIBarButtonItem alloc]
                               initWithCustomView:itemButtom];
    [self.navigationItem setRightBarButtonItems:@[button]];
        
        
    self.blocktableview = [BlockTableView new];
    [self.view addSubview:_blocktableview];
//    [_blocktableview.tableview setEditing:YES];
    UG_WEAKSELF
    _blocktableview.numberOfRowsInSection = ^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
        return weakSelf.serviceList.count;
    };
    _blocktableview.heightForRowAtIndexPath = ^CGFloat(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        return 60;
    };
    
    
    _blocktableview.cellForRowAtIndexPath = ^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle
                                          reuseIdentifier: @"defualcell"];
            cell.detailTextLabel.numberOfLines = 0;
            cell.selectionStyle = UITableViewCellSelectionStyleDefault;
            cell.textLabel.font = FONT_SYS16;
        }
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        ServiecData* data = [weakSelf.serviceList objectAtIndex:indexPath.row];
        cell.textLabel.text = data.title;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"数据：%@:%@ \n搜索：%@:%@",data.url,data.port,data.url,data.searchPort];
        if(data.isselect){
            cell.backgroundColor = S_CORedText;
        }else{
             cell.backgroundColor = UIColor.whiteColor;
        }
        
        return cell;
    };
    _blocktableview.didSelectRowAtIndexPath = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        ServiecData* data = [weakSelf.serviceList objectAtIndex:indexPath.row];
        [weakSelf sheet:data];
    };
    _blocktableview.titleForDeleteConfirmationButtonForRowAtIndexPath = ^NSString * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath* indexPath) {
        return @"删除";
    };
    _blocktableview.commitEditingStyle = ^(UITableView * _Nonnull tableView, UITableViewCellEditingStyle editingStyle, NSIndexPath * _Nonnull indexPath) {
        if (editingStyle == UITableViewCellEditingStyleDelete) {
            ServiecData* data = [weakSelf.serviceList objectAtIndex:indexPath.row];
            if (!data.isselect) {
                [weakSelf.serviceList removeObject:data];
                [weakSelf.blocktableview.tableview reloadData];
                [[NSUserDefaults standardUserDefaults]setObject:[weakSelf.serviceList modelToJSONString] forKey:@"DorConfigServiceVC.ipdata"];
                [[NSUserDefaults standardUserDefaults] synchronize];
            }else{
                [weakSelf.view ug_msg:@"被选中的选项不能删除"];
            }
        }
    };
}
-(ServiecAddview *)serviecAddview{
    if (!_serviecAddview) {
        _serviecAddview = [ServiecAddview new];
        UG_WEAKSELF
        [_serviecAddview.commitBtn ug_addEvents:UIControlEventTouchUpInside andBlock:^(id  _Nonnull sender) {
            ServiecData* data ;
            if (weakSelf.serviecAddview.editdata) {
                data = weakSelf.serviecAddview.editdata;
            }else{
                data = [ServiecData new];
                [weakSelf.serviceList addObject:data];
            }
            
            if (weakSelf.serviecAddview.titleInput.inputTF.text.length<=0) {
                [weakSelf.serviecAddview ug_msg:@"请输入备注信息"];
                return ;
            }else{
                data.title = weakSelf.serviecAddview.titleInput.inputTF.text;
            }
            
            if (weakSelf.serviecAddview.urlInput.inputTF.text.length<=0) {
                [weakSelf.serviecAddview ug_msg:@"请输入地址信息"];
                return ;
            }else{
                data.url = weakSelf.serviecAddview.urlInput.inputTF.text;
            }
            
            if (weakSelf.serviecAddview.portInput.inputTF.text.length<=0) {
                [weakSelf.serviecAddview ug_msg:@"请输入端口号"];
                return ;
            }else{
                data.port = weakSelf.serviecAddview.portInput.inputTF.text;
            }
            
            if (weakSelf.serviecAddview.searchPortInput.inputTF.text.length<=0) {
                [weakSelf.serviecAddview ug_msg:@"请输入搜索端口"];
                return ;
            }else{
                data.searchPort = weakSelf.serviecAddview.searchPortInput.inputTF.text;
            }
            [weakSelf.serviecAddview removeFromSuperview];
            [weakSelf.blocktableview.tableview reloadData];
            [[NSUserDefaults standardUserDefaults]setObject:[weakSelf.serviceList modelToJSONString] forKey:@"DorConfigServiceVC.ipdata"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }];
    }
    return _serviecAddview;
}

-(void)showServiecAddview:(ServiecData*)data{
    [self.view addSubview:self.serviecAddview];
    self.serviecAddview.editdata  = data;
    [_serviecAddview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.width.mas_equalTo(self.view);
        make.height.mas_equalTo(self.view);
    }];
   
}
-(void)sheet:(ServiecData*)data{
    UG_WEAKSELF
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"选项" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    //自带地图
    [alertController addAction:[UIAlertAction actionWithTitle:@"选中" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
         [self setSelectdata:data];
        [Global_Variable shared].serviceIP = data.url;
        [Global_Variable shared].defaultPort = data.port;
        [Global_Variable shared].searchPort = data.searchPort;
        [weakSelf.blocktableview.tableview reloadData];
    }]];
    
    
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"编辑" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf showServiecAddview:data];
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        if (!data.isselect) {
            [weakSelf.serviceList removeObject:data];
            [weakSelf.blocktableview.tableview reloadData];
            [[NSUserDefaults standardUserDefaults]setObject:[weakSelf.serviceList modelToJSONString] forKey:@"DorConfigServiceVC.ipdata"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }else{
            [weakSelf.view ug_msg:@"被选中的选项不能删除"];
        }
    }]];
    
    //添加取消选项
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        [alertController dismissViewControllerAnimated:YES completion:nil];
        
    }]];
    
    //显示alertController
    [self presentViewController:alertController animated:YES completion:nil];
}
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    [_blocktableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
   
}
@end
