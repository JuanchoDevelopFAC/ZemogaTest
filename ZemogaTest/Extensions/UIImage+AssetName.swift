//
//  UIImage+AssetName.swift
//  ZemogaTest
//
//  Created by Juan Fernando Alvarez Carvajal on 8/05/22.
//

import UIKit

extension UIImage {
    enum AssetName: String {
        case load = "load-icon"
        case star = "starred-icon"
    }
    
    convenience init(assetName: AssetName) {
        self.init(named: assetName.rawValue)!
    }
}
