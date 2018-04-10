//
//  User.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 11..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import Foundation

struct User: Codable {
    var id: String
    var nickname: String
    var imgLink: String
    var level: Int
}
