//
//  OverviewViewController.swift
//  LifeByway
//
//  Created by yunyoung on 2018. 3. 27..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import UIKit

class PostViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let postModel = PostModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postModel.reloadHandler = reloadPost
        postModel.loadPost()
    }
    
    func reloadPost() {
        collectionView.reloadData()
    }
}

