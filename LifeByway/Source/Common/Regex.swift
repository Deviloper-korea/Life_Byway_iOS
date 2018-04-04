//
//  Regex.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 5..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import Foundation

enum Regex {
    
    case email(String)
    
    func validate() -> Bool {
        switch self {
        case .email(let address):
            guard !address.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
                return false
            }
            let regexOfEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            return NSPredicate(format: "SELF MATCHES %@", regexOfEmail).evaluate(with: address)
        }
    }
}

