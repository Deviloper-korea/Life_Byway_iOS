//
//  APIRouter.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 4..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import Alamofire

protocol APIRouter {
    var endPoint: EndPoint { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
}

extension APIRouter {
    
    var requestUrl: String {
        return APIConfiguration.serverEnvironment.domain + endPoint.path
    }
}
