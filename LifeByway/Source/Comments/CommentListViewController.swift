//
//  CommentList.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 9..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import UIKit

class CommentListViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let commentModel = CommentModel.shared
    var cellHeight: CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentModel.reloadHandler = reloadComments
    }
    
    func reloadComments() {
        collectionView.reloadData()
    }
}
