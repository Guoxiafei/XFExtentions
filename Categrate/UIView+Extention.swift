//
//  UIView+Extention.swift
//  1-TableView使用
//
//  Created by apple on 2017/8/8.
//  Copyright © 2017年 HEJJY. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    var width: CGFloat {
        get {
            return frame.width
        }

        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }

    var height: CGFloat {
        get {
            return frame.height
        }

        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }

    var x: CGFloat {
        get {
            return frame.origin.x
        }

        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }

    var y: CGFloat {
        get {
            return frame.origin.y
        }

        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }

    var size: CGSize {
        get {
            return frame.size
        }

        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }

    var centerX: CGFloat {
        get {
            return center.x
        }

        set {
            var center = self.center
            center.x = newValue
            self.center = center
        }
    }

    var centerY: CGFloat {
        get {
            return center.x
        }

        set {
            var center = self.center
            center.y = newValue
            self.center = center
        }
    }
}
