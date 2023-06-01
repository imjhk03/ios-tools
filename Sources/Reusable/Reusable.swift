//
//  Reusable.swift
//
//
//  Created by Joohee Kim on 2023/06/01.
//

#if os(iOS)
import UIKit

public protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension Reusable where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

public protocol NibReusable: Reusable, NibLoadable { }
#endif
