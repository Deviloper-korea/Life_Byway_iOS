//
//  HomeError.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 9..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import Foundation

enum HomeError: ErrorMessagePresentable {
    
    case nothingSubject
    
    var message: String {
        return "해당 날짜에 주제가 없습니다."
    }
}
