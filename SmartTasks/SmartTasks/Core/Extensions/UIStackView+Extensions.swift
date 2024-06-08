//
//  UIStackView+Extensions.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 09/06/2024.
//

import UIKit

extension UIStackView {

    @discardableResult
    public func addArrangedSubviews(_ views: [UIView]) -> Self {
        views.forEach(addArrangedSubview)
        return self
    }

}
