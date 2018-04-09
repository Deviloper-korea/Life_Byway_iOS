//
//  HomeDataProvider.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 9..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import Foundation

struct HomeDataProvider {
    
    enum HomeAPIRouter: APIRouter {
        
        case missions(date: String)
        
        var endPoint: EndPoint {
            switch self {
            case .missions: return EndPoint(path: "/home/byDate", method: .post)
            }
        }
        
        var parameters: Parameters? {
            switch self {
            case .missions(let date):
                return ["date": date]
            }
        }
    }
}

extension HomeDataProvider {
    
    static func requestMissions(date: String, completion: @escaping ((ErrorMessagePresentable?, [Mission]?) -> Void)) {
        struct StatusCode {
            static let success = 201
            static let serverError = 500
            static let nothingSubject = 501
            static let queryError = 503
        }
        NetworkRequestor.request(HomeAPIRouter.missions(date: date)) { statusCode, data, error in
            if error == nil {
                switch statusCode {
                case StatusCode.serverError, StatusCode.queryError:
                    completion(ServerError.all, nil)
                case StatusCode.nothingSubject:
                    completion(HomeError.nothingSubject, nil)
                default: break
                }
                
            }
        }
    }
}

