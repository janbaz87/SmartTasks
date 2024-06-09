//
//  TasksListDataSource.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 09/06/2024.
//

import UIKit

enum TasksListLayoutKind: Hashable {
    case taskSection
}

final class TasksListDataSource: CollectionViewDataSource {

    // MARK: Init
    override init(
        collectionView: UICollectionView,
        actionDelegate: ActionableListView? = nil
    ) {
        super.init(collectionView: collectionView, actionDelegate: actionDelegate)
    }

    // MARK: Internal
    typealias Snapshot = NSDiffableDataSourceSnapshot<TasksListLayoutKind, SmartTask>
    typealias DataSource = UICollectionViewDiffableDataSource<TasksListLayoutKind, SmartTask>

    lazy var dataSource: DataSource = {
        let dataSource = DataSource(collectionView: collectionView) { [weak self] collectionView, indexPath, itemIdentifier in
            self?.cell(collectionView: collectionView, indexPath: indexPath, task: itemIdentifier)
        }
        return dataSource
    }()

    var tasks: [SmartTask] = [] {
        didSet {
            applySnapshot()
        }
    }

    func getItem(at indexPath: IndexPath) -> SmartTask? {
        dataSource.itemIdentifier(for: indexPath)
    }

    // MARK: Private

    private func cell(
        collectionView: UICollectionView,
        indexPath: IndexPath,
        task: SmartTask
    ) -> UICollectionViewCell? {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TaskCollecCollectionViewCell.reuseIdentifier,
            for: indexPath
        )
        bind(for: cell, with: task)
        return cell
    }

    private func applySnapshot(animatingDifferences: Bool = false) {
        var snapshot = Snapshot()
        snapshot.appendSections([.taskSection])
        snapshot.appendItems(tasks, toSection: .taskSection)
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }

    private func bind(for cell: UICollectionViewCell, with item: SmartTask) {
        if let cell = cell as? TaskCollecCollectionViewCell {
            cell.configure(with: item)
        }
    }
}
