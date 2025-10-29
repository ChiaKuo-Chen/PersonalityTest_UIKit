//
//  WoodenUIView.swift
//  PersonalityTest_UIKit
//
//  Created by 陳嘉國
//
// Creates a wooden-style text container with drop shadow and rounded label.
//
//        ┌──────────────────────────┐
//        │  ShadowView (container)  │
//        │──────────────────────────│
//        │  ┌────────────────────┐  │
//        │  │   WoodenUILabel    │  │
//        │  │  ┌──────────────┐  │  │
//        │  │  │     Text     │  │  |
//        │  │  └──────────────┘  │  │
//        │  └────────────────────┘  │
//        └──────────────────────────┘
//
//  woodenUIView(labelText:)
//  └─ ShadowView
//       └─ WoodenUILabel
//            ├─ Background color: wood orange (#cd6133)
//            ├─ Rounded corners + text shadow
//            └─ Internal padding for text
//


import UIKit

func WoodenUIView(labelText: String, labelSize: CGFloat = 30, labelColor: UIColor = .white,
                  verticalPadding: CGFloat = 8, horizontalPadding: CGFloat = 8) -> UIView {

    // Shadow container
    let shadowView = ShadowView()
    shadowView.translatesAutoresizingMaskIntoConstraints = false
    
    // Label setup
    let label = WoodenUILabel(
        verticalPadding: Device.isPad ? verticalPadding * 1.6 : verticalPadding,
        horizontalPadding: Device.isPad ? horizontalPadding * 1.6 : horizontalPadding
    )
    label.text = labelText
    label.font = UIFont.systemFont(ofSize: Device.isPad ? labelSize * 1.4 : labelSize, weight: .bold)
    label.textColor = labelColor
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .justified
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = 0.7

    // Embed label into the shadow container
    shadowView.addSubview(label)
    
    // Label fills the entire shadow view
    NSLayoutConstraint.activate([
        label.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor),
        label.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor),
        label.topAnchor.constraint(equalTo: shadowView.topAnchor),
        label.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor)
    ])
    
    return shadowView
}

// Wooden label used only in WoodenUIView。
// MARK: - Wooden UILabel (Private)
// A custom UILabel subclass styled like a wooden sign:
// orange background, rounded corners, white bold text, and inner padding.
private class WoodenUILabel: UILabel {
    
    // MARK: - Padding
    private var padding: UIEdgeInsets
    
    init(verticalPadding: CGFloat = 8, horizontalPadding: CGFloat = 8) {
        self.padding = UIEdgeInsets(top: verticalPadding, left: horizontalPadding,
                                    bottom: verticalPadding, right: horizontalPadding)
        super.init(frame: .zero)
        style()
    }
    
    required init?(coder: NSCoder) {
        self.padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        super.init(coder: coder)
        style()
    }
    
    // MARK: - Style
    private func style() {
        textAlignment = .center
        textColor = .white
        shadowColor = UIColor.black
        shadowOffset = Device.isPad ? CGSize(width: 0, height: 6) : CGSize(width: 0, height: 4)
        backgroundColor = UIColor(hex: "#cd6133")
        layer.cornerRadius = Device.isPad ? 25 : 15
        layer.masksToBounds = true
    }
    
    // MARK: - Drawing Overrides
    // Draws text with internal padding.
    override func drawText(in rect: CGRect) {
        let insetRect = rect.inset(by: padding)
        super.drawText(in: insetRect)
    }
    
    // Ensures intrinsic size accounts for padding.
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(
            width: size.width + padding.left + padding.right,
            height: size.height + padding.top + padding.bottom
        )
    }
}
