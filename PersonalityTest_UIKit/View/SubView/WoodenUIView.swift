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

func woodenUIView(labelText: String, labelSize: CGFloat = 30, labelColor: UIColor = .white,
                  verticalPadding: CGFloat = 8, horizontalPadding: CGFloat = 8) -> UIView {

    // Shadow container
    let shadowView = ShadowView()
    shadowView.translatesAutoresizingMaskIntoConstraints = false
    
    // Label setup
    let questionLabel = WoodenUILabel(
        verticalPadding: verticalPadding,
        horizontalPadding: horizontalPadding
    )
    questionLabel.text = labelText
    questionLabel.font = UIFont.systemFont(ofSize: labelSize, weight: .bold)
    questionLabel.textColor = labelColor
    questionLabel.numberOfLines = 0
    questionLabel.translatesAutoresizingMaskIntoConstraints = false
    questionLabel.textAlignment = .justified
    
    // Embed label into the shadow container
    shadowView.addSubview(questionLabel)
    
    // Label fills the entire shadow view
    NSLayoutConstraint.activate([
        questionLabel.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor),
        questionLabel.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor),
        questionLabel.topAnchor.constraint(equalTo: shadowView.topAnchor),
        questionLabel.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor)
    ])
    
    return shadowView
}

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
        shadowOffset = CGSize(width: 0, height: 4)
        backgroundColor = UIColor(hex: "#cd6133")
        layer.cornerRadius = 15
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
