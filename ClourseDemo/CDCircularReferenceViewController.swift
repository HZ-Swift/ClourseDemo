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
    
    var nestFuncClosures: (()->(Int))?
    
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
//        self.view.addSubview(self.conView)
        
        nestFuncClosures = makeIncrementer(forIncrement: 8)
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
    
    /// 一个嵌套的方法
    func makeIncrementer(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        func incrementer() -> Int {
            /// 如果该闭包中使用了self，需要弱引用，因为这个闭包作为了外层方法的返回值，它有可能被赋值给本类的属性
            runningTotal += amount
            return runningTotal
        }
        return incrementer
    }

}


class CircularReferenceView: UIView {
    
    var closures: (()->())?
    
}














