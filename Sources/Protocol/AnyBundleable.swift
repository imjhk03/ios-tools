//
//  AnyBundleable.swift
//  
//
//  Created by Joohee Kim on 21. 08. 05..
//

#if os(iOS)
import UIKit

public protocol AnyBundleable {

    static var bundle: Bundle { get }

    var bundle: Bundle { get }

}

public extension AnyBundleable where Self: NSObject {

    static var bundle: Bundle {
        return Bundle(for: self)
    }

    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }

}

extension NSObject: AnyBundleable {}
#endif
