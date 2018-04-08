//
//  LBLogger.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 6..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import Foundation

enum LBDeveloper: String {
    case yunyoung
    case minseob
    case taehyun
    case common
}

struct LBLogger {
    
    static func debug(_ developer: LBDeveloper, _ message: String? = nil, _ object: Any? = nil) {
        #if DEBUG
        print("#####################")
        print("[\(developer.rawValue)] \(message ?? "[no message]")")
        dump(object)
        print("#####################")
        #endif
    }
}


