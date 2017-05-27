//
//  UInt32+JKTRandom.swift
//  BestaMall
//
//  Created by Jun on 2017/5/18.
//  Copyright © 2017年 Juku Tech. All rights reserved.
//

import Foundation

extension UInt32 {
    /// 生成随机数
    /// e.g. 生成 [0, 5) 的随机数：UInt32.randomInRange(range: 1..<5)
    /// - Parameter range: 随时范围，前闭后开
    /// - Returns: 32 位整形数
    static func randomInRange(range: Range<UInt32>) -> UInt32 {
        let count = UInt32(range.upperBound - range.lowerBound)
        return arc4random_uniform(count) + UInt32(range.lowerBound)
    }
}
