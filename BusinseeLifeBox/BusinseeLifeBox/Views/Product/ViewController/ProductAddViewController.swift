//
//  ProductAddViewController.swift
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/19.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import TZImagePickerController

class ProductAddViewController: SupleViewController,UITableViewDataSource,UITableViewDelegate,TZImagePickerControllerDelegate ,UINavigationControllerDelegate{
    
    var activeType = 0 //0->无活动
    
    var imageList = NSMutableArray.init(capacity: 0)
    var specsList = NSArray.modelArray(with: ProductCellModen.self, json:  [
        [
            "key": "",
            "icon": "fa-github",
            "title": "商品单位",
            "value": "件"
        ],
        [
            "key": "",
            "icon": "fa-github",
            "title": "货号",
            "value": ""
        ],
    ])!
    var dataList = NSArray.modelArray(with: ProductCellModen.self, json:  [
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        return tableview
    }()
    
    
   
}
// tableview
extension ProductAddViewController{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: //商品分类
            return dataList.count
        case 1: //商品名称标题
            return 2
        case 2: //商品图片
            return 1
        case 3: // 计价单位
            return specsList.count
        case 4: // 商品活动
            return 1
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
                cell?.selectionStyle = .none
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
                cell?.selectionStyle = .none
            }
            cell?.textField.titlaLabel.text = "商品标题"
            
            return cell!
        case 2:
            let cellid = "ProductAddImagesCell"
            var cell:ProductAddImagesCell? = tableView.dequeueReusableCell(withIdentifier: cellid) as? ProductAddImagesCell
            if cell==nil {
                cell = ProductAddImagesCell(style: .subtitle, reuseIdentifier: cellid)
                cell?.selectionStyle = .none
                cell?.didSelectItemBlock = {(collectionView,  indexPath) in
                    if(indexPath.row>=self.imageList.count){
                        self.goCamera()
                    }
                }
                cell?.deleteItemBlockBlock = {(index) in
                    if(index<self.imageList.count){
                        self.imageList.removeObject(at: index)
                        self.tableview.reloadData()
                    }
                }
            }
            cell?.images = imageList;
            cell?.imagesEditView.reloadData()
            return cell!
        case 3:
            let cellid = "ProductAddInputCell"
            var cell:ProductAddInputCell? = tableView.dequeueReusableCell(withIdentifier: cellid) as? ProductAddInputCell
            if cell==nil {
                cell = ProductAddInputCell(style: .subtitle, reuseIdentifier: cellid)
                cell?.selectionStyle = .none
            }
            let data:ProductCellModen = specsList[indexPath.row] as! ProductCellModen
            cell?.textField.titlaLabel.text = data.title
            cell?.textField.text = data.value
            return cell!
        case 4:
            let cellid = "ProductAddSelectCell"
            var cell:ProductAddSelectCell? = tableView.dequeueReusableCell(withIdentifier: cellid) as? ProductAddSelectCell
            if cell==nil {
                cell = ProductAddSelectCell(style: .subtitle, reuseIdentifier: cellid)
                cell?.selectionStyle = .none
            }
            cell?.titleLab.text = "活动选择"
            cell?.valueLab.text = self.getActivieStr()
            return cell!
        case 5:
            let cellid = "ProductAddActiveCell"
            var cell:ProductAddActiveCell? = tableView.dequeueReusableCell(withIdentifier: cellid) as? ProductAddActiveCell
            if cell==nil {
                cell = ProductAddActiveCell(style: .subtitle, reuseIdentifier: cellid)
                cell?.selectionStyle = .none
            }
            return cell!
            
        default:
            let cellid = "cell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
            if cell==nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellid)
                cell?.selectionStyle = .none
            }
            
            return cell!
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 44
        case 1:
            return 60
        case 2:
            return ProductAddImagesCell.getcellHeight(count: imageList.count)
        case 3:
            return 60
        case 4:
            return 44
        case 5:
            return 240
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
        switch indexPath.section {
        case 4:
            handleChooseactivity()
        default: break
            
        }
    }
}
// TODO 布局
extension ProductAddViewController{
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.mas_makeConstraints { (make) in
            make?.edges.mas_equalTo()
        }
    }
}
// 照片
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
        photoPicker.pickerDelegate  = self
        photoPicker.delegate = self
        
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
    
    func imagePickerController(_ picker: TZImagePickerController!, didFinishPickingPhotos photos: [UIImage]!, sourceAssets assets: [Any]!, isSelectOriginalPhoto: Bool, infos: [[AnyHashable : Any]]!) {
        self.imageList.addObjects(from: photos)
        tableview.reloadData()
        
    }
    
    
    
}
// 活动选择
extension ProductAddViewController{
    func handleChooseactivity() {
        let actionSheet = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        
        weak var weakSelf = self
        let noneAction = UIAlertAction(title: "无", style: UIAlertAction.Style.default){ (action:UIAlertAction)in
            weakSelf?.activeType = 0
            weakSelf?.tableview.reloadData()
        }
        let timeAction = UIAlertAction(title: "限时抢购", style: UIAlertAction.Style.default){ (action:UIAlertAction)in
            weakSelf?.activeType = 1
            weakSelf?.tableview.reloadData()
        }
        let menberAction = UIAlertAction(title: "会员特价", style: UIAlertAction.Style.default){ (action:UIAlertAction)in
            weakSelf?.activeType = 2
            weakSelf?.tableview.reloadData()
        }
        let fullAction = UIAlertAction(title: "满减/满赠", style: UIAlertAction.Style.default){ (action:UIAlertAction)in
            weakSelf?.activeType = 3
            weakSelf?.tableview.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel){ (action:UIAlertAction)in
    
        }
        
        actionSheet.addAction(noneAction)
        actionSheet.addAction(timeAction)
        actionSheet.addAction(menberAction)
        actionSheet.addAction(fullAction)
        actionSheet.addAction(cancelAction)
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func getActivieStr()->String{
        switch activeType {
        case 0:
            return "无活动"
        case 1:
            return "限时抢购"
        case 2:
            return "会员特价"
        case 3:
            return "满减/打折"
        default:
            return "无"
        }
    }
}
