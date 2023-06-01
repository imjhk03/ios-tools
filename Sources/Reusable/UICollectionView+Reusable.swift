//
//  UICollectionView+Reusable.swift
//
//
//  Created by Joohee Kim on 2023/06/01.
//

#if os(iOS)
import UIKit

extension UICollectionView {
    
    func registerCell<T: UICollectionViewCell>(_: T.Type) where T: Reusable {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerCell<T: UICollectionViewCell>(_: T.Type) where T: NibReusable {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerCells<T: UICollectionViewCell>(_ cellTypes: [T.Type]) where T: Reusable {
        for cellType in cellTypes {
            registerCell(cellType.self)
        }
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }

        return cell
    }
}
#endif
