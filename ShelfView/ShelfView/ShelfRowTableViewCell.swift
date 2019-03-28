//
//  ShelfRowTableViewCell.swift
//  coffee-better
//
//  Created by Matthew Davidson on 7/10/18.
//  Copyright © 2018 MatthewDavidson. All rights reserved.
//

import Foundation

class ShelfRowTableViewCell: UITableViewCell {
    @IBOutlet var shelfRow: ShelfRowCollectionView!
    @IBOutlet var title: UILabel!
    @IBOutlet var titleHeightConstraint: NSLayoutConstraint!
}
