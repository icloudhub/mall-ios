//
//  ProductAddActiveCell.swift
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ProductAddActiveCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    lazy var timeView: ProductActiveTimeView = {
        
        let timeView = ProductActiveTimeView()
     
        return timeView
    }()
    
    func configUI() {
        self.addSubview(timeView)
        
    }
    
    override func layoutSubviews() {
          super.layoutSubviews()
          
       
          timeView.mas_makeConstraints { (make) in
            make?.edges.mas_equalTo()
          }
     
      }
    
}
