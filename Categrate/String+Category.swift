//
//  String+Category.swift
//  ybweibo
//
//  Created by liyanbin on 16/5/28.
//  Copyright © 2016年 ITコンサルティング部iOS開発課. All rights reserved.
//

import UIKit

extension String {
    func cacheDir() -> String {
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as NSString
        return path.appendingPathComponent((self as NSString).lastPathComponent)
    }

    func docDir() -> String {
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as NSString
        return path.appendingPathComponent((self as NSString).lastPathComponent)
    }

    func tmpDir() -> String {
        let path = NSTemporaryDirectory() as NSString
        return path.appendingPathComponent((self as NSString).lastPathComponent)
    }
}
