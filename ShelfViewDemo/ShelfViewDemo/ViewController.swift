//
//  ViewController.swift
//  ShelfViewDemo
//
//  Created by Matthew Davidson on 5/3/19.
//  Copyright © 2019 MatthewDavidson. All rights reserved.
//  Images from http://pngimg.com/imgs/animals/dog/
//

import UIKit
import ShelfView

fileprivate struct ShelfData {
    var title: String
    var items: [ShelfItemData]
}

fileprivate struct ShelfItemData {
    var title: String
    var image: UIImage?
}

fileprivate let shelves = [
    ShelfData(title: "Shelf 1", items: [
        ShelfItemData(title: "Hello, world", image: UIImage(named: "dog1")),
        ShelfItemData(title: "I love ShelfViews", image: UIImage(named: "dog2"))
        ]),
    ShelfData(title: "Shelf 2", items: [
        ShelfItemData(title: "You", image: UIImage(named: "dog3")),
        ShelfItemData(title: "can", image: UIImage(named: "dog4")),
        ShelfItemData(title: "have", image: UIImage(named: "dog5")),
        ShelfItemData(title: "multiple", image: UIImage(named: "dog6")),
        ShelfItemData(title: "items", image: UIImage(named: "dog7")),
        ShelfItemData(title: "on", image: UIImage(named: "dog8")),
        ShelfItemData(title: "multiple", image: UIImage(named: "dog9")),
        ShelfItemData(title: "shelves.", image: UIImage(named: "dog10")),
        ]),
    ShelfData(title: "Shelf 3", items: [
        ShelfItemData(title: "Isn't", image: UIImage(named: "dog11"))
        ]),
    ShelfData(title: "Shelf 4", items: [
        ShelfItemData(title: "This", image: UIImage(named: "dog12"))
        ]),
    ShelfData(title: "Shelf 5", items: [
        ShelfItemData(title: "Great?", image: UIImage(named: "dog13"))
        ])
]

class ShelfViewController: UIViewController {

    var shelfView: ShelfView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shelfView = ShelfView(frame: view.bounds)
        shelfView.dataSource = self
        shelfView.delegate = self
        view.addSubview(shelfView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        shelfView.frame = view.bounds
    }
}

extension ShelfViewController: ShelfViewDataSource {
    
    func numberOfShelves(in shelfView: ShelfView) -> Int {
        return shelves.count
    }
    
    func shelfView(_ shelfView: ShelfView, numberOfItemsOnShelf shelf: Int) -> Int {
        return shelves[shelf].items.count
    }
    
    func shelfView(_ shelfView: ShelfView, titleFor shelf: Int) -> String {
        return shelves[shelf].title
    }
    
    func shelfView(_ shelfView: ShelfView, configure item: ShelfItem, at indexPath: ShelfIndexPath) {
        item.imageView.image = shelves[indexPath.shelf].items[indexPath.item].image
        item.imageView.contentMode = .scaleAspectFit
        item.titleLabel.text = shelves[indexPath.shelf].items[indexPath.item].title
    }
}

extension ShelfViewController: ShelfViewDelegate {
    func shelfView(_ shelfView: ShelfView, didSelectItemAt indexPath: ShelfIndexPath) {
        print("Dog at \(indexPath) woofed!")
    }
}
