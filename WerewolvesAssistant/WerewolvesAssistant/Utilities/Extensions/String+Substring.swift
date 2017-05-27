//
//  String+Substring.swift
//  BestaMall
//
//  Created by Jun on 2017/3/2.
//  Copyright © 2017年 Juku Tech. All rights reserved.
//

import Foundation

/* use demo
let str = "Hello, playground"
print(str.jkt_substring(from: 7))         // playground
print(str.jkt_substring(to: 5))           // Hello
print(str.jkt_substring(with: 7..<11))    // play
 */

// MARK: - get substring from a string
extension String {
    private func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func jkt_substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    func jkt_substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    func jkt_substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
}
