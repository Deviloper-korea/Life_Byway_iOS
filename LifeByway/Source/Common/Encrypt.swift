//
//  Encrypt.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 5..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import CryptoSwift

extension String {
    func encrypt() -> String {
        let salt = "cs0604"
        let hash = self + salt
        return hash.sha256()
    }
}
