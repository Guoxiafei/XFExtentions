//
//  UIImage+Extention.swift
//  RQJJ
//
//  Created by Red App on 2018/7/11.
//  Copyright © 2018年 China Electronic Intelligence System Technology Co., Ltd. All rights reserved.
//

import Foundation

extension UIImage {
    // 修复图片旋转
    open func fixOrientation() -> UIImage {
        if imageOrientation == .up {
            return self
        }

        var transform = CGAffineTransform.identity

        switch imageOrientation {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: size.height)
            transform = transform.rotated(by: .pi)

        case .left, .leftMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.rotated(by: .pi / 2)

        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: size.height)
            transform = transform.rotated(by: -.pi / 2)

        default:
            break
        }

        switch imageOrientation {
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)

        case .leftMirrored, .rightMirrored:
            transform = transform.translatedBy(x: size.height, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)

        default:
            break
        }

        let ctx = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: cgImage!.bitsPerComponent, bytesPerRow: 0, space: cgImage!.colorSpace!, bitmapInfo: cgImage!.bitmapInfo.rawValue)
        ctx?.concatenate(transform)

        switch imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            ctx?.draw(cgImage!, in: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(size.height), height: CGFloat(size.width)))

        default:
            ctx?.draw(cgImage!, in: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(size.width), height: CGFloat(size.height)))
        }

        let cgimg: CGImage = (ctx?.makeImage())!
        let img = UIImage(cgImage: cgimg)

        return img
    }

    class func getImageWith(_ color: UIColor?, andHeight height: CGFloat) -> UIImage? {
        let r = CGRect(x: 0.0, y: 0.0, width: 1.0, height: height)
        UIGraphicsBeginImageContext(r.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor((color?.cgColor)!)
        context?.fill(r)
        let img: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return img
    }
}
