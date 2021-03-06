//
//  JoinModel.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 5..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import UIKit

struct JoinInfo {
    var id: String
    var profileImage: Data
    var nickname: String
    var password: String
    var passwordCheck: String
    var email: String
}

class JoinModel {
    
    static let shared = JoinModel()
    
    func validate(joinInfo: JoinInfo) -> ErrorMessagePresentable? {
        
        guard Regex.id(joinInfo.id).validate() else {
            return JoinError.UserId.regex
        }
        
        guard joinInfo.id.count >= 6 && joinInfo.id.count <= 15 else {
            return JoinError.UserId.length
        }
        
        guard joinInfo.nickname.isNotEmpty else {
            return JoinError.Nickname.length
        }
        
        guard Regex.email(joinInfo.email).validate() else {
            return JoinError.Email.regex
        }
        
        guard joinInfo.password == joinInfo.passwordCheck else {
            return JoinError.Password.notEqualPasswordCheck
        }
        
        guard joinInfo.password.count >= 8 && joinInfo.password.count <= 16 else {
            return JoinError.Password.length
        }
        
        return nil
    }
}
