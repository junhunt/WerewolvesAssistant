//
//  Bundle+Extension.swift
//  WeiBo
//
//  Created by yao wei on 16/9/9.
//  Copyright © 2016年 yao wei. All rights reserved.
//

import Foundation

extension Bundle {

    //计算性属性 类似于函数 没有参数 有返回值
    var nameSpace : String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}

/**
 2. 设置 view 的 class 为 JKTCustomView
 3. 实现拓展如下
 4. 调用 
    let myView = Bundle.loadView(fromNib: "JKTCustomView", withType: JKTCustomView.self)
    myView = CGRect(x: 0, y: maxY, width: UIScreen.yw_screenWidth(), height: 87)
 */
extension Bundle {
    static func loadView<T>(fromNib name: String, withType type: T.Type) -> T {
        if let view = Bundle.main.loadNibNamed(name, owner: nil, options: nil)?.first as? T {
            return view
        }
        
        fatalError("Could not load view with type " + String(describing: type))
    }
}
