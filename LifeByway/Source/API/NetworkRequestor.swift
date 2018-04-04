//
//  NetworkRequestor.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 4..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import Alamofire

struct NetworkRequestor {
    
    private static let manager = Alamofire.SessionManager.default
    
    typealias Completion = ((Data?, Error?) -> Void)?
    static func request(_ api: APIRouter, completion: Completion) {
        manager.session.configuration.timeoutIntervalForRequest = 15
        manager.request(api.requestUrl, method: api.endPoint.method, parameters: api.parameters, headers: api.headers)
        .validate()
        .responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    completion?(data, nil)
                }
            case .failure(let error):
                completion?(nil, error)
            }
        }
    }
}
