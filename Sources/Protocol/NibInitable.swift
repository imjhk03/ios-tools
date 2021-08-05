//
//  NibInitable.swift
//  
//
//  Created by Joohee Kim on 21. 08. 05..
//

#if os(iOS)
import UIKit

public protocol NibInitable {
    static func initFromNib() -> Self?
}

public extension NibInitable where Self: UIView {
    static func initFromNib() -> Self? {
        let xibName = String(describing: self)
        guard bundle.path(forResource: xibName, ofType: "nib") != nil else { return nil }
        return bundle.loadNibNamed(xibName, owner: nil, options: nil)?.first as? Self
    }
}

public extension NibInitable where Self: UIViewController {
    static func initFromNib() -> Self? {
        let xibName = String(describing: self)
        return ((Self)(nibName: xibName, bundle: bundle))
    }
}

extension UIView: NibInitable {}
extension UIViewController: NibInitable {}
#endif
