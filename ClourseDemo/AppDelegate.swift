//
//  AppDelegate.swift
//  ClourseDemo
//
//  Created by Harious on 2018/1/30.
//  Copyright © 2018年 zzh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = UINavigationController(rootViewController: CDTableViewController())
        window?.makeKeyAndVisible()
        
        return true
    }




}

