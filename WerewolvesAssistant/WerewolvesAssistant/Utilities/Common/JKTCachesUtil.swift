//
//  JKTCachesUtil.swift
//  BestaMall
//
//  Created by Jun on 2017/3/7.
//  Copyright © 2017年 Juku Tech. All rights reserved.
//  清除缓存工具类

import UIKit

class JKTCachesUtil: NSObject {
    
    /// 获取缓存，单位：Byte
    ///
    /// - Returns: 缓存数
    static func cacheSizeBytes() -> Double {
        let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
        
        guard FileManager.default.fileExists(atPath: cachePath!) else {
            return 0
        }
        
        var total: Double = 0
        let pathArray = FileManager.default.subpaths(atPath: cachePath!)
        for path in pathArray! {
            let childPath = cachePath! + "/" + path
            do {
                let attr = try FileManager.default.attributesOfItem(atPath: childPath)
                let fileSize = attr[FileAttributeKey.size] as! Double
                total += fileSize
            } catch let error {
                DLog(error)
            }
        }
        
        return total
    }
    
    /// 获取缓存，单位：M
    ///
    /// - Returns: 缓存数
    static func cacheSizeMegaBytes() -> Double {
        return JKTCachesUtil.cacheSizeBytes() / 1024 / 1024
    }
    
    // 清除缓存
    static func clearCache(completion: @escaping(_ isSuccess: Bool) -> ()) {
        let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
        
        guard FileManager.default.fileExists(atPath: cachePath!) else {
            completion(true)
            return
        }
        
        let pathArray = FileManager.default.subpaths(atPath: cachePath!)
        for path in pathArray! {
            let childPath = cachePath! + "/" + path
            do {
                try FileManager.default.removeItem(atPath: childPath)
            } catch let error {
                DLog(error)
                completion(false)
            }
        }
        
        completion(true)
    }
}
