//
//  Date+Extension.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 9..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import Foundation

extension Date {
    
    var normalFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}
