//
//  BaseFun.swift
//  OLMagicBox_Swift
//
//  Created by MBA on 2019/5/30.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation


public let kSWidth  : CGFloat = UIScreen.main.bounds.size.width
public let kSHeight : CGFloat = UIScreen.main.bounds.size.height

/*
 * 安全边界
 */
public let KSAFE_Bottom : CGFloat = SafeAreaInsets.getSafeBottom()
public let KSAFE_Top : CGFloat = SafeAreaInsets.getSafeTop()

//间距
public let  KPAND_DEF : CGFloat = 15 //默认间距
public let  KPAND_MID : CGFloat = 10 //小间距
public let  KPAND_MIN : CGFloat = 5 //小间距


/// App 名称
public let kAppDisplayName: String = Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String
/// App 当前版本号
public let kAppCurVersion :String? = (Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String)

/// 375设计图按比例计算值
func KAutoAcale (value :CGFloat) -> CGFloat{
    return (value*kSWidth)/375
}


