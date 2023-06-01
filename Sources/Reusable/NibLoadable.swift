//
//  NibLoadable.swift
//
//
//  Created by Joohee Kim on 2023/06/01.
//

#if os(iOS)
import UIKit

protocol NibLoadable: AnyObject {
    static var nibName: String { get }
}

extension NibLoadable where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
#endif
