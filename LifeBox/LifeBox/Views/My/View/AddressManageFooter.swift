//
//  AddressManageFooter.swift
//  LifeBox
//
//  Created by admin on 2020/6/4.
//  Copyright © 2020 Lucky. All rights reserved.
//

import UIKit

class PickupSelfView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configUI()  {
        self.ug_radius(4)
        self.backgroundColor = UIColor.white;
        addSubview(nameTF)
        addSubview(phoneTF)
        addSubview(addressLab)
        addSubview(commitBtn)
        
    }
    
    @objc open lazy var nameTF :UITextField = {
        () -> UITextField in
        let nameTF = UITextField()
        nameTF.placeholder = "收件人"
        return nameTF;
    }()
    
    @objc open lazy var phoneTF :UITextField = {
        () -> UITextField in
        let phoneTF = UITextField()
        phoneTF.placeholder = "收件人联系方式"
        return phoneTF;
    }()
    
    @objc open lazy var addressLab :UILabel = {
        () -> UILabel in
        let addressLab = UILabel()
        addressLab.numberOfLines = 0
        addressLab.textColor = UIColor.ug_hexString("#232323")
        return addressLab;
    }()
    
    @objc open lazy var commitBtn :UIButton = {
        () -> UIButton in
        let commitBtn = UIButton()
        commitBtn.setTitle("确认", for: .normal)
        commitBtn.ug_radius(4)
        commitBtn.backgroundColor = UIColor.ug_R(111, g: 190, b: 139, a: 1)
        return commitBtn;
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameTF.snp.makeConstraints { (snp) in
            snp.top.equalToSuperview().offset(44)
            snp.left.equalToSuperview().offset(8)
            snp.right.equalToSuperview().offset(-8)
            snp.width.equalTo(300);
            snp.height.equalTo(38)
        }
        phoneTF.snp.makeConstraints { (snp) in
            snp.top.equalTo(nameTF.snp_bottomMargin).offset(8)
            snp.left.equalToSuperview().offset(8)
            snp.right.equalToSuperview().offset(-8)
            snp.height.equalTo(38)
        }
        addressLab.snp.makeConstraints { (snp) in
            snp.top.equalTo(phoneTF.snp_bottomMargin).offset(8)
            snp.left.equalToSuperview().offset(8)
            snp.right.equalToSuperview().offset(-8)
          
        }
        commitBtn.snp.makeConstraints { (snp) in
            snp.top.equalTo(addressLab.snp_bottomMargin).offset(12)
            snp.left.equalToSuperview().offset(8)
            snp.right.equalToSuperview().offset(-8)
            snp.bottom.equalToSuperview().offset(-8)
        }
    }
    
}

class AddressManageFooter: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // 卖家自提
    @objc open lazy var pickupSelfBtn :UIButton = {
        () -> UIButton in
        let pickupSelfBtn = UIButton()
        pickupSelfBtn.setTitle("到店自取", for: .normal)
        pickupSelfBtn.backgroundColor = .ug_random()
        return pickupSelfBtn;
    }()
    // 自提点
    @objc open lazy var pickupStationBtn :UIButton = {
        () -> UIButton in
        let pickupStationBtn = UIButton()
        pickupStationBtn.setTitle("选取自提点", for: .normal)
        pickupStationBtn.backgroundColor = .ug_random()
        return pickupStationBtn;
    }()
    
    func configUI()  {
        addSubview(pickupSelfBtn)
        addSubview(pickupStationBtn)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        pickupSelfBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Float(SPanding_MID))
            make.right.equalToSuperview().offset(Float(-SPanding_MID))
            make.left.equalTo(self.snp.centerX)
        }
        pickupStationBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Float(SPanding_MID))
            make.right.equalTo(self.snp.centerX)
            make.left.equalTo(self).offset(Float(SPanding_MID))
        }
    }
    
}
