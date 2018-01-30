//
//  CDViewController.swift
//  ClourseDemo
//
//  Created by Harious on 2018/1/30.
//  Copyright © 2018年 zzh. All rights reserved.
//

import UIKit

class CDViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
    }
    
    deinit {
        print("------- deinit --------------------✅✅✅✅")
        print(NSStringFromClass(self.classForCoder))
        print("------- deinit --------------------")
    }

}
