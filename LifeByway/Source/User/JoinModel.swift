//
//  JoinModel.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 5..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import Foundation

struct JoinInfo {
    var id: String
    var nickname: String
    var password: String
    var passwordCheck: String
    var email: String
}

class JoinModel {
    
    static let shared = JoinModel()
    
    func validate(joinInfo: JoinInfo) -> ErrorMessagePresentable? {
        
        guard joinInfo.id.count >= 6 && joinInfo.id.count <= 15 else {
            return JoinError.UserId.length
        }
        
        guard joinInfo.password == joinInfo.passwordCheck else {
            return JoinError.Password.notEqualPasswordCheck
        }
        
        guard joinInfo.password.count >= 8 && joinInfo.password.count <= 16 else {
            return JoinError.Password.length
        }
        
        guard joinInfo.nickname.isNotEmpty else {
            return JoinError.Nickname.length
        }
        
        guard Regex.email(joinInfo.email).validate() else {
            return JoinError.Email.regex
        }
        
        return nil
    }
}
