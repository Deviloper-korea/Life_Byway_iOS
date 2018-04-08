//
//  SNSAuthorizationManager.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 8..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import Foundation

enum SNSType {
    case kakao
    case facebook
}

class SNSAuthorizationManager {
    
    static let shared = SNSAuthorizationManager()
    
    func auth(with sns: SNSType) {
        switch sns {
        case .kakao:
            requestKakaoAuth()
        case .facebook:
            requestFacebookAuth()
        }
    }
}

private extension SNSAuthorizationManager {
    
    func requestKakaoAuth() {
        // TODO: - Kakao Framework
    }
    
    func requestFacebookAuth() {
        // TODO: - Facebook Framework
    }
}
