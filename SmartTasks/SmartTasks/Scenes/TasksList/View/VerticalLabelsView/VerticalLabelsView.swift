//
//  VerticalLabelsView.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 09/06/2024.
//

import UIKit

class VerticalLabelsView: UIView {

    // Title label
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = SmartFont.font(withName: .amsiProRegular, size: 10)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Value label
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = SmartFont.font(withName: .amsiProBold, size: 15)
        label.textColor = SmartColor.appRed
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

    // Setup the view
    private func setupView() {
        // Add labels to the view
        addSubview(titleLabel)
        addSubview(valueLabel)

        // Setup Auto Layout constraints
        NSLayoutConstraint.activate([
            // Title label constraints
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

            // Value label constraints
            valueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
