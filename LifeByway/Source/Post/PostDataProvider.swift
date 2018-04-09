//
//  PostDataProvider.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 9..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import Foundation

let tempToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImtvamFuZyIsIm5pY2tuYW1lIjoi7L2U7J-B7J2064aIIiwidXNlcl9pZCI6MSwiaWF0IjoxNTIyOTMzNDk5LCJleHAiOjE1MjM1MzgyOTksImlzcyI6ImRldmlsb3BlciIsInN1YiI6InVzZXJpbmZvIn0.BOTyGtG5gWR8hsNlJhlp_56vkq64PrZ2AHf3-cSBZ5Q"

struct PostDataProvider {
    
    enum PostAPIRouter: APIRouter {
        
        case post
        
        var endPoint: EndPoint {
            switch self {
            case .post: return EndPoint(path: "/reviewlist/subject", method: .get)
            }
        }
        
        var headers: APIRouter.HTTPHeaders? {
            return ["token": tempToken]
        }
        
        var parameters: APIRouter.Parameters? {
            return nil
        }
    }
}

extension PostDataProvider {
    
    static func requestPost(completion: @escaping ((ErrorMessagePresentable?, [Mission]) -> Void)) {
        NetworkRequestor.request(PostAPIRouter.post) { statusCode, data, error in
            if error == nil, statusCode == 200 {
                do {
                    if let jsonString = data?["data"].debugDescription {
                        let jsonData = jsonString.data(using: .utf8) ?? Data()
                        let missions = try JSONDecoder().decode([Mission].self, from: jsonData)
                        completion(nil, missions)
                    }
                } catch(let error) {
                    LBLogger.debug(.common, error.localizedDescription)
                }
            }
        }
    }
}

