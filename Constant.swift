//
//  Constants.swift
//  PersonalityTest_UIKit
//
//  Created by 陳嘉國
//

import UIKit

enum Device {
    // Check if the device is an iPad
    static let isPad: Bool = UIDevice.current.userInterfaceIdiom == .pad
    // Check if the device is an iPhone
    static let isPhone: Bool = UIDevice.current.userInterfaceIdiom == .phone
}
