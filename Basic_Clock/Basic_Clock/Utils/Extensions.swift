//
//  Extensions.swift
//  Basic_Clock
//
//  Created by sejin on 2022/07/01.
//

import UIKit

extension UISwitch {
    func setColor(offTint color: UIColor ) {
        let minSide = min(bounds.size.height, bounds.size.width)
        layer.cornerRadius = minSide / 2
        backgroundColor = color
        tintColor = color
    }
}
