//
//  EmptyView.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 07/06/2024.
//

import Foundation
import UIKit

final class EmptyView: UIView {

    // MARK: - Views

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = SmartFont.font(withName: .amsiProBold, size: SmartUI.Size.title)
        label.textColor = .white
        label.text = Constants.Text.title
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SmartImages.emptyIcon
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
}

// MARK: - Setup
private extension EmptyView {

    func setupUI() {

        addSubview(imageView)
        addSubview(titleLabel)
    }

    func configureConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -Constants.padding),
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.padding),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.padding),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constants.padding)
        ])
    }

    // MARK: - Constants

    enum Constants {
        static let padding: CGFloat = 16.0
        static let spacing: CGFloat = 10.0
        static let imageSize: CGFloat = 240
        static let titleHeight: CGFloat = 30

        enum Text {
            static let title: String = "No tasks for today!"
        }
    }
}
