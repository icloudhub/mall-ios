//
//  SettingViewController.swift
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/18.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import SnapKit
class SettingViewController: UIViewController {
    
    // 退出登陆
    open lazy var loginoutBtn :UIButton = {
        ()->UIButton in
        let loginoutBtn = UIButton()
        loginoutBtn.backgroundColor = COLOR_DEF
        loginoutBtn.ug_radius(CGFloat(KRADIUS_MIN))
        loginoutBtn.setTitle("退出登陆", for: .normal)
        loginoutBtn.ug_add(.touchUpInside) { (sender) in
            UserDefaults.standard.removeObject(forKey: "LoginUserInfo")
            
            let loginvc = LoginViewController.init()
            let nav = RTRootNavigationController.init(rootViewController: loginvc);
            UIApplication.shared.keyWindow?.rootViewController = nav;
            UIApplication.shared.keyWindow?.makeKeyAndVisible();
        }
        return loginoutBtn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI();
    }
    
    func configUI() {
        view.addSubview(loginoutBtn)
    }

}

extension SettingViewController{
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        loginoutBtn.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(KPAND_DEF)
            make.right.equalTo(-KPAND_DEF)
            make.bottom.equalTo(-KPAND_DEF)
            make.height.equalTo(44)
        }
    }
}
