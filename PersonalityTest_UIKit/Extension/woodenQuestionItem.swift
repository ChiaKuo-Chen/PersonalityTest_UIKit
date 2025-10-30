//
//  woodenQuestionItem.swift
//  PersonalityTest_UIKit
//
//  Created by 陳嘉國
//
//  Creates a wooden-style “?” toolbar button with press-down animation.
//
//        ┌──────────────────────────────┐
//        │   UIBarButtonItem            │
//        │──────────────────────────────│
//        │  ┌────────────────────────┐  │
//        │  │     UIButton (wood)    │  │
//        │  │   ┌──────────────┐     │  │
//        │  │   │      ?       │     │  │
//        │  │   └──────────────┘     │  │
//        │  └────────────────────────┘  │
//        └──────────────────────────────┘
//
//  woodenQuestionItem(target:action:)
//  └─ UIButton
//       ├─ Background color: wood orange (#cd6133)
//       ├─ Rounded corners + drop shadow
//       ├─ White bold “?” centered
//       └─ Press animation: scales down + darkens
//

import UIKit

extension UIBarButtonItem {
    
    // Creates a custom wooden-style question mark item for the toolbar.
    // - Parameters:
    //   - target: The object that receives the action message.
    //   - action: The selector to call when the button is tapped.
    // - Returns: A `UIBarButtonItem` containing the styled wooden “?” button.
    static func woodenQuestionItem(target: Any?, action: Selector) -> UIBarButtonItem {
        
        // MARK: - Button Setup
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: - Appearance
        button.backgroundColor = UIColor(hex: "#cd6133") // Wood orange
        button.setTitle("?", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.shadowColor = .black
        button.titleLabel?.shadowOffset = CGSize(width: 0, height: Device.isPad ? 4 : 2)
        button.titleLabel?.font = UIFont.systemFont(
            ofSize: Device.isPad ? 32 : 26,
            weight: .heavy
        )
        
        // MARK: - Corner & Shadow
        button.layer.cornerRadius = Device.isPad ? 12 : 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: Device.isPad ? 4 : 2)
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 0
        
        // MARK: - Size
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: Device.isPad ? 50 : 40),
            button.heightAnchor.constraint(equalToConstant: Device.isPad ? 50 : 40)
        ])
        
        // MARK: - Touch Animations
        // Adds visual feedback when pressed (darken + scale down)
        button.addTarget(self, action: #selector(pressDown(_:)), for: [.touchDown, .touchDragEnter])
        button.addTarget(self, action: #selector(pressUp(_:)), for: [.touchUpInside, .touchCancel, .touchDragExit])

        // MARK: - Action Binding
        button.addTarget(target, action: action, for: .touchUpInside)
        
        // Wrap in UIBarButtonItem
        return UIBarButtonItem(customView: button)
    }
    
    // MARK: - Press Animation Handlers
    // Called when the button is pressed down.
    // Shrinks and darkens the button to simulate a tactile “wood press” feel.
    @objc private static func pressDown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseInOut]) {
            sender.backgroundColor = UIColor(hex: "#7a2e14") // Darker wood tone
            sender.layer.shadowOpacity = 0
        }
    }
    
    // Called when the touch is released or canceled.
    // Restores the button’s brightness, size, and shadow intensity.
    @objc private static func pressUp(_ sender: UIButton) {
        UIView.animate(withDuration: 0.15, delay: 0, options: [.curveEaseInOut]) {
            sender.backgroundColor = UIColor(hex: "#cd6133") // Original wood color
            sender.layer.shadowOpacity = 1
        }
    }

}
