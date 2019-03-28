//
//  ShelfViewDelegate.swift
//  coffee-better
//
//  Created by Matthew Davidson on 7/10/18.
//  Copyright © 2018 MatthewDavidson. All rights reserved.
//

import Foundation

public protocol ShelfViewDelegate {
    /**
     Tells the delegate that the item at the specified index path was selected.
     
     - Parameter shelfView: the shelf-view object providing this information
     - Parameter indexPath: An index path locating a row in `shelfView`.
     */
    func shelfView(_ shelfView: ShelfView, didSelectItemAt indexPath: ShelfIndexPath)
}

extension ShelfViewDelegate {
    public func shelfView(_ shelfView: ShelfView, didSelectItemAt indexPath: ShelfIndexPath) {
        
    }
}
