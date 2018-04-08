//
//  EndPoint.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 4..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import Alamofire

struct EndPoint {
    
    var path: String
    var method: HTTPMethod
    
    init(path: String = "", method: HTTPMethod = .get) {
        self.path = path
        self.method = method
    }
}
