//
//  TasksListViewController.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 07/06/2024.
//

import UIKit

protocol TasksListView: AnyObject {}

final class TasksListViewController: UIViewController, TasksListView {

    // MARK: - Views
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        // Do any additional setup after loading the view.

        view.addSubview(emptyView)

        NSLayoutConstraint.activate([
            emptyView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emptyView.heightAnchor.constraint(equalToConstant: 300),
            emptyView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }

    // MARK: - Internal
    let presenter: TasksListPresentation

    // MARK: - Private
    private func registerCells() {
//        collectionView.register(
//            ExchangeRatesCollectionViewCell.self,
//            forCellWithReuseIdentifier: ExchangeRatesCollectionViewCell.reuseIdentifier
//        )
    }

    private func addLeftRightButtons() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: SmartImages.rightArrow, style: .plain, target: self, action: #selector(self.menuAction(_:)))

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: SmartImages.leftArrow, style: .plain, target: self, action: #selector(self.searchAction(_:)))
    }

    @objc 
    func menuAction(_ sender: UIButton) {

    }

    @objc 
    func searchAction(_ sender: UIButton) {

    }

}

// MARK: - Setup
private extension TasksListViewController {
    func setupUI() {
        title = Constants.Text.title
        addLeftRightButtons()
    }

    func configureConstraints() {

    }
}

private extension TasksListViewController {
    enum Constants {
        enum Text {
            static let title: String = "Today"
        }
    }
}
