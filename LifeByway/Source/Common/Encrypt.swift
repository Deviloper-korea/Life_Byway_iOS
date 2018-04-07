//
//  Encrypt.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 5..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import CryptoSwift

typealias Json = [String: Any]
extension String {
    func encrypt() -> String? {
        if let path = Bundle.main.path(forResource: "Key", ofType: "json") {
            guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
                return nil
            }
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) else {
                return nil
            }
            guard let json = jsonObject as? Json, let salt = json["salt"] as? String else {
                return nil
            }
            let hash = self + salt
            return hash.sha256()
        }
        return nil
    }
}
