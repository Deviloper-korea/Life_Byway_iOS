//
//  JoinAPIRouter.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 6..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import Foundation

struct JoinDataProvider {
    
    enum JoinAPIRouter: APIRouter {
        
        case join(joinInfo: JoinInfo)
        
        var endPoint: EndPoint {
            switch self {
            case .join: return EndPoint(path: "/login/signup", method: .post)
            }
        }
        
        var headers: HTTPHeaders? {
            switch self {
            case .join(let joinInfo):
                guard let encryptedPassword = joinInfo.password.encrypt() else {
                    return nil
                }
                return ["id": joinInfo.id,
                        "password": encryptedPassword]
            }
        }
        
        var parameters: Parameters? {
            switch self {
            case .join(let joinInfo):
                return ["nickname": joinInfo.nickname,
                        "imgLink": joinInfo.profileImage,
                        "email": joinInfo.email]
            }
        }
    }
}

extension JoinDataProvider {
    
    static func requestJoin(joinInfo: JoinInfo, completion: @escaping ((ErrorMessagePresentable?) -> Void)) {
        struct StatusCode {
            static let success = 201
            static let serverError = 500
            static let duplicatedId = 501
            static let duplicatedNickname = 502
            static let queryError = 503
        }
        NetworkRequestor.requestUpload(JoinAPIRouter.join(joinInfo: joinInfo)) { statusCode, data, error in
            if let statusCode = statusCode, error == nil {
                var errorMessage: ErrorMessagePresentable?
                switch statusCode {
                case StatusCode.success:
                    errorMessage = nil
                case StatusCode.serverError, StatusCode.queryError:
                    errorMessage = ServerError.all
                case StatusCode.duplicatedId:
                    errorMessage = JoinError.UserId.duplicate
                case StatusCode.duplicatedNickname:
                    errorMessage = JoinError.Nickname.duplicate
                default: break
                }
                completion(errorMessage)
            }
        }
    }
}
