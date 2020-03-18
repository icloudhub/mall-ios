//
//  ShopManageCell.swift
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/18.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ShopManageCell: UITableViewCell {

    lazy var headImageView :UIImageView = {
        () -> UIImageView in
        let headImageView = UIImageView()
        headImageView.backgroundColor = COLOR_EE;
        return headImageView
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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()
       
        headImageView.mas_makeConstraints { (make) in
            make?.left.mas_equalTo()(KPAND_DEF)
            make?.top.mas_equalTo()(KPAND_DEF)
            make?.size.mas_equalTo()(CGSize.init(width: 60, height: 60))
        }
       
    }

}
