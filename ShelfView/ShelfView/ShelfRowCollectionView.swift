//
//  ShelfRowView.swift
//  coffee-better
//
//  Created by Matthew Davidson on 7/10/18.
//  Copyright © 2018 MatthewDavidson. All rights reserved.
//

import Foundation

class ShelfRowCollectionView: UICollectionView {
    
    var configureCell = [(ShelfItem) -> ()]() {
        didSet {
            reloadData()
        }
    }
    
    var onSelect: ((Int) -> ())!
    
    var imageSize = CGSize(width: 150, height: 150) {
        didSet {
            reloadData()
        }
    }
    
    var titleHeight: CGFloat = 46 {
        didSet {
            reloadData()
        }
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    private func commonInit() {
        dataSource = self
        delegate = self
        
        let resourceBundle = Bundle(for: ShelfItem.self)
        
        register(UINib(nibName: "ShelfItem", bundle: resourceBundle), forCellWithReuseIdentifier: "shelfItem")
        
        let padding: CGFloat = 10;
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: padding, bottom: 8, right: padding)
        layout.minimumInteritemSpacing = padding
        layout.minimumLineSpacing = padding
        layout.scrollDirection = .horizontal
        collectionViewLayout = layout
    }
}

extension ShelfRowCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return configureCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shelfItem", for: indexPath) as? ShelfItem else {
            return UICollectionViewCell()
        }
        
        configureCell[indexPath.row](cell)
        cell.imageHeightConstraint.constant = imageSize.height
        
        return cell
    }
}

extension ShelfRowCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onSelect(indexPath.row)
    }
}

extension ShelfRowCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: imageSize.width, height: imageSize.height + 8 + titleHeight)
    }
}
