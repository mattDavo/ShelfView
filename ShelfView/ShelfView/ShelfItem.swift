//
//  ShelfRowCell.swift
//  coffee-better
//
//  Created by Matthew Davidson on 7/10/18.
//  Copyright © 2018 MatthewDavidson. All rights reserved.
//

import Foundation

public class ShelfItem: UICollectionViewCell {
    @IBOutlet public var imageView: UIImageView!
    @IBOutlet public var titleLabel: UILabel!
    @IBOutlet var imageHeightConstraint: NSLayoutConstraint!
}
