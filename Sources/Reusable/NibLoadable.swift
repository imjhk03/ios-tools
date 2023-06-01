//
//  NibLoadable.swift
//
//
//  Created by Joohee Kim on 2023/06/01.
//

#if os(iOS)
import UIKit

public protocol NibLoadable: AnyObject {
    static var nibName: String { get }
}

public extension NibLoadable where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
#endif
