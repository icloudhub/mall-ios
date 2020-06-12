//
//  SelectStationVC.m
//  LifeBox
//
//  Created by admin on 2020/6/10.
//  Copyright © 2020 Lucky. All rights reserved.
//

#import "SelectStationVC.h"
#import "NetWorkRequest+Orlder.h"

@interface SelectStationVC ()<UITableViewDelegate,UITableViewDataSource>
@property(strong, nonatomic) UITableView *tableView;
@end

@implementation SelectStationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self loadData];
}

-(void)configUI{
    self.title = @"编辑tableView";
    [self.view addSubview:self.tableView];
    UIButton *itemButtom = [UIButton  buttonWithType:UIButtonTypeCustom];
    [itemButtom setFrame:CGRectMake(0, 0, 30, 40)];
    [itemButtom setTitle:@"编辑" forState:UIControlStateNormal];
     [itemButtom setTitle:@"完成" forState:UIControlStateSelected];
    [itemButtom setTitleColor:COLORPRIMARY forState:UIControlStateNormal];
    [itemButtom addTarget:self action:@selector(rightBarButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *button = [[UIBarButtonItem alloc]
                               initWithCustomView:itemButtom];
    [self.navigationItem setRightBarButtonItem:button];
    
}
-(void)loadData{
    UG_WEAKSELF
    [[NetWorkRequest new] listbyShopId:weakSelf.shopId endBlock:^(NSDictionary * _Nonnull result, NSError * _Nonnull error) {
        if (error) {
            [self.view ug_msg:error.domain];
        }else{
            weakSelf.dalaList = [NSArray modelArrayWithClass:[StationData class] json:result];
            [weakSelf.tableView reloadData];
        }
    }];
}
-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dalaList.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* indentifier = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:indentifier];
        cell.detailTextLabel.numberOfLines = 0;

    }
    StationData *celldata =  [_dalaList objectAtIndex:indexPath.row];
    cell.textLabel.text =[NSString stringWithFormat:@"%@ %@",celldata.name,celldata.phoneNumber] ;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@ %@\n%@",celldata.province,celldata.city,celldata.region,celldata.detailAddress] ;
    return cell;
}


// 这个回调决定了在当前indexPath的Cell是否可以编辑。
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
    }];
}


@end
