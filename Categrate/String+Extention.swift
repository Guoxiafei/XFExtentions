//
//  String+Extention.swift
//  RQJJ
//
//  Created by Red App on 2018/8/14.
//  Copyright © 2018年 China Electronic Intelligence System Technology Co., Ltd. All rights reserved.
//

import Foundation

// 下标截取任意位置的便捷方法
extension String {
    var length: Int {
        return count
    }

    subscript(i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript(r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)), upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

// 不包含后几个字符串的方法
extension String {
    func dropLast(_ n: Int = 1) -> String {
        return String(characters.dropLast(n))
    }

    var dropLast: String {
        return dropLast()
    }
}

extension String {}

extension String {
    func ranges(of string: String) -> [Range<String.Index>] {
        var rangeArray = [Range<String.Index>]()
        var searchedRange: Range<String.Index>
        guard let sr = self.range(of: self) else {
            return rangeArray
        }
        searchedRange = sr

        var resultRange = range(of: string, options: .regularExpression, range: searchedRange, locale: nil)
        while let range = resultRange {
            rangeArray.append(range)
            searchedRange = Range(uncheckedBounds: (range.upperBound, searchedRange.upperBound))
            resultRange = self.range(of: string, options: .regularExpression, range: searchedRange, locale: nil)
        }
        return rangeArray
    }

    func nsrange(fromRange range: Range<String.Index>) -> NSRange {
        return NSRange(range, in: self)
    }

    func nsranges(of string: String) -> [NSRange] {
        return ranges(of: string).map { (range) -> NSRange in
            self.nsrange(fromRange: range)
        }
    }

    func toNSRange(_ range: Range<String.Index>) -> NSRange {
        guard let from = range.lowerBound.samePosition(in: utf16), let to = range.upperBound.samePosition(in: utf16) else {
            return NSMakeRange(0, 0)
        }
        return NSMakeRange(utf16.distance(from: utf16.startIndex, to: from), utf16.distance(from: from, to: to))
    }

    func toRange(_ range: NSRange) -> Range<String.Index>? {
        guard let from16 = utf16.index(utf16.startIndex, offsetBy: range.location, limitedBy: utf16.endIndex) else { return nil }
        guard let to16 = utf16.index(from16, offsetBy: range.length, limitedBy: utf16.endIndex) else { return nil }
        guard let from = String.Index(from16, within: self) else { return nil }
        guard let to = String.Index(to16, within: self) else { return nil }
        return from ..< to
    }

    func stringToNsRange(_ string: String) -> NSRange {
        let range1: Range<String.Index> = range(of: string)!

        let nsrange1 = toNSRange(range1)

        return nsrange1
    }
}

extension NSObject {
    // MARK: 返回className

    var ClassName: String {
        let name = type(of: self).description()
        if name.contains(".") {
            return name.components(separatedBy: ".")[1]
        } else {
            return name
        }
    }
}
