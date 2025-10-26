//
//  ShadowView.swift
//  PersonalityTest_UIKit
//
//  Created by 陳嘉國
//
// A reusable UIView subclass that adds customizable shadow effects.//
//

import UIKit

class ShadowView: UIView {
    
    // MARK: - Configurable Properties
    // Color of the shadow.
    var shadowColor: UIColor = .black {
        didSet { updateShadow() }
    }
    
    // Opacity of the shadow (0.0 ~ 1.0).
    var shadowOpacity: Float = 1 {
        didSet { updateShadow() }
    }
    
    // Blur radius of the shadow.
    var shadowRadius: CGFloat = 0 {
        didSet { updateShadow() }
    }
    
    // Offset of the shadow from the view’s frame.
    var shadowOffset: CGSize = CGSize(width: 0, height: 4) {
        didSet { updateShadow() }
    }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: - Setup
    // Initialization
    private func setup() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        updateShadow()
    }

    // MARK: - Shadow Update
    // Applies the current shadow settings to the layer.
    private func updateShadow() {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = shadowOffset
        layer.masksToBounds = false
    }
}
