//
//  OrderViewBodyViewCollectionCell.swift
//  LifeBox
//
//  Created by admin on 2020/6/9.
//  Copyright © 2020 Lucky. All rights reserved.
//

import UIKit

class OrderViewBodyViewCollectionCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame);
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // 卖家自提
    @objc open lazy var imageView :UIImageView = {
        () -> UIImageView in
        let imageView = UIImageView()
        
        return imageView;
    }()
    
    
    func configUI()  {
        self.contentView.addSubview(imageView)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
}
