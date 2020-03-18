//
//  ShopManageViewController.swift
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/18.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ShopManageViewController: SupleViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()

    }
    
    func configUI() -> Void {
        
        view.addSubview(blockTableView)
    }
    
    lazy var blockTableView: BlockTableView = {
        () -> BlockTableView in
        let blockTableView = BlockTableView()
        blockTableView.backgroundColor = COLOR_EE;
        return blockTableView
    }()



}
// lazy
extension ShopManageViewController{
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        blockTableView.mas_makeConstraints { (make) in
            make?.edges.mas_equalTo()
        }
    }
}
