//
//  MenuTableViewCell.swift
//  TestMenuBar
//
//  Created by Timur Isaev on 20.01.2021.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuLabel: UILabel!
 
    func configureCell(withItem item: MenuStruct) {
        self.menuLabel.text = "\(item.number). \(item.name)"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            contentView.backgroundColor = UIColor.blue
        } else {
            contentView.backgroundColor = UIColor.clear
        }
    }
}
