//
//  Color+Extention.swift
//  RQJJ
//
//  Created by Red App on 2017/10/20.
//  Copyright © 2017年 Dc.lee. All rights reserved.
//

import Foundation

extension UIColor {
    convenience init(hexString: String) {
        // 处理数值
        var cString = hexString.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        let length = (cString as NSString).length
        // 错误处理
        if length < 6 || length > 7 || (!cString.hasPrefix("#") && length == 7) {
            // 返回whiteColor
            self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            return
        }

        if cString.hasPrefix("#") {
            cString = (cString as NSString).substring(from: 1)
        }

        // 字符chuan截取
        var range = NSRange()
        range.location = 0
        range.length = 2

        let rString = (cString as NSString).substring(with: range)

        range.location = 2
        let gString = (cString as NSString).substring(with: range)

        range.location = 4
        let bString = (cString as NSString).substring(with: range)

        // 存储转换后的数值
        var r: UInt32 = 0, g: UInt32 = 0, b: UInt32 = 0
        // 进行转换
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        // 根据颜色值创建UIColor
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1.0)
    }

    @objc class func hexColor(hexString: String) -> UIColor {
        // 处理数值
        var cString = hexString.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        let length = (cString as NSString).length
        // 错误处理
        if length < 6 || length > 7 || (!cString.hasPrefix("#") && length == 7) {
            // 返回whiteColor
            return UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        }

        if cString.hasPrefix("#") {
            cString = (cString as NSString).substring(from: 1)
        }

        // 字符chuan截取
        var range = NSRange()
        range.location = 0
        range.length = 2

        let rString = (cString as NSString).substring(with: range)

        range.location = 2
        let gString = (cString as NSString).substring(with: range)

        range.location = 4
        let bString = (cString as NSString).substring(with: range)

        // 存储转换后的数值
        var r: UInt32 = 0, g: UInt32 = 0, b: UInt32 = 0
        // 进行转换
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        // 根据颜色值创建UIColor
//        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1.0)
    }

    // 返回随机颜色
    class var randomColor: UIColor {
        let red = CGFloat(arc4random() % 256) / 255.0
        let green = CGFloat(arc4random() % 256) / 255.0
        let blue = CGFloat(arc4random() % 256) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
