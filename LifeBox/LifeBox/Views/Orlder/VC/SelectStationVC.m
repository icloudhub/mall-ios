//
//  SelectStationVC.m
//  LifeBox
//
//  Created by admin on 2020/6/10.
//  Copyright © 2020 Lucky. All rights reserved.
//

#import "SelectStationVC.h"

@interface SelectStationVC ()<UITableViewDelegate,UITableViewDataSource>
@property(strong, nonatomic) UITableView *tableView;
@end

@implementation SelectStationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* indentifier = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];

    }
    cell.textLabel.text =[NSString stringWithFormat:@"%@",[_dalaList objectAtIndex:indexPath.row]] ;
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
