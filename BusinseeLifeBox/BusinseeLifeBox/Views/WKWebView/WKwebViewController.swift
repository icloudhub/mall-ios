//
//  WKwebViewController.swift
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/22.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import WebKit

class WKwebViewController: SupleViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        confitUI()
        loadReuest()
    }
    
    lazy var webview:WKWebView = {
        var webview = WKWebView()
        return webview
    }()
    
    
    func confitUI() {
        view.addSubview(webview)
    }
    
    func loadReuest() {
        //设置访问的url
            let url = URL(string: "https://www.jianshu.com/u/5ab366f0368f")
        //根据url创建请求
            let urlRequest = URLRequest(url: url!)
        //加载请求
            webview.load(urlRequest)
    }
    
    
   

}

extension WKwebViewController{
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webview.mas_makeConstraints { (make) in
            make?.edges.mas_equalTo()
        }
    }
}
