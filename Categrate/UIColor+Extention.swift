//
//  UIColor+Extention.swift
//  12-swift分段选择
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 HEJJY. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
}
