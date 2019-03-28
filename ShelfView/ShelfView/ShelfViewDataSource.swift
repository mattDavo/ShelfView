//
//  ShelfViewDataSource.swift
//  coffee-better
//
//  Created by Matthew Davidson on 7/10/18.
//  Copyright © 2018 MatthewDavidson. All rights reserved.
//

import Foundation

/**
 The `ShelfViewDataSource` protocol is adopted by an object that mediates the application’s data model for a `ShelfView` object. The data source provides the shelf-view object with the information it needs to construct and modify a shelf view.
 */
public protocol ShelfViewDataSource {
    /**
     Asks the data source to return the number of sections in the shelf view.
     
     - Parameter shelfView: An object representing the shelf view requesting this information.
     
     - Returns: The number of sections in `shelfView`. The default value is `1`.
     */
    func numberOfShelves(in shelfView: ShelfView) -> Int
    
    /**
     Tells the data source to return the number of rows in a given section of a shelf view.
     
     - Parameter shelfView: the shelf-view object requesting this information
     - Parameter shelf: An index number identifying a shelf in `shelfView`
     
     - Returns: The number of items on `shelf`.
     */
    func shelfView(_ shelfView: ShelfView, numberOfItemsOnShelf shelf: Int) -> Int
    
    /**
     Tells the data source to return the title for a given shelf of a shelf view
     
     - Parameter shelfView: the shelf-view object requesting this information
     - Parameter shelf: An index number identifying a shelf in `shelfView`
     
     - Returns: The title for `shelf`.
     */
    func shelfView(_ shelfView: ShelfView, titleFor shelf: Int) -> String
    
    /**
     Tells the data source to configure a given item of a shelf view
     
     - Parameter shelfView: the shelf-view object requesting this information
     - Parameter item: the `ShelfItem` object given to configure
     - Parameter indexPath: An index path locating a row in `shelfView`.
     */
    func shelfView(_ shelfView: ShelfView, configure item: ShelfItem, at indexPath: ShelfIndexPath)
}

extension ShelfViewDataSource {
    public func numberOfShelves(in shelfView: ShelfView) -> Int {
        return 1
    }
}
