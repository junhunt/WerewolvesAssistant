//
//  YWWeiBoCommon.swift
//  WeiBo
//
//  Created by 姚巍 on 16/9/16.
//  Copyright © 2016年 yao wei. All rights reserved.
//

import Foundation
import UIKit

// 手机系统版本号 e.g. 8.4.1
let JKTAPP_SYSTEM_VERSION = UIDevice.current.systemVersion
// APP build e.g. 1
let JKTAPP_BUILD = Bundle.main.infoDictionary?["CFBundleVersion"]
// APP version e.g. 1.01
let JKTAPP_VERSION = Bundle.main.infoDictionary?["CFBundleShortVersionString"]

//MARK: - color
let JKTMainColor = colorFromHex(rgbValue: 0x672d18)
let JKTBaseColor = colorFromHex(rgbValue: 0xeeeeee)//UIColor.groupTableViewBackground

//MARK: - font
let JKTNavCenterFont = UIFont.boldSystemFont(ofSize: 20)
let JKTNavSideFont = UIFont.systemFont(ofSize: 16)

//MARK: - 长度相关
let JKTMargin: CGFloat = 12.0

//MARK: - 全局通知定义

// 调用： color = colorFromHex(rgbValue: 0xffff00)
func colorFromHex(rgbValue: UInt32) -> UIColor {
    let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
    let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
    let blue = CGFloat(rgbValue & 0xFF)/256.0
    
    return UIColor(red:red, green:green, blue:blue, alpha:1.0)
}

func jkt_screenWidth() -> CGFloat {
    return UIScreen.main.bounds.width
}

func jkt_screenHeight() -> CGFloat {
    return UIScreen.main.bounds.height
}

func jkt_screenScale() -> CGFloat {
    return UIScreen.main.scale
}
