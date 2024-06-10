//
//  TaskCollecCollectionViewCell.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 09/06/2024.
//

import UIKit

final class TaskCollecCollectionViewCell: UICollectionViewCell, ReusableView {
    // MARK: - Views
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = SmartFont.font(withName: .amsiProBold, size: Constants.titleFontSize)
        label.textColor = SmartColor.appRed
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var dueDateView: VerticalLabelsView = {
        let view = VerticalLabelsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var daysleftView: VerticalLabelsView = {
        let view = VerticalLabelsView()
        view.setTextAlignment(to: .right)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var stackViewForDueDateAndDaysLeft: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var stackViewForDueDateAndDaysLeft1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = Constants.space
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.cornerRadius = Constants.cornerRadius
        view.backgroundColor = .white
        return view
    }()

    private lazy var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = SmartColor.appOffWhite
        return view
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        configureConstraints()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Congigure cell
    func configure(with task: SmartTask) {
        titleLabel.text = task.title
        dueDateView.setTitle(title: Constants.Texts.dueDataTitle, value: task.dueDate?.appDateFormat() ?? Constants.Texts.noDueDateYet)
        daysleftView.setTitle(title: Constants.Texts.daysLeftTitle, value: task.dueDate?.daysLeft() ?? "0")
    }
}

// MARK: - Private
private extension TaskCollecCollectionViewCell {

    func setupUI() {
        contentView.backgroundColor = .clear
        stackViewForDueDateAndDaysLeft.addArrangedSubviews([dueDateView, daysleftView])
        stackView.addArrangedSubviews([
            titleLabel,
            separatorView,
            stackViewForDueDateAndDaysLeft
        ])
        containerView.addSubview(stackView)
        contentView.addSubview(containerView)
    }

    func configureConstraints() {
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.padding),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.padding),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.padding),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        // Sets constraints of Vertical StackView
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.padding),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constants.padding),
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.padding),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -Constants.padding)
        ])

        // Sets heights
        NSLayoutConstraint.activate([
            separatorView.heightAnchor.constraint(equalToConstant: Constants.separatorHeight)
        ])
    }

    enum Constants {
        static let cornerRadius: CGFloat = 5
        static let padding: CGFloat = 10
        static let space: CGFloat = 7
        static let separatorHeight: CGFloat = 1
        static let titleFontSize: CGFloat = 15

        enum Texts {
            static let dueDataTitle: String = "Due date"
            static let daysLeftTitle: String = "Days left"
            static let noDueDateYet: String = "No due date"
        }
    }
}
