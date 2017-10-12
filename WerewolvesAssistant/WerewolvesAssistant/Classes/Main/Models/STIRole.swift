//
//  STIRole.swift
//  WerewolvesAssistant
//
//  Created by Jun on 2017/5/27.
//  Copyright © 2017年 Jun. All rights reserved.
//  角色模型

import Foundation

struct STITownsfolk: STIRoleProtocol {
    var name: String = "普通村民"
    var avatar: String = "townsfolk"
}

struct STIWerewolf: STIRoleProtocol {
    var name: String = "狼人"
    var avatar: String = "werewolf"
}

struct STISeer: STIRoleProtocol {
    var name: String = "预言家"
    var avatar: String = "seer"
}

struct STIWitch: STIRoleProtocol {
    var name: String = "女巫"
    var avatar: String = "witch"
}

struct STIHunter: STIRoleProtocol {
    var name: String = "猎人"
    var avatar: String = "hunter"
}

struct STIIdiot: STIRoleProtocol {
    var name: String = "白痴"
    var avatar: String = "idiot"
}

struct  STIDefender: STIRoleProtocol {
    var name: String = "守卫"
    var avatar: String = "defender"
}

struct STICupid: STIRoleProtocol {
    var name: String = "丘比特"
    var avatar: String = "cupid"
}

struct  STIElder: STIRoleProtocol {
    var name: String = "长老"
    var avatar: String = "elder"
}

struct STIThief: STIRoleProtocol {
    var name: String = "盗贼"
    var avatar: String = "thief"
}

struct  STILittleGirl: STIRoleProtocol {
    var name: String = "小女孩"
    var avatar: String = "little_girl"
}

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
