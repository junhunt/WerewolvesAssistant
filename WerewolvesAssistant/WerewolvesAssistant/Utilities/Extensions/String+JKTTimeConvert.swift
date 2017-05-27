//
//  String+JKTTimeConvert.swift
//  BestaMall
//
//  Created by Jun on 2017/3/3.
//  Copyright © 2017年 Juku Tech. All rights reserved.
//

import Foundation

extension String {
    
    /// 时间戳转时间
    ///
    /// - Parameter timeStamp: 时间戳
    /// - Parameter formatter: 格式化样式，如："yyyy-MM-dd HH:mm:ss"
    /// - Returns: 时间字符串
    static func jkt_timeStampToString(timeStamp: String, formatter: String? = "yyyy-MM-dd HH:mm") -> String {
        
        let timeStampInterval: TimeInterval = TimeInterval(timeStamp) ?? 0
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        
        let date = Date(timeIntervalSince1970: timeStampInterval)
        
        return dateFormatter.string(from: date)
    }
}
