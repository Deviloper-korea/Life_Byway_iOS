//
//  CommentCell.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 9..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import UIKit

class CommentCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    var comment: Comment? {
        didSet {
            // TODO: - 킹피셔 사용해서 프로필 이미지 넣기
            nicknameLabel.text = comment?.nickname
            dateLabel.text = comment?.date
            commentLabel.text = comment?.comment
        }
    }
}
