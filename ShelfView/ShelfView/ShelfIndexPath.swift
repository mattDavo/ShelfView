//
//  ShelfIndexPath.swift
//  coffee-better
//
//  Created by Matthew Davidson on 8/10/18.
//  Copyright © 2018 MatthewDavidson. All rights reserved.
//

import Foundation

public struct ShelfIndexPath {
    /**
     The index of an item's position on its shelf.
     */
    public var item: Int
    
    /**
     The index of a item's shelf.
     */
    public var shelf: Int
    
    public init(item: Int, shelf: Int) {
        self.item = item
        self.shelf = shelf
    }
}

extension ShelfIndexPath: CustomStringConvertible {
    
    public var description: String {
        return "ShelfIndexPath(item=\(item), shelf=\(shelf))"
    }
}



