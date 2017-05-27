//
//  Notification+Extension.swift
//  BestaMall
//
//  Created by Jun on 2017/1/11.
//  Copyright © 2017年 Juku Tech. All rights reserved.
//  仿照 Alamofire

import Foundation

extension Notification.Name {
    public struct JKTTask {
        public static let JKTDidLogined = Notification.Name(rawValue:
        "com.jukutech.notification.name.task.JKTDidLogined")
        
        public static let JKTShouldLogin = Notification.Name(rawValue:
        "com.jukutech.notification.name.task.JKTShouldLogin")
        
        public static let JKTDidLogout = Notification.Name(rawValue:
        "com.jukutech.notification.name.task.JKTDidLogout")
        public static let JKTDidSelectCartSpec = Notification.Name(rawValue:
            "com.jukutech.notification.name.task.JKTDidSelectCartSpec")
    }
}

// MARK: -
extension Notification {
    public struct JKTKey {
        public static let JKTTask = "com.jukutech.notification.key.JKTTask"
    }
}
