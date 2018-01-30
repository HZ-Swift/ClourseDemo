//
//  CDCircularReferenceViewController.swift
//  ClourseDemo
//
//  Created by Harious on 2018/1/30.
//  Copyright © 2018年 zzh. All rights reserved.
//

import UIKit

typealias ClosuresTwo = ()->()

class CDCircularReferenceViewController: CDViewController {
    
    var closures: ClosuresTwo?
    
    /// 使用懒加载，里面使用self不会引起循环引用
    lazy var contentView: UIView = {
        let cView = UIView()
        self.view.backgroundColor = UIColor.red
        return cView
    }()
    
    lazy var conView: UIView = {
        let cView = UIView()
        
        let cirView = CircularReferenceView()
        /// 这儿必须弱引用，否则造成循环引用
        cirView.closures = { [unowned self] in
            self.view.backgroundColor = UIColor.green
        }
        cView.addSubview(cirView)
        
        return cView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        circularReference1()
//        self.view.addSubview(self.contentView)
        self.view.addSubview(self.conView)
    }
    
    func circularReference1() {
        /// 引起了循环引用
//        closures = {
//            self.view.backgroundColor = UIColor.red
//        }
        
        /// 用弱引用解决循环引用
//        closures = { [weak self] in
//            self?.view.backgroundColor = UIColor.red
//        }
        
        /// 用无主引用解决循环引用(必须确保引用始终指向一个未销毁的实例)
        closures = { [unowned self] in
            self.view.backgroundColor = UIColor.red
        }
    }

}


class CircularReferenceView: UIView {
    
    var closures: (()->())?
    
}














