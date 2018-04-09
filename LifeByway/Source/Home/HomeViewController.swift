//
//  HomeViewController.swift
//  LifeByway
//
//  Created by yunyoung on 2018. 3. 27..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var commentViewHeightConstraint: NSLayoutConstraint!
    
    let homeModel = HomeModel.shared
    let notification = NotificationCenter.default
    
    var commentListViewController: CommentListViewController?
    var todayPage = 6
    var currentPage: Float = 6 {
        didSet {
            guard currentPage < 6 else { return }
            // TODO: - 페이지에 따른 글 목록 보여주기
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeModel.reloadHandler = reloadMissions
        homeModel.loadMissions()
        
        collectionView.scrollToItem(at: IndexPath(item: todayPage, section: 0), at: .centeredHorizontally, animated: false)
        collectionView.decelerationRate = UIScrollViewDecelerationRateFast
        
        commentListViewController?.cellHeight = 80
        commentListViewController?.commentModel.comments = mokComments
    }
    
    func reloadMissions() {
        collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CommentList" {
            commentListViewController = segue.destination as? CommentListViewController
        }
    }
}
