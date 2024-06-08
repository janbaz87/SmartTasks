//
//  ReusableView.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 09/06/2024.
//

import UIKit

// MARK: - ReusableView

/// ReusableView protocol.
public protocol ReusableView: AnyObject { }

/// ReusableView extension, Provides reuseIdentifier from class name.
extension ReusableView where Self: UIView {
    public static var reuseIdentifier: String {
        String(describing: self)
    }

    public func prepareForReuse() { }
}
