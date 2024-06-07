//
//  SmartImages.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 08/06/2024.
//

import Foundation

import UIKit

// MARK: - MarketImage

public enum SmartImages { }

extension SmartImages: ImageProvidable {
    static let emptyIcon = image(named: "empty_list_icon")
    static let leftArrow = image(named: "left_arrow")
    static let rightArrow = image(named: "right_arrow")
}
