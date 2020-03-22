//
//  ShopDefModen.swift
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/21.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ShopDefModen: NSObject {
    
    @objc var id:String = ""
    @objc var identityType:NSInteger=0 // 证件类型 0->无 1->个人 2->企业 ,
    @objc var level:NSInteger=0 //  店铺等级 ,
    @objc var lng:CGFloat=0 //  经度 ,
    @objc var lat:CGFloat=0 //纬度 ,
    @objc var memberId:String = "" // 会员id ,
    @objc var address:String = "" // 详细地址 ,
    @objc var bankAccountName:String = "" // 帐户名称 ,
    @objc var bankAccountNumber:String = "" // 银行账号 ,
    @objc var bankBranchName:String = "" // 开户银行支行名称 ,
    @objc var bankName:String = "" // 收款银行 ,
    @objc var businessLicence:String = "" // 营业执照注册号 ,
    @objc var businessLicencePic:String = "" // 营业执照 ,
    @objc var city:String = "" // 城市 ,
    @objc var company:String = "" // 公司名称 ,
    @objc var companyInfo:String = "" // 主体信息 ,
    @objc var district:String = "" // 区域 ,
    @objc var identityNumber:String = "" // 证件号码 ,
    @objc var identityPicBack:String = "" // 证件反面 ,
    @objc var identityPicFront:String = "" // 证件正面 ,
    @objc var keyword:String = "" // 关键字 ,
    @objc var mobile:String = "" // 联系方式 ,
    @objc var name:String = "" // 店铺名 ,
    @objc var person:String = "" // 责任人（法人代表或真实姓名） ,
    @objc var personhandIdentityPic:String = "" // 手持证件拍照 ,
    @objc var province:String = "" // 省份 ,
    @objc var type:String = "" // 经营类型
}
