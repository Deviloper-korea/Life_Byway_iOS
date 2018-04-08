//
//  CommonError.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 8..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import Foundation

enum ServerError: ErrorMessagePresentable {
    
    case all
    
    var message: String {
        switch self {
        case .all: return "서버에러 입니다. 잠시 후 다시 시도해주세요."
        }
    }
}
