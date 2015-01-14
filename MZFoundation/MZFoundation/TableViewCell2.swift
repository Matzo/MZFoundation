//
//  TableViewCell2.swift
//  MZFoundation
//
//  Created by Matsuo Keisuke on 1/12/15.
//  Copyright (c) 2015 Keisuke Matsuo. All rights reserved.
//

import UIKit

class TableViewCell2: UITableViewCell, MZTableViewCellProtocol {
    @IBOutlet var btn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setItem(item: AnyObject!, withTableView tableView: MZTableView!, indexPath: NSIndexPath!) {
        var title: String = item as String
        self.btn.setTitle(title, forState: .Normal)
    }
}
