//
//  MissionCell.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 9..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import UIKit

var temporaryBackgroundImage = [#imageLiteral(resourceName: "temp5_min"), #imageLiteral(resourceName: "temp2_min"), #imageLiteral(resourceName: "temp1_min"), #imageLiteral(resourceName: "temp3_min"), #imageLiteral(resourceName: "temp6_min"), #imageLiteral(resourceName: "temp4_min"), #imageLiteral(resourceName: "temp7_min")]
class MissionCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var missionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var mission: Mission? {
        didSet {
            missionLabel.text = mission?.contents
            dateLabel.text = mission?.date
        }
    }
}
