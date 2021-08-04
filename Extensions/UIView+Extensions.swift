//
//  UIView+Extensions.swift
//
//
//  Created by Joohee Kim on 21. 04. 07..
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
    
}
