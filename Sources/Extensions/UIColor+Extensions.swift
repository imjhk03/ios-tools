//
//  UIColor+Extensions.swift
//  
//
//  Created by Joohee Kim on 21. 09. 12..
//

#if os(iOS)
import UIKit

public extension UIColor {
    static func rgba(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha/1)
    }
}
#endif
