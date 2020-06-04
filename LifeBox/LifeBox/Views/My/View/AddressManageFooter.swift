//
//  AddressManageFooter.swift
//  LifeBox
//
//  Created by admin on 2020/6/4.
//  Copyright © 2020 Lucky. All rights reserved.
//

import UIKit

class AddressManageFooter: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame);
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // 卖家自提
    open lazy var pickupSelfBtn :UIButton = {
           () -> UIButton in
           let pickupSelfBtn = UIButton()
        pickupSelfBtn.setTitle("到店自取", for: .normal)
           pickupSelfBtn.backgroundColor = .ug_random()
           return pickupSelfBtn;
       }()
    // 自提点
    open lazy var pickupStationBtn :UIButton = {
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
