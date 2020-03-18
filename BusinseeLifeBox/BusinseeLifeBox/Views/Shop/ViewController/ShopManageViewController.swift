//
//  ShopManageViewController.swift
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/18.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ShopManageViewController: SupleViewController ,UITableViewDataSource,UITableViewDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        
    }
    
    func configUI() -> Void {
        
        view.addSubview(tableview)
    }
    
    lazy var tableview: UITableView = {
        () -> UITableView in
        let tableview = UITableView()
        tableview.backgroundColor = COLOR_EE;
        tableview.dataSource = self
        tableview.delegate = self
        return tableview
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            
            let cellid = "testCellID"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
            if cell==nil {
                cell = ShopManageCell(style: .subtitle, reuseIdentifier: cellid)
            }
            
            cell?.textLabel?.text = "这个是标题~"
            cell?.detailTextLabel?.text = "这里是内容了油~"
            cell?.imageView?.image = UIImage(named:"Expense_success")
            return cell!
            
        default:
            
            let cellid = "testCellID"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
            if cell==nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellid)
            }
            
            cell?.textLabel?.text = "这个是标题~"
            cell?.detailTextLabel?.text = "这里是内容了油~"
            cell?.imageView?.image = UIImage(named:"Expense_success")
            return cell!
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 100
        default:
            return 44
        }
    }
    
    
    
}
// lazy
extension ShopManageViewController{
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.mas_makeConstraints { (make) in
            make?.edges.mas_equalTo()
        }
    }
}
