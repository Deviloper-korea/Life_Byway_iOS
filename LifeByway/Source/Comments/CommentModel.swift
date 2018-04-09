//
//  CommentModel.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 9..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import Foundation

struct Comment {
    
    var nickname: String
    var imgLink: String
    var level: String
    var comment: String
    var date: String
}

class CommentModel {

    static let shared = CommentModel()
    var reloadHandler: (() -> Void)?
    
    var comments: [Comment]? {
        didSet {
            reloadHandler?()
        }
    }
    
    func clearComments() {
        comments?.removeAll()
    }
}

