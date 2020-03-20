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
        
        addSubview(imagesEditView)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    // 右箭头
    open lazy var imagesEditView :BlockCollectionView = {
        () -> BlockCollectionView in
        let imagesEditView = BlockCollectionView()
        imagesEditView.backgroundColor = .red
        imagesEditView.flowLayout.minimumLineSpacing = 2.0;
        imagesEditView.flowLayout.minimumInteritemSpacing = 8.0;
        imagesEditView.flowLayout.cellType = .AlignWithLeft;
        imagesEditView.register(ImagesEditViewCell.self, forCellWithReuseIdentifier: "ImagesEditViewCell")
        imagesEditView.ug_radius(5)
        imagesEditView.ug_numberOfSectionsInCollectionView = {(collectionView) in
            return 1;
        }
        imagesEditView.ug_numberOfItemsInSection = {(collectionView, section)in
            return 8;
        }
        imagesEditView.ug_cellForItemAtIndexPath = {(collectionView, indexPath)in
            var cell :ImagesEditViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImagesEditViewCell", for: indexPath) as! ImagesEditViewCell
      
            cell.backgroundColor = .white
            cell.backgroundColor = COLOR_EE;
            cell.imageView.image = UIImage.init(icon: "fa-plus", backgroundColor: .clear, iconColor: .white, andSize: CGSize.init(width: 40, height: 40))
            return cell;
        }
        return imagesEditView
    }()
    
    class func getcellHeight(count: NSInteger) -> CGFloat {
        let tcount = (count>0) ? count : 1
        let line = tcount/3 + ((tcount%3==0) ? 0 : 1);
        let conwight = kSWidth-18;
        let lineheight = (conwight-14)/3;
        let cellheight = CGFloat(line) * lineheight
        return  cellheight + (8 * (CGFloat(line)-1));
     
    }
    
    override func layoutSubviews() {
         super.layoutSubviews()

        imagesEditView.mas_makeConstraints { (make) in
            make?.left.mas_equalTo()(KPAND_DEF)
            make?.right.mas_equalTo()(-KPAND_DEF)
            make?.top.mas_equalTo()
            make?.bottom.mas_equalTo()
        }
     }
}
