//
//  ViewController.swift
//  MZFoundation
//
//  Created by Matsuo Keisuke on 2015/01/08.
//  Copyright (c) 2015年 Matsuo Keisuke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView:MZTableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.bindItem("aaaa", toCell: TableViewCell.classForCoder())
        self.tableView.bindItem("aaaa", toCell: TableViewCell.classForCoder())
        self.tableView.bindItem("aaaa", toCell: TableViewCell.classForCoder())
        self.tableView.bindItem("aaaa", toCell: TableViewCell.classForCoder())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

