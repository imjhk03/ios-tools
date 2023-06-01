//
//  UICollectionView+Reusable.swift
//
//
//  Created by Joohee Kim on 2023/06/01.
//

#if os(iOS)
import UIKit

public extension UICollectionView {
    
    func registerCell<T: UICollectionViewCell>(_: T.Type) where T: Reusable {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerCell<T: UICollectionViewCell>(_: T.Type) where T: NibReusable {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }

        return cell
    }
    
    enum SupplementaryViewKind {
        case header
        case footer
        
        var rawValue: String {
            switch self {
            case .header:
                return UICollectionView.elementKindSectionHeader
            case .footer:
                return UICollectionView.elementKindSectionFooter
            }
        }
    }
    
    func registerView<T: UICollectionReusableView>(_ viewClass: T.Type, forSupplementaryViewKind: SupplementaryViewKind) where T: Reusable {
        register(T.self, forSupplementaryViewOfKind: forSupplementaryViewKind.rawValue, withReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerView<T: UICollectionReusableView>(_ viewClass: T.Type, forSupplementaryViewKind: SupplementaryViewKind) where T: NibReusable {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        register(nib, forSupplementaryViewOfKind: forSupplementaryViewKind.rawValue, withReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind elementKind: SupplementaryViewKind, for indexPath: IndexPath) -> T where T: Reusable {
        guard let view = dequeueReusableSupplementaryView(ofKind: elementKind.rawValue, withReuseIdentifier: T.reuseIdentifier, for: indexPath)  as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return view
    }
    
}
#endif
