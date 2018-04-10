//
//  HomeModel.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 9..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import Foundation

class HomeModel {
    
    static let shared = HomeModel()
    var reloadHandler: (() -> Void)?
    
    var missions: [Mission]? {
        didSet {
            reloadHandler?()
        }
    }
    
    func loadMissions() {
        
        HomeDataProvider.requestMissions(date: Date().normalFormat) { [weak self] error, missions in
            if error == nil {
                self?.clearMissions()
                self?.missions = missions
            }
        }
 
//        missions = mokMissions
    }
    
    func clearMissions() {
        missions?.removeAll()
    }
}
