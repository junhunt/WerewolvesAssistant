//
//  STIRole.swift
//  WerewolvesAssistant
//
//  Created by Jun on 2017/5/27.
//  Copyright © 2017年 Jun. All rights reserved.
//  角色模型

import Foundation

enum STIRole {
    case townsfolk
    case werewolf
    case seer
    case witch
    case hunter
    case idiot
    case defender
    case cupid
    case elder
    case thief
    case littleGirl
    
    var name: String {
        switch self {
        case .townsfolk:
            return "普通村民"
        case .werewolf:
            return "狼人"
        case .seer:
            return "预言家"
        case .witch:
            return "女巫"
        case .hunter:
            return "猎人"
        case .idiot:
            return "白痴"
        case . defender:
            return "守卫"
        case .elder:
            return "长老"
        case .cupid:
            return "丘比特"
        case .thief:
            return "盗贼"
        case .littleGirl:
            return "小女孩"
        }
    }
}
