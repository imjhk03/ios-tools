//
//  UITableView+Reusable.swift
//
//
//  Created by Joohee Kim on 2023/06/01.
//

#if os(iOS)
import UIKit

public extension UITableView {
    
    func registerCell<T: UITableViewCell>(_: T.Type) where T: Reusable {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerCell<T: UITableViewCell>(_: T.Type) where T: NibReusable {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerCells<T: UITableViewCell>(_ cellTypes: [T.Type]) where T: Reusable {
        for cellType in cellTypes {
            registerCell(cellType.self)
        }
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }

        return cell
    }
}
#endif
