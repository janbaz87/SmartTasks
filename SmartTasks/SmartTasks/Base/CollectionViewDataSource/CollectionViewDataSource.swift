//
//  CollectionViewDataSource.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 09/06/2024.
//

import UIKit

protocol ActionableListView: AnyObject {
    func didPerformAction(indexPath: IndexPath)
}

class CollectionViewDataSource: NSObject {

    // MARK: Init
    init(
        collectionView: UICollectionView,
        actionDelegate: ActionableListView? = nil
    ) {
        self.collectionView = collectionView
        self.actionDelegate = actionDelegate

        super.init()
    }

    // MARK: Internal
    let collectionView: UICollectionView
    weak var actionDelegate: ActionableListView?

}

// MARK: UICollectionViewDelegate
extension CollectionViewDataSource: UICollectionViewDelegate {
    // Action
    func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        actionDelegate?.didPerformAction(indexPath: indexPath)
    }
}
