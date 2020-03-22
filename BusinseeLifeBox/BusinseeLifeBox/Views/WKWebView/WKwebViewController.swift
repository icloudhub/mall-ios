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

    @objc var url:NSString?
    override func viewDidLoad() {
        super.viewDidLoad()
        confitUI()
        loadReuest()
    }
    
    lazy var webview:WKWebView = {
        var webview = WKWebView()
        webview.navigationDelegate = self
        return webview
    }()
    
    lazy private var progressView: UIProgressView = {
        let progress = UIProgressView.init(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: UIScreen.main.bounds.width, height: 2))
        progress.tintColor = UIColor.green
        progress.trackTintColor = UIColor.white
        return progress
    }()
    
    
    func confitUI() {
        view.addSubview(webview)
        view.addSubview(progressView)
        webview.addObserver(self, forKeyPath: "title", options: .new, context: nil)
        webview.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
    }
    
    func loadReuest() {
        if (url != nil) {
            //设置访问的url
            //根据url创建请求
            let urlRequest = URLRequest(url: URL(string:url as! String)!)
            //加载请求
            webview.load(urlRequest)
        }
      
    }
}

extension WKwebViewController{
  
    override func leftNavBarTouchUp(inside sender: UIButton) {
        if webview.canGoBack {
            webview.goBack()
        }else{
            super.leftNavBarTouchUp(inside: sender)
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webview.mas_makeConstraints { (make) in
            make?.edges.mas_equalTo()
        }
        progressView.mas_makeConstraints { (make) in
            make?.left.equalTo()
            make?.right.equalTo()
            make?.top.equalTo()
            make?.height.equalTo()(1)
        }
    }
}

extension WKwebViewController: WKNavigationDelegate
{
    
    // 监听网页加载进度
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        //设置进度条
        if keyPath == "estimatedProgress"{
            progressView.alpha = 1.0
            progressView.setProgress(Float(webview.estimatedProgress), animated: true)
            if webview.estimatedProgress >= 1.0 {
                UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseOut, animations: {
                    self.progressView.alpha = 0
                }, completion: { (finish) in
                    self.progressView.setProgress(0.0, animated: false)
                })
            }
        }
            
            //重设标题
        else if keyPath == "title" {
            self.title = self.webview.title
        }
        
    }
    
    // 页面开始加载时调用
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        webView.evaluateJavaScript("document.cookie = 'loginToken=zhang';", completionHandler: nil)
     
        debugPrint("开始加载...")
    }
    
    // 当内容开始返回时调用
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!){
        debugPrint("当内容开始返回...")
    }
    
    // 页面加载完成之后调用
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
         debugPrint( "页面加载完成...")
        /// 获取网页title
        self.title = self.webview.title
        
        UIView.animate(withDuration: 0.5) {
            self.progressView.isHidden = true
        }
    }
    
    // 页面加载失败时调用
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error){
        debugPrint( "页面加载失败...")
        UIView.animate(withDuration: 0.5) {
            self.progressView.progress = 0.0
            self.progressView.isHidden = true
        }
        /// 弹出提示框点击确定返回
        let alertView = UIAlertController.init(title: "提示", message: "加载失败", preferredStyle: .alert)
        let okAction = UIAlertAction.init(title:"确定", style: .default) { okAction in
            _=self.navigationController?.popViewController(animated: true)
        }
        alertView.addAction(okAction)
        self.present(alertView, animated: true, completion: nil)
    }
 
}
