//
//  UIColor+Brightness.swift
//  PersonalityTest_UIKit
//
//  Created by 陳嘉國
//
//  Extension for adjusting the brightness of any UIColor instance.
//  Provides a convenient `withBrightness(_:)` method to easily
//  lighten or darken colors while preserving hue and saturation.
//


import UIKit

extension UIColor {
    func withBrightness(_ factor: CGFloat) -> UIColor {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            return UIColor(hue: hue, saturation: saturation, brightness: min(brightness * factor, 1.0), alpha: alpha)
        }
        return self
    }
}
