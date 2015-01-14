//
//  ViewController.swift
//  MZFoundation
//
//  Created by Matsuo Keisuke on 2015/01/08.
//  Copyright (c) 2015年 Matsuo Keisuke. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MZTableViewDelegate {
    @IBOutlet var tableView:MZTableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.mz_delegate = self
        
        self.tableView.bindItem("C", toCell: TableViewCell.classForCoder())
        self.tableView.bindItem("Objective-C", toCell: TableViewCell.classForCoder())
        self.tableView.bindItem("C++", toCell: TableViewCell.classForCoder())
        self.tableView.bindItem("Swift", toCell: TableViewCell.classForCoder())
        self.tableView.bindItem("Go", toCell: TableViewCell.classForCoder())
        
        self.tableView.addSection(MZTableViewSection())
        self.tableView.bindItem("Section2 button by xib", toCell: TableViewCell2.classForCoder())
        
        self.tableView.addSection(MZTableViewSection())
        self.tableView.bindItem("Section3", toIdentifier: "TableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: MZTableView!, didSelectItemAtIndexPath indexPath: NSIndexPath!) {
        if (indexPath.row == 0) {
            
        }
    }
}

