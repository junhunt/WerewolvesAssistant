//
//  JKTEnumUtil.swift
//  BestaMall
//
//  Created by Jun on 2017/3/12.
//  Copyright © 2017年 Juku Tech. All rights reserved.
//  枚举文件

import Foundation

/// 排序类型
///
/// - synthesize: 综合
/// - sales_volume: 销量
/// - price_asc: 价格升序
/// - price_desc: 价格降序
/// - new: 新品
/// - more: 筛选（更多）
enum JKTSortType: String {
    case synthesize
    case sales_volume
    case price_asc
    case price_desc
    case new
    case filter_more
}

enum jKTCategoryType {
    case type
    case style
    case space
    case brand
    case price
    case call
    
    var name: String {
        switch self {
        case .type:
            return "类型"
        case .style:
            return "风格"
        case .space:
            return "空间"
        case .brand:
            return "品牌"
        case .price:
            return "价格"
        case .call:
            return "行业称谓"
        }
    }
}
