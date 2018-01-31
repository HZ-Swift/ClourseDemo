//
//  CDValueCaptureViewController.swift
//  ClourseDemo
//
//  Created by Harious on 2018/1/31.
//  Copyright © 2018年 zzh. All rights reserved.
//

import UIKit

class CDValueCaptureViewController: CDViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        valueCapture1()
        
        valueCapture2()
    }

    func valueCapture1() {
        let incrementByFive = makeIncrementer(forIncrement: 5)
        print(incrementByFive()) //打印5
        print(incrementByFive()) //打印10
        print(incrementByFive()) //打印15
        
        // 注意这儿 incrementByEight 跟上面的 incrementByFive 是没有关系的
        let incrementByEight = makeIncrementer(forIncrement: 8)
        print(incrementByEight())  //打印8
        print(incrementByEight())  //打印16
        print(incrementByEight())  //打印24
    }
    
    func makeIncrementer(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        func incrementer() -> Int {
            // 能够捕获到incrementer外，外层方法中的变量
            runningTotal += amount
            return runningTotal
        }
        return incrementer
    }
    
    /// 写这个主要是区分跟OC中的block中的值捕获
    /// 这种情况的值捕获跟OC中block的值捕获完全不一样，相当于将在OC中全加__block的效果,能捕获到调用闭包时的值，而不是定义闭包时的值
    func valueCapture2() {
        
        var number = 2
        var xiao = Person()
        
        let closures = {
            print(number)
            print(xiao.name)
        }
        
        closures()

        number = 55
        xiao = Person()
        xiao.name = "dahai"
        closures()
    }

}

class Person {
    var name : String = "xiaohai"
}





