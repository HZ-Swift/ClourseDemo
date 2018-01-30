//
//  CDTableViewController.swift
//  ClourseDemo
//
//  Created by Harious on 2018/1/30.
//  Copyright © 2018年 zzh. All rights reserved.
//

import UIKit

class CDTableViewController: UIViewController {

    fileprivate var cellTitles: [String] {
        return ["一些基本的用法", "循环引用问题"]
    }
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "UITableViewCell")
        return tableView
    }()
    
    fileprivate func cellViewController(_ title: String) -> CDViewController {
        
        var vc : CDViewController! = nil
        
        switch title {
        case "一些基本的用法": vc = CDBasicsViewController()
        case "循环引用问题":   vc = CDCircularReferenceViewController()
        default:            vc = CDViewController()
        }
        
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(tableView)
    }

}


extension CDTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = cellTitles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let title = cellTitles[indexPath.row]
        
        let vc = cellViewController(title)
        vc.navigationItem.title = title
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
