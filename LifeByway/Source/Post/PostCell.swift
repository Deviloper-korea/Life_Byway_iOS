//
//  PostCell.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 9..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import UIKit

class PostCell: UICollectionViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    
    var mission: Mission? {
        didSet {
            dateLabel.text = mission?.date.toDate.normalFormat
            subjectLabel.text = mission?.contents
        }
    }
}
