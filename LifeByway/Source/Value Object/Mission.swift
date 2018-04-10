//
//  Mission.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 9..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import Foundation

struct Mission: Codable {
    var id: Int
    var contents: String
    var date: String
}

extension Mission {
    
    enum CodingKeys: String, CodingKey {
        case id = "subject_id"
        case contents = "contents"
        case date = "date"
    }
}
