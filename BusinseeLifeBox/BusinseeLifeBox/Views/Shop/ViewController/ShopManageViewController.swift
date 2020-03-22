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
        if UserInfo.share().shopid.count<=0 {
          alertOpenShopActive()
        }
    }
    
    func configUI() -> Void {
        self.title = "店铺管理"
        view.addSubview(tableview)
    }
    
    lazy var tableview: UITableView = {
        () -> UITableView in
        let tableview = UITableView()
        tableview.backgroundColor = COLOR_EE;
        tableview.dataSource = self
        tableview.delegate = self
        tableview.separatorStyle = .none
        return tableview
    }()
    
    
    var dataList = [
        [
            "key": "",
            "icon": "fa-github",
            "title": "店铺认证"
        ],
        [
            "key": "",
            "icon": "fa-github",
            "title": "保障金保障"
        ],
        [
            "key": "",
            "icon": "fa-github",
            "title": "店铺管理员"
        ] ,
        [
            "key": "",
            "icon": "fa-github",
            "title": "店铺地址"
        ]
    ]
    
    
    
}
extension ShopManageViewController{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return dataList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cellid = "ShopManageCell"
            var cell:ShopManageCell? = tableView.dequeueReusableCell(withIdentifier: cellid) as? ShopManageCell
            if cell==nil {
                cell = ShopManageCell(style: .subtitle, reuseIdentifier: cellid)
            }
            cell?.titleLab.text = "黄先生的店"
            cell?.defLab.text = "黄先生的店的简要说明"
            return cell!
            
            
        default:
            
            let cellid = "ShopToolCell"
            var cell:ShopToolCell? = tableView.dequeueReusableCell(withIdentifier: cellid) as? ShopToolCell
            if cell==nil {
                cell = ShopToolCell(style: .subtitle, reuseIdentifier: cellid)
            }
            let dic = dataList[indexPath.row]
            cell?.titleLab.text = dic["title"]
            cell?.headImageView.image = .init(icon: dic["icon"], backgroundColor: .clear, iconColor: .ug_random(), fontSize: 32)
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 8
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView.init()
    }
}
//
extension ShopManageViewController{
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.mas_makeConstraints { (make) in
            make?.edges.mas_equalTo()
        }
    }
    
    
}


// 开店提示
extension ShopManageViewController {
    func alertOpenShopActive() {
        let alertController = UIAlertController(title: "提示", message: "你还没有开通店铺",preferredStyle: .alert)
        let commitAction = UIAlertAction(title: "去开店", style: .default){ (action:UIAlertAction)in
            self.navigationController!.pushViewController(ApplyShopViewController(), animated: true)
            
        }
        let cancelAction = UIAlertAction(title: "取消", style: .cancel){ (action:UIAlertAction)in
            
        }
        alertController.addAction(commitAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
  
}
