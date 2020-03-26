//
//  ApplyShopViewController.swift
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/21.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit


class ApplyShopViewController: SupleViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    var shopDefModen:ShopDefModen = ShopDefModen()
    
    //店铺名称
    lazy var scrollView:UIScrollView = {
        var scrollView = UIScrollView()
        return scrollView
    }()
     
    //店铺名称
    lazy var nameInput:UGRemarkView = {
        var nameInput = UGRemarkView()
        nameInput.titlaLabel.text = "店铺名称"
        return nameInput
    }()
    
    // 确认按钮
    lazy var commitBtn:UIButton = {
        var commitBtn = UIButton()
        commitBtn.ug_radius(4)
        commitBtn .setTitle("确认", for: .normal)
        commitBtn.setTitleColor(.white, for: .normal)
        commitBtn.backgroundColor = COLOR_DEF
        commitBtn.ug_add(.touchUpInside) { (sender) in
            NetWorkRequest.share().shopCreat(self.shopDefModen.modelToJSONObject() as! [AnyHashable : Any]) { (_ dic, error) in
                if (error != nil){
                    var nserror:NSError = error! as NSError
                    self.view.ug_msg(nserror.domain)
                }else{
                    self.view.ug_msg("添加成功")
                }
            }
        }
        return commitBtn
    }()
    
    func configUI() {
        self.title = "开店申请"
        view.addSubview(scrollView)
        view.addSubview(commitBtn)
        scrollView.addSubview(nameInput)
    }
}

extension ApplyShopViewController{
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        commitBtn.mas_makeConstraints { (make) in make?.bottom.equalTo()(view)?.setOffset(CGFloat(-(KSAFE_Bottom+10)))
            make?.left.mas_equalTo()(view)?.setOffset(CGFloat(KPAND_DEF))
            make?.right.mas_equalTo()(view)?.setOffset(CGFloat(-KPAND_DEF))
            make?.height.mas_equalTo()(40)
        }
        
        scrollView.mas_makeConstraints { (make) in make?.bottom.equalTo()(view)?.setOffset(CGFloat(-(KSAFE_Bottom+60)))
            make?.left.mas_equalTo()(view)?.setOffset(CGFloat(KPAND_DEF))
            make?.right.mas_equalTo()(view)?.setOffset(CGFloat(-KPAND_DEF))
            make?.top.mas_equalTo()
        }
        
        nameInput.mas_makeConstraints { (make) in
            make?.top.mas_equalTo()
            make?.left.mas_equalTo()(view)?.setOffset(CGFloat(KPAND_DEF))
            make?.right.mas_equalTo()(view)?.setOffset(CGFloat(-KPAND_DEF))
            make?.left.mas_equalTo()(view)?.setOffset(CGFloat(KPAND_DEF))
            make?.height.mas_equalTo()(60)
        }
    }
}


