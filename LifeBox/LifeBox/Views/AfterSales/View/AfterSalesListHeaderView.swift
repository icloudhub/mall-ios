//
//  AfterSalesListHeaderView.swift
//  LifeBox
//
//  Created by admin on 2020/4/24.
//  Copyright © 2020 Lucky. All rights reserved.
//

import UIKit

typealias didSelectItemBlock = (_ collectionView: UICollectionView, _ indexPath: IndexPath) -> ()

class AfterSalesListHeaderView: UIView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @objc var selectItemBlock : didSelectItemBlock?
    var _items:NSArray?
    @objc var items:NSArray{
        set{
            _items = newValue
            collectionView.reloadData()
        }
        get{
            return _items ?? []
        }
    }
    open lazy var collectionView :UICollectionView = {
        () -> UICollectionView in
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.ug_radius(5)
        collectionView.backgroundColor = UIColor.yellow
        return collectionView;
    }()
    
    lazy var flowLayout :UICollectionViewFlowLayout = {
        () -> UICollectionViewFlowLayout in
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.minimumLineSpacing = 0.0;
        flowLayout.minimumInteritemSpacing = 0.0;
        flowLayout.scrollDirection = .horizontal
        return flowLayout
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configUI() {
        self.backgroundColor = UIColor.ug_random()
        self .addSubview(collectionView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.snp.makeConstraints { (make) in
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.bottom.equalTo(self)
            make.height.equalTo(self)
        }
    }
    
}

extension AfterSalesListHeaderView{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell :UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.ug_random()
        cell.ug_radius(5)
//        cell.titleLab.text = "\(indexPath.row)"
        return cell;
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / CGFloat(items.count)
        return CGSize.init(width: width, height: 44)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (selectItemBlock != nil) {
            selectItemBlock!(collectionView,indexPath)
        }
    }
}
