//
//  Fonts.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 07/06/2024.
//

import UIKit

public typealias SmartFont = UIFont

// MARK: Fonts
extension SmartFont {

    enum FontName: String, CaseIterable {
        case amsiProBold = "AmsiPro-Bold"
        case amsiProRegular = "AmsiPro-Regular"
    }

    static func font(withName fontName: FontName, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: fontName.rawValue, size: size) else {
            return UIFont.systemFont(ofSize: size)
        }

        return font
    }
}
