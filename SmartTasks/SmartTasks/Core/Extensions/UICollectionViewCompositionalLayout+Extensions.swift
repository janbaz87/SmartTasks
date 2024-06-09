//
//  UICollectionViewCompositionalLayout+Extensions.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 09/06/2024.
//

import Foundation
import UIKit

extension UICollectionViewCompositionalLayout {

    static func listLayout(backgroundColor: UIColor? = nil) -> UICollectionViewCompositionalLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        configuration.showsSeparators = false
        configuration.backgroundColor = backgroundColor
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }

}
