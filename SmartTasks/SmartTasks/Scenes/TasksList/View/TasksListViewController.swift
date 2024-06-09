//
//  TasksListViewController.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 07/06/2024.
//

import UIKit
import Networking

protocol TasksListView: AnyObject {
    func setTasksListData(tasks: [SmartTask])
    func showEmptyView()
}

final class TasksListViewController: UIViewController, TasksListView {

    // MARK: - Views
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Views
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout()
        )
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    private lazy var emptyView: EmptyView = {
        let view = EmptyView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: -  Init
    init(presenter: TasksListPresentation) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        setupUI()
        configureConstraints()
        registerCells()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifcyle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appBackground
        presenter.viewDidLoad()
    }

    // MARK: - Internal
    let presenter: TasksListPresentation

    func setTasksListData(tasks: [SmartTask]) {
        emptyView.removeFromSuperview()
        collectionViewDataSource.tasks = tasks
    }

    func showEmptyView() {
        view.addSubview(emptyView)
        NSLayoutConstraint.activate([
            emptyView.topAnchor.constraint(equalTo: view.topAnchor),
            emptyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emptyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emptyView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // MARK: - Private
     lazy var collectionViewDataSource = TasksListDataSource(
        collectionView: collectionView,
        actionDelegate: self
    )

}

// MARK: - Setup
private extension TasksListViewController {
    func setupUI() {
        title = Constants.Text.title
        configureCollectionView()
        view.addSubview(collectionView)
    }

    func configureConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func configureCollectionView() {
        let layout = UICollectionViewCompositionalLayout.listLayout(backgroundColor: .clear)
        collectionView.collectionViewLayout = layout

        collectionView.dataSource = collectionViewDataSource.dataSource
        collectionView.delegate = collectionViewDataSource
    }
}

private extension TasksListViewController {

    private func registerCells() {
        collectionView.register(
            TaskCollecCollectionViewCell.self,
            forCellWithReuseIdentifier: TaskCollecCollectionViewCell.reuseIdentifier
        )
    }

    enum Constants {
        enum Text {
            static let title: String = "Today"
        }
    }
}

extension TasksListViewController: ActionableListView {
    func didPerformAction(indexPath: IndexPath) {
       // let task = collectionViewDataSource.getItem(at: indexPath)
       // presenter.didSelect(currency: curency)
    }
}
