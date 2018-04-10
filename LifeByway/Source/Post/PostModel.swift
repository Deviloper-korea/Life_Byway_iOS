//
//  PostModel.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 9..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import Foundation

class PostModel {
    
    static let shared = PostModel()
    var reloadHandler: (() -> Void)?
    
    var missions: [Mission]? {
        didSet {
            reloadHandler?()
        }
    }
    
    func loadPost() {
        PostDataProvider.requestPost { [weak self] error, missions in
            if error == nil {
                self?.missions = missions
            }
        }
    }
}
