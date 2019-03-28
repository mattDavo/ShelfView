# ShelfView
A simple Swift library for creating a simple shelf view.

Example:

<img src="https://raw.githubusercontent.com/mattDavo/ShelfView/master/images/screenshot.png" width="300"/>

## Installation
### Cocoa Pods
You can use [CocoaPods](https://cocoapods.org/) to install `ShelfView` by adding it to your Podfile:
```ruby
pod 'ShelfView', :git => 'https://github.com/mattDavo/ShelfView.git'
```

## Usage

### Import ShelfView
```Swift

import ShelfView
```
Then add it to view of your view controller and setup the it's dataSource and delegate like you would for a `UITableView` or `UICollectionView`. Here I have set them both to `self`:
```Swift
class ViewController: UIViewController {

    var shelfView: ShelfView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shelfView = ShelfView(frame: view.bounds)
        shelfView.dataSource = self
        shelfView.delegate = self
        view.addSubview(shelfView)
        
        // You can set the size of header height of the shelves, title height of the items' title,
        // the image size for each of items
        shelfView.headerHeight = 50
        shelfView.titleHeight = 40
        shelfView.imageSize = CGSize(width: 200, height: 200)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        shelfView.frame = view.bounds
    }
}
```

Then we implement the methods of the ShelfViewDataSource
```Swift
extension ViewController: ShelfViewDataSource {
    
    // Optional
    // Return how many shelves we want
    func numberOfShelves(in shelfView: ShelfView) -> Int {
        return 10
    }
    
    // Required
    // Return how many items we want on shelf `shelf`
    func shelfView(_ shelfView: ShelfView, numberOfItemsOnShelf shelf: Int) -> Int {
        return 10
    }
    
    // Required
    // Return the title for shelf `shelf`
    func shelfView(_ shelfView: ShelfView, titleFor shelf: Int) -> String {
        return "Shelf \(shelf)"
    }
    
    // Required
    // Setup the shelf item. `ShelfItem`s are subclasses of `UITableViewCell`s so can modify those attributes
    // as well as the imageView and titleLable attributes that make the shelf view look how it does.
    func shelfView(_ shelfView: ShelfView, configure item: ShelfItem, at indexPath: ShelfIndexPath) {
        item.imageView.image = UIImage(named: "dog")
        item.imageView.contentMode = .scaleAspectFit
        item.titleLabel.text = "Item \(indexPath.item) on shelf \(indexPath.shelf)"
    }
}
```

Finally you implement the delegate:
```Swift
extension ViewController: ShelfViewDelegate {
    // Optional
    // Called when item at index path `indexPath` is tapped.
    func shelfView(_ shelfView: ShelfView, didSelectItemAt indexPath: ShelfIndexPath) {
        print("Dog at \(indexPath) woofed!")
    }
}
```

## What Else?
Currently I don't have any more requirements for ShelfView, so I am not actively contributing to it. If you would like to have more features in the ShelfView, please raise an Issue or clone the repo and implement it and make a pull request.

## Attributions
I do not own the dog images, they are from: http://pngimg.com/imgs/animals/dog/.

## License
Available under the [MIT License](https://github.com/mattDavo/Lingo/blob/master/LICENSE)
