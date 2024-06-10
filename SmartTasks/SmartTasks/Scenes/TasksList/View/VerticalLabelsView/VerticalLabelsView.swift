//
//  VerticalLabelsView.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 09/06/2024.
//

import UIKit

final class VerticalLabelsView: UIView {
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    // Title label
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = SmartFont.font(withName: .amsiProRegular, size: 10)
        label.textColor = .gray
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Value label
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = SmartFont.font(withName: .amsiProBold, size: 15)
        label.textColor = SmartColor.appRed
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Custom initializer
    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setTitle(title: String, value: String) {
        // Set the label texts
        titleLabel.text = title
        valueLabel.text = value
    }

    func setTextAlignment(to alignment: NSTextAlignment) {
        titleLabel.textAlignment = alignment
        valueLabel.textAlignment = alignment
    }

    // Setup the view
    private func setupView() {
        // Add labels to the view
        stackView.addArrangedSubviews([titleLabel, valueLabel])
        addSubview(stackView)

        // Setup Auto Layout constraints
        NSLayoutConstraint.activate([
            // Title label constraints
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
