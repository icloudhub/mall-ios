//
//  ShopToolCell.swift
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/19.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ShopToolCell: UITableViewCell {

   // 头像
    open lazy var headImageView :UIImageView = {
        () -> UIImageView in
        let headImageView = UIImageView()
        return headImageView
    }()
    //标题
    open lazy var titleLab : UILabel = {
        ()->UILabel in
        let titleLab = UILabel()
        titleLab.font = FONT_SYS14
        titleLab.textColor = COLOR_23
        return titleLab
    }()
    
    //描述
    open lazy var defLab : UILabel = {
        ()->UILabel in
        let defLab = UILabel()
        defLab.font = FONT_SYS12
        defLab.textColor = COLOR_33
        return defLab
    }()
    
    // 右箭头
    open lazy var arrowImageView :UIImageView = {
        () -> UIImageView in
        let arrowImageView = UIImageView()
        arrowImageView.image = .init(icon: "fa-angle-right", backgroundColor: .clear, iconColor: COLOR_33, fontSize: 14)
        return arrowImageView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    
    func configUI() {
        addSubview(headImageView)
        addSubview(arrowImageView)
        addSubview(titleLab)
        addSubview(defLab)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        headImageView.mas_makeConstraints { (make) in
            make?.left.mas_equalTo()(KPAND_DEF)
            make?.centerY.equalTo()
            make?.size.mas_equalTo()(CGSize.init(width: 32, height: 32))
        }
        arrowImageView.mas_makeConstraints { (make) in
            make?.right.mas_equalTo()(-KPAND_DEF)
            make?.centerY.mas_equalTo()
        }
        titleLab.mas_makeConstraints { (make) in
            make?.left.equalTo()(headImageView.mas_right)?.setOffset(CGFloat(KPAND_MIN))
            make?.centerY.equalTo()
        }
    }
}
    
