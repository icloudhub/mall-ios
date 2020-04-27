//
//  ProductAddImagesCell.swift
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/19.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
typealias DidSelectItemBlockBlock = (_ collectionView: UICollectionView, _ indexPath: IndexPath) -> Void
typealias DeleteItemBlockBlock = (_ index: NSInteger) -> Void

class ProductAddImagesCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var images = NSMutableArray.init()
    var maxCount = 6 //最大图片数量
    var didSelectItemBlock: DidSelectItemBlockBlock!
    var deleteItemBlockBlock: DeleteItemBlockBlock!
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
    open lazy var imagesEditView :UICollectionView = {
        () -> UICollectionView in
        let imagesEditView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
        imagesEditView.delegate = self
        imagesEditView.dataSource = self
        imagesEditView.backgroundColor = .white
        imagesEditView.register(ImagesEditViewCell.self, forCellWithReuseIdentifier: "ImagesEditViewCell")
        imagesEditView.ug_radius(5)
      
        return imagesEditView
    }()
    
    lazy var flowLayout :UICollectionViewFlowLayout = {
        () -> UICollectionViewFlowLayout in
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.minimumLineSpacing = 4.0;
        flowLayout.minimumInteritemSpacing = 4.0;
        return flowLayout
    }()
    
  
    
    class func getcellHeight(count: NSInteger) -> CGFloat {
        let tcount = count+1
        let line = tcount/3 + ((tcount%3==0) ? 0 : 1);
        let conwight = KWidth-18;
        let lineheight = (conwight-14)/3;
        let cellheight = CGFloat(line) * lineheight
        return  cellheight + (8 * (CGFloat(line)-1)) + 16.0
     
    }
    
    override func layoutSubviews() {
         super.layoutSubviews()

        imagesEditView.mas_makeConstraints { (make) in
            make?.left.mas_equalTo()
            make?.right.mas_equalTo()
            make?.top.mas_equalTo()
            make?.bottom.mas_equalTo()
        }
     }
}


extension ProductAddImagesCell{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if images.count == 0 {
            return 1;
        }
        if images.count < maxCount {
            return images.count+1;
        }
        return maxCount
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let conwight = KWidth-18;
        return CGSize.init(width: (conwight-14)/3, height: (conwight-14)/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 8, left: 10, bottom: 8, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell :ImagesEditViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImagesEditViewCell", for: indexPath) as! ImagesEditViewCell
        cell.deleteBtn.ug_add(.touchUpInside) { (sender) in
            if(indexPath.row<self.images.count){
                if self.deleteItemBlockBlock != nil {
                    self.deleteItemBlockBlock(indexPath.row)
                }
            }
            collectionView .reloadData()
        }
        
        cell.backgroundColor = .white
        cell.backgroundColor = COLOR_EE;
        if indexPath.row == images.count {
            cell.deleteBtn.isHidden = true
            cell.imageView.image = UIImage.init(icon: "fa-plus", backgroundColor: .clear, iconColor: .white, andSize: CGSize.init(width: 40, height: 40))
        }else{
            cell.deleteBtn.isHidden = false
            let image = images.object(at: indexPath.row)
            cell.imageView.image = image as? UIImage
        }
        
        return cell;
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.didSelectItemBlock != nil {
            didSelectItemBlock(collectionView,indexPath)
        }
    }
    
}
