//
//  UIColor+ColorName.swift
//  ZemogaTest
//
//  Created by Juan Fernando Alvarez Carvajal on 8/05/22.
//

import UIKit

extension UIColor {
    enum ColorName: String {
        case black = "Black"
        case gray300 = "Gray300"
    }
    
    convenience init?(_ colorName: ColorName) {
        self.init(named: colorName.rawValue)
    }
}
