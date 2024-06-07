//
//  TasksListViewController.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 07/06/2024.
//

import UIKit

protocol TasksListView: AnyObject {}

class TasksListViewController: UIViewController, TasksListView {

    // MARK: -  Init
    init(presenter: TasksListPresentation) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
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
    }

    // MARK: - Internal
    let presenter: TasksListPresentation

}
