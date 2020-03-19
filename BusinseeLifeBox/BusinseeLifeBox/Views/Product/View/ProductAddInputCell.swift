//
//  ProductAddInputCell.swift
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/19.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ProductAddInputCell: UITableViewCell {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configUI() {
        addSubview(textField)
    }
    
    //标题
    open lazy var textField : UITextField = {
        ()->UITextField in
        let textField = UITextField()
        textField.font = FONT_SYS14
        return textField
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        textField.mas_makeConstraints { (make) in
            make?.left.mas_equalTo()(KPAND_DEF)
            make?.right.mas_equalTo()(-KPAND_DEF)
            make?.height.mas_equalTo()(32)
            make?.centerY.mas_equalTo()
        }
        
    }
    
}
