//
//  SmartColors.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 07/06/2024.
//

import UIKit

public typealias SmartColor = UIColor

// MARK: Smart Colors

extension SmartColor {
    class var appBackground: UIColor {
        return colorWith(name: "smart_background")
    }

    class var red: UIColor {
        return colorWith(name: "smart_red")
    }

    class var green: UIColor {
        return colorWith(name: "smart_green")
    }

    class var OffWhite: UIColor {
        return colorWith(name: "smart_cream")
    }

    static func colorWith(name : String ) -> UIColor {
        guard let color =  UIColor(named: name) else {
            return .red
        }

        return color
    }
}
