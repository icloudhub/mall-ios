//
//  ProductAddViewController.swift
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/19.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import TZImagePickerController

class ProductAddViewController: SupleViewController,UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var dataList = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configUI()
    }
    
    func configUI() -> Void {
        self.title = "添加商品"
        view.addSubview(tableview)
    }
    
    lazy var tableview: UITableView = {
        () -> UITableView in
        let tableview = UITableView()
        tableview.backgroundColor = COLOR_EE;
        tableview.dataSource = self
        tableview.delegate = self
        //        tableview.separatorStyle = .none
        return tableview
    }()
    
  
    func loadData(){
        dataList = NSArray.modelArray(with: ProductCellModen.self, json:  [
            [
                "key": "",
                "icon": "fa-github",
                "title": "商品分类",
                "value": "水果"
            ],
            [
                "key": "",
                "icon": "fa-github",
                "title": "商品类别",
                "value": "水果"
            ],
        ])!
    }
}

extension ProductAddViewController{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            
            return dataList.count
        case 1:
            return 2
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cellid = "ShopManageCell"
            var cell:ProductAddSelectCell? = tableView.dequeueReusableCell(withIdentifier: cellid) as? ProductAddSelectCell
            if cell==nil {
                cell = ProductAddSelectCell(style: .subtitle, reuseIdentifier: cellid)
            }
            let data:ProductCellModen = dataList[indexPath.row] as! ProductCellModen
            cell?.titleLab.text = data.title
            cell?.valueLab.text = data.value
            return cell!
        case 1:
            let cellid = "ProductAddInputCell"
            var cell:ProductAddInputCell? = tableView.dequeueReusableCell(withIdentifier: cellid) as? ProductAddInputCell
            if cell==nil {
                cell = ProductAddInputCell(style: .subtitle, reuseIdentifier: cellid)
            }
            cell?.textField.placeholder = "商品标题"
            return cell!
        case 2:
            let cellid = "ProductAddImagesCell"
            var cell:ProductAddImagesCell? = tableView.dequeueReusableCell(withIdentifier: cellid) as? ProductAddImagesCell
            if cell==nil {
                cell = ProductAddImagesCell(style: .subtitle, reuseIdentifier: cellid)
            }
            
            return cell!
            
            
        default:
            let cellid = "cell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
            if cell==nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellid)
            }
            return cell!
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 44
        case 1:
            return 44
        case 2:
            return 80
        default:
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 8
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView.init()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 1
        
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView.init()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goCamera()
    }
}
//
extension ProductAddViewController{
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.mas_makeConstraints { (make) in
            make?.edges.mas_equalTo()
        }
    }
}

extension ProductAddViewController{
    //打开相机
    

   



    func goCamera(){
        
        let sexActionSheet = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        
        weak var weakSelf = self
        
        let sexNanAction = UIAlertAction(title: "从相册中选择", style: UIAlertAction.Style.default){ (action:UIAlertAction)in
            
            weakSelf?.initPhotoPicker()
        }
        let sexNvAction = UIAlertAction(title: "拍照", style: UIAlertAction.Style.default){ (action:UIAlertAction)in

            weakSelf?.initCameraPicker()
        }
        
        let sexSaceAction = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel){ (action:UIAlertAction)in
            
            //填写需要的响应方法
            
        }
        sexActionSheet.addAction(sexNanAction)
        sexActionSheet.addAction(sexNvAction)
        sexActionSheet.addAction(sexSaceAction)
        self.present(sexActionSheet, animated: true, completion: nil)
    }

    //从相册中选择
    func initPhotoPicker(){
        
        let photoPicker = TZImagePickerController()
        photoPicker.allowTakePicture = false
        photoPicker.allowCameraLocation = false
        photoPicker.allowTakeVideo = false
        photoPicker.maxImagesCount = 1
        photoPicker.allowCrop = true
        
        photoPicker.cropRect = CGRect.init(x: 0, y: (kSHeight-200)/2, width: kSWidth, height: 200)
        self.present(photoPicker, animated: true, completion: nil)
    }
    
    //拍照
    func initCameraPicker(){
        
        let photoPicker = TZImagePickerController()
        photoPicker.allowTakePicture = false
        photoPicker.allowCameraLocation = false
        photoPicker.allowTakeVideo = false
        self.present(photoPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {


        if picker.sourceType == .camera {



        }
        self.dismiss(animated: true, completion: nil)
    }
  
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
  
    
}
