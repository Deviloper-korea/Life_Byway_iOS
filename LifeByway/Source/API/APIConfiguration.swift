//
//  APIConfiguration.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 2..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import Foundation

enum ServerEnvironment {
    case dev
    case real
    
    var domain: String {
        switch self {
        case .dev: return "http://13.125.236.45"
        case .real: return ""
        }
    }
}

struct APIConfiguration {
    static let serverEnvironment: ServerEnvironment = .dev
}
