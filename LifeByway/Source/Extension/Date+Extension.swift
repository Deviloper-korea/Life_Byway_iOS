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
    
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
}

extension DateFormatter {
    
    var calendarFormatter: DateFormatter {
        dateFormat = "yyyy-MM-dd"
        locale = Calendar.current.locale
        timeZone = Calendar.current.timeZone
        return self
    }
}
