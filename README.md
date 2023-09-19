# ios-tools
Contains tools like extensions or helpers for iOS projects

## Extensions
### 1. UIView+Layout
### 2. UIView+Extensions
### 3. UIColor+Extensions
### 4. Reusable
Use `Reusable` or `NibReusable` to reduce redundant register or dequeue cell code.
```swift
// Conform 'Reusable' or 'NibReusable' protocol
final class SimpleCollectionViewCell: UICollectionViewCell, NibReusable { /* Conform protocol */ }

// Registering Cell
// From this
let nib = UINib(nibName: "SimpleCollectionViewCell", bundle: nil)
collectionView.register(nib, forCellWithReuseIdentifier: "SimpleCollectionViewCell")

// To this
collectionView.registerCell(SimpleCollectionViewCell.self)

// Dequeue Cell
// From this
guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SimpleCollectionViewCell", for: indexPath) as? SimpleCollectionViewCell else {
    fatalError("Failed to dequeue SimpleCollectionViewCell")
}

// To this
let cell: SimpleCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
```
