//
//  ShelfView.swift
//  coffee-better
//
//  Created by Matthew Davidson on 7/10/18.
//  Copyright © 2018 MatthewDavidson. All rights reserved.
//

import Foundation

public class ShelfView: UIView {
    
    /**
     The object that acts as the data source of the shelf view.
     
     The data source must adopt the `ShelfViewDataSource` protocol. The data source is not retained.
     */
    public var dataSource: ShelfViewDataSource? {
        didSet {
            tableView.reloadData()
        }
    }
    
    /**
     The object that acts as the delegate of the table view.
     
     The delegate must adopt the `ShelfViewDelegate` protocol. The delegate is not retained.
     */
    public var delegate: ShelfViewDelegate?
    
    private var tableView: UITableView!
    
    /**
     The desired size of each image in the cells of the shelf view.
     
     An update to this attribute will trigger a reload of the data.
    */
    public var imageSize = CGSize(width: 150, height: 150) {
        didSet {
            tableView.reloadData()
        }
    }
    
    /**
     The desired height of the title for each of cells of the shelf view.
     
     An update to this attribute will trigger a reload of the data.
     */
    public var titleHeight: CGFloat = 46 {
        didSet {
            tableView.reloadData()
        }
    }
    
    /**
     The desired height of the header of each of the cells of the shelf view.
     
     An update to this attribute will trigger a reload of the data.
     */
    public var headerHeight: CGFloat = 25 {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    private func commonInit() {
        tableView = UITableView(frame: .zero)
        addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        let resourceBundle = Bundle(for: ShelfRowTableViewCell.self)
        
        tableView.register(UINib(nibName: "ShelfRowTableViewCell", bundle: resourceBundle), forCellReuseIdentifier: "shelfRowCell")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        tableView.frame = bounds
    }
    
    public func reloadData() {
        tableView.reloadData()
    }
    
}

extension ShelfView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.numberOfShelves(in: self) ?? 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shelfRowCell", for: indexPath) as? ShelfRowTableViewCell  else {
            return UITableViewCell()
        }
        
        cell.title.text = dataSource?.shelfView(self, titleFor: indexPath.row)
        cell.shelfRow.configureCell = (0..<(dataSource?.shelfView(self, numberOfItemsOnShelf: indexPath.row))!).map { (i) in
            return { (shelfCell) in
                self.dataSource?.shelfView(self, configure: shelfCell, at: ShelfIndexPath(item: i, shelf: indexPath.row))
            }
        }
        cell.shelfRow.onSelect = { (i) in
            self.delegate?.shelfView(self, didSelectItemAt: ShelfIndexPath(item: i, shelf: indexPath.row))
        }
        cell.shelfRow.imageSize = imageSize
        cell.shelfRow.titleHeight = titleHeight
        cell.titleHeightConstraint.constant = headerHeight
        cell.selectionStyle = .none
        
        return cell
    }
}

extension ShelfView: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return titleHeight + 16 + imageSize.height + 16 + headerHeight + 0.5
    }
}
