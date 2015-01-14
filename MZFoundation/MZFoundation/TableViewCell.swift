//
//  TableViewCell.swift
//  MZFoundation
//
//  Created by Matsuo Keisuke on 1/9/15.
//  Copyright (c) 2015 Keisuke Matsuo. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, MZTableViewCellProtocol {
    @IBOutlet var label: UILabel!
    var title: String!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MZTableViewCellProtocol
    class func heightForItem(item: AnyObject!, withTableView tableView: MZTableView!, indexPath: NSIndexPath!) -> CGFloat {
        var titleString:String = item as String
        var height:CGFloat = 44.0 + CGFloat(indexPath.row) * 20.0
        return height
    }

    
    func setItem(item: AnyObject!, withTableView tableView: MZTableView!, indexPath: NSIndexPath!) {
        self.title = item as String
        
        self.updateViews()
    }
    
    func updateViews() {
        self.label.text = self.title
    }
}
