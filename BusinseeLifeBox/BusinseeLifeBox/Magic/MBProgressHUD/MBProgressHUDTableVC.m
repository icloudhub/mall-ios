//
//  MBProgressHUDTableVC.m
//  UbunGit_OC
//
//  Created by admin on 2019/4/16.
//  Copyright © 2019 admin. All rights reserved.
//

#import "MBProgressHUDTableVC.h"
#import "UIView+Alert.h"
#import "UGPersentView.h"
@interface MBProgressHUDTableVC ()
@property(strong, nonatomic)NSArray *tableviewArr;
@end

@implementation MBProgressHUDTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"弹框";
    self.tableviewArr = @[@"alert",@"alertimageType",@"alertview", @"loading",@"UGPersentView",@"svga"];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _tableviewArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[_tableviewArr objectAtIndex:indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *titlestr = [_tableviewArr objectAtIndex:indexPath.row];
    if([titlestr isEqualToString:@"alert"]){
        
        [self.view ug_msg:@"alert"];
        
    }else if([titlestr isEqualToString:@"alertimageType"]){
        
       [self.view ug_alertimageType:@"tanchuang"];
        
    }else if([titlestr isEqualToString:@"alertview"]){
        
        UIView * temview = [UIView new];
        temview.backgroundColor = [UIColor yellowColor];
        [self.view ug_alertview:temview];
        [temview mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(350);
            make.height.mas_equalTo(200);
        }];
        
    }else if ([titlestr isEqualToString:@"loading"]) {
        
        [self.view ug_starloading];
        [self.view performSelector:@selector(ug_stoploading) withObject:nil afterDelay:3];
    }else if([titlestr isEqualToString:@"UGPersentView"]){
         UGPersentView *perview = [UGPersentView new];
        [self.tableView addSubview:perview];
        [perview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(perview.superview);
        }];


    }else if([titlestr isEqualToString:@"svga"]){
         UGPersentView *perview = [UGPersentView new];
        [self.tableView addSubview:perview];
        [perview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(perview.superview);
        }];


    }
    
}


@end
