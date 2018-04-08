//
//  JoinError.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 6..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import Foundation

protocol ErrorMessagePresentable {
    var message: String { get }
}

enum JoinError {
    
    enum UserId: ErrorMessagePresentable {
        
        case regex
        case length
        case duplicate
        
        var message: String {
            switch self {
            case .regex: return "아이디는 영문 + 숫자 조합만 가능합니다."
            case .length: return "아이디는 6자 이상 15자 이하만 가능합니다."
            case .duplicate: return "중복된 아이디입니다."
            }
        }
    }
    
    enum Password: ErrorMessagePresentable {
        
        case notEqualPasswordCheck
        case length
        
        var message: String {
            switch self {
            case .notEqualPasswordCheck: return "비밀번호 확인이 일치하지 않습니다."
            case .length: return "비밀번호는 8자 이상 16자 이하만 가능합니다."
            }
        }
    }
    
    enum Nickname: ErrorMessagePresentable {
        
        case length
        case duplicate
        
        var message: String {
            switch self {
            case .length: return "닉네임을 입력해주세요."
            case .duplicate: return "중복된 닉네임입니다."
            }
        }
    }
    
    enum Email: ErrorMessagePresentable {
        
        case regex
        
        var message: String {
            switch self {
            case .regex: return "이메일 형식이 올바르지 않습니다."
            }
        }
    }
}
