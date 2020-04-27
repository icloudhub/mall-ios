//
//  ProductActiveTimeView.swift
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ProductActiveTimeView: UIView {

    lazy var datePicker: UIDatePicker = {
        
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: KHeight-120, width: KWidth, height: 280))
        datePicker.locale = Locale.init(identifier: "zh_CN")
        datePicker.datePickerMode = UIDatePicker.Mode.dateAndTime
        datePicker.minimumDate = Date()
        datePicker.setDate(Date(), animated: true)
        datePicker.addTarget(self, action: #selector(datavalueCahnge(sender:)), for: .valueChanged)
           
        
        return datePicker
    }()
    
    open lazy var begintimeView :UGRemarkView = {
        
        let begintimeView = UGRemarkView()
        begintimeView.titlaLabel.text = "开始时间"
        begintimeView.textView.inputView = datePicker
        return begintimeView
    }()
    
    open lazy var endtimeView :UGRemarkView = {
          
          let endtimeView = UGRemarkView()
          endtimeView.titlaLabel.text = "结束时间"
          endtimeView.textView.inputView = datePicker
          return endtimeView
      }()
    
    @objc func datavalueCahnge(sender:UIDatePicker) {
        let date = datePicker.date
        let timeZone = TimeZone.init(identifier: "UTC")
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = "yyyy-MM-dd hh:mm"
        
        begintimeView.textView.text =  formatter.string(from: date)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
       super.init(frame: frame)
        configUI()
    }
    
    
    
    func configUI(){
        addSubview(begintimeView)
        addSubview(endtimeView)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        begintimeView.mas_makeConstraints { (make) in
            make?.top.mas_equalTo()
            make?.left.mas_equalTo()(KPAND_DEF)
            make?.right.mas_equalTo()(-KPAND_DEF)
            make?.height.mas_equalTo()(60)
        }
        
    }

}

