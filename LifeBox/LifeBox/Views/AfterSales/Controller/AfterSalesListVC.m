//
//  AfterSalesListVC.m
//  LifeBox
//
//  Created by admin on 2020/4/23.
//  Copyright © 2020 Lucky. All rights reserved.
//

#import "AfterSalesListVC.h"
#import "AfterSalesTableViewCell.h"

@interface AfterSalesListVC ()<UITableViewDelegate,UITableViewDataSource>

@property(strong, nonatomic) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray * datalist;
@property (nonatomic, strong) PageCollectionView* headerView;
@property(strong, nonatomic) UICollectionViewFlowLayout *flowLayout;
@end

@implementation AfterSalesListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

-(void)configUI{
    self.title = @"售后服务";
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.headerView];
}

-(NSMutableArray *)datalist{
    if (!_datalist) {
        _datalist = [@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"] mutableCopy];
    }
    return _datalist;
}
-(PageCollectionView *)headerView{
    if (!_headerView) {
//<<<<<<< HEAD
//        _headerView = [AfterSalesListHeaderView new];
//        _headerView.items = @[
//            @{@"title": @"售后申请"},
//            @{@"title": @"处理中"},
//            @{@"title": @"售后评价"},
//            @{@"title": @"申请记录"}
//        ];
//        [_headerView setSelectItemBlock:^(UICollectionView * collectionView, NSIndexPath * indexPath) {
//            [self.view ug_msg:@"000"];
//        }];
//=======
        _headerView = [[PageCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
       
        [_headerView setItems:@[
            @{@"title":@"申请售后" },
            @{@"title":@"处理中" },
            @{@"title":@"待评价" }
        ]];
//>>>>>>> fbe08ac60498ea670308e9c6f8003c21c7827be4
    }
    return _headerView;
}
-(UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        
        _flowLayout = [UICollectionViewFlowLayout new];
        _flowLayout.minimumLineSpacing = 0.0;
        _flowLayout.minimumInteritemSpacing = 0.0;
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.itemSize = CGSizeMake(KWidth/3, 44);
    }
    return _flowLayout;
}

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
  
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView setTableFooterView:[UIView new]];
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* indentifier = @"AfterSalesTableViewCell";
    AfterSalesTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[AfterSalesTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];

    }
    cell.textLabel.text = [_datalist objectAtIndex:indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section{
    return 40;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    AfterSalesTableViewHeader *header = [[AfterSalesTableViewHeader alloc]initWithFrame:CGRectMake(0, 0, KWidth-2*SPanding_MID, 40)];
    return header;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    AfterSalesTableViewFoter *fotter = [[AfterSalesTableViewFoter alloc]initWithFrame:CGRectMake(0, 0, KWidth-2*SPanding_MID, 40)];
    return fotter;
}


-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(SPanding_MID);
        make.right.mas_equalTo(self.view).mas_offset(-SPanding_MID);;
        make.top.mas_equalTo(self.headerView.mas_bottom);
        make.bottom.mas_equalTo(self.view);
    }];
}

@end
