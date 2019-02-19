//
//  NSDate+category.swift
//  RQJJ
//
//  Created by XFGuo on 2018/8/1.
//  Copyright © 2018年 China Electronic Intelligence System Technology Co., Ltd. All rights reserved.
//

import Foundation

extension NSDate {
    class func dateWithStringAndformat(time: String, dateFotmat: String) -> NSDate {
        if time == "" {
            return NSDate()
        }

        let formatter = DateFormatter()
        // 转换时间格式
        formatter.dateFormat = dateFotmat
        formatter.locale = NSLocale(localeIdentifier: "en") as Locale?
        // 转换字符串,转换好的时间去除时区的时间
        let creatDate = formatter.date(from: time)!
        return creatDate as NSDate
    }

    class func stringWithDateAndformat(date: NSDate, dateFotmat: String) -> String {
        let formatter = DateFormatter()
        // 转换时间格式
        formatter.dateFormat = dateFotmat
        formatter.locale = NSLocale(localeIdentifier: "en") as Locale?
        // 转换字符串,转换好的时间去除时区的时间
        let creatDate = formatter.string(from: date as Date)
        return creatDate as String
    }

    class func dateWithStr(time: String) -> NSDate {
        if time == "" {
            return NSDate()
        }

        let formatter = DateFormatter()
        // 转换时间格式
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.locale = NSLocale(localeIdentifier: "en") as Locale?
        // 转换字符串,转换好的时间去除时区的时间
        let creatDate = formatter.date(from: time)!
        return creatDate as NSDate
    }

    var descDateTotalOnly: String? {
        var formatterStr = "yyyy-MM-dd"

        // 创建formatter
        let formatter = DateFormatter()
        // 设置时间的格式
        formatter.dateFormat = formatterStr
        // 设置时间的区域(真机必须设置,否则可能不能转换成功)
        formatter.locale = Locale(identifier: "en")

        return formatter.string(from: self as Date)
    }

    var descDateTodayAndOthers: String? {
        let calendear = Calendar.current
        // 判断是否是今天
        var formatterStr = ""
        if calendear.isDateInToday(self as Date) {
            formatterStr = "HH:mm:ss"

        } else {
            formatterStr = "yyyy-MM-dd"
        }

        // 创建formatter
        let formatter = DateFormatter()
        // 设置时间的格式
        formatter.dateFormat = formatterStr
        // 设置时间的区域(真机必须设置,否则可能不能转换成功)
        formatter.locale = Locale(identifier: "en")

        return formatter.string(from: self as Date)
    }

    var descDate: String? {
        let calendear = Calendar.current
        // 判断是否是今天
        if calendear.isDateInToday(self as Date) {
            let since = Int(NSDate().timeIntervalSince(self as Date))
            // 1.1是否是刚刚
            if since < 60 {
                return "刚刚"
            }
            // 1.2多少分钟以前
            if since < 60 * 60 {
                return "\(since / 60)分钟前"
            }
            // 1.3多少小时以前
            return "\(since / (60 * 60))小时前"
        }

        // 2.判断是否是昨天
        var formatterStr = "HH:mm"
        if calendear.isDateInYesterday(self as Date) {
            formatterStr = "昨天: " + formatterStr

        } else {
            // 处理一年以内
            formatterStr = "MM-dd " + formatterStr

            // 处理更早时间
            let comps = calendear.dateComponents([.year, .month, .day], from: self as Date, to: Date())
            print(comps)

            // 按照指定的格式时间转换为字符串
            if comps.year! >= 1 {
                formatterStr = "yyyy-" + formatterStr
            }
        }

        // 创建formatter
        let formatter = DateFormatter()
        // 设置时间的格式
        formatter.dateFormat = formatterStr
        // 设置时间的区域(真机必须设置,否则可能不能转换成功)
        formatter.locale = Locale(identifier: "en")

        return formatter.string(from: self as Date)
    }
}
