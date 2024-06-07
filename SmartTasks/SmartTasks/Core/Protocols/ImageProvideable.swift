//
//  ImageProvideable.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 08/06/2024.
//

import UIKit

// MARK: - ImageProvidable

public protocol ImageProvidable {
    /// Returns image with name that exist in extended bundle
    /// - Parameter named: Asset name of image
    static func image(named: String) -> UIImage?
}

extension ImageProvidable {
    public static func image(named: String) -> UIImage? {
        .init(named: named)
    }
}
