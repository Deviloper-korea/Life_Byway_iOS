//
//  PostViewController+UICollectionViewDelegate.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 9..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import UIKit

// UICollectionViewDelegateFlowLayout
extension PostViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}

// UICollectionViewDelegate
extension PostViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: - 선택시 미션에 대한 후기 리스트로 이동
    }
}

// UICollectionViewDataSource
extension PostViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postModel.missions?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MissionCell
        cell.mission = postModel.missions?[indexPath.item]
        return cell
    }
}
