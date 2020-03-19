//
//  ProductAddImagesCell.swift
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/19.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ProductAddImagesCell: UITableViewCell {
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configUI() {
        
        addSubview(collectionView)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    // 右箭头
    open lazy var collectionView :BlockCollectionView = {
        () -> BlockCollectionView in
        let collectionView = BlockCollectionView()
        collectionView.backgroundColor = .ug_random()
        collectionView.ug_radius(5)
        return collectionView
    }()
    
    override func layoutSubviews() {
         super.layoutSubviews()

         collectionView.mas_makeConstraints { (make) in
             make?.left.mas_equalTo()(KPAND_DEF)
             make?.right.mas_equalTo()(-KPAND_DEF)
             make?.height.mas_equalTo()(78)
             make?.centerY.mas_equalTo()
         }
     }
}
