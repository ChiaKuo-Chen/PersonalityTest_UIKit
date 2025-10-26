//
//  CoverView.swift
//  PersonalityTest_UIKit
//
//  Created by 陳嘉國
//
//  Represents the app’s entry screen with a wooden-styled title (“動物占卜”)
//  and a green gradient start button inviting the user to begin the quiz.
//
//  It would look like this:
//   ┌───┐ ┌───┐ ┌───┐ ┌───┐
//   │動 │ │物  │ │占 │ │卜 │
//   └───┘ └───┘ └───┘ └───┘
//
//        [ Start Button ]
//        (“測測看你是哪種動物？”)
//
//   CoverView
//   ├─ backgroundImageView
//   └─ VStack (UIStackView, vertical)
//        ├─ Spacer0
//        ├─ titleView (UIStackView, horizontal)
//        │    ├─ WoodenUIView × 4
//        ├─ Spacer1
//        └─ startButton (TwoColorUIButton)
//

import UIKit

class CoverView: UIView {
    
    // MARK: - UI Components
    private let backgroundImageView = UIImageView()
    private let titleView = UIStackView()
    let startButton = TwoColorUIButton()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        style()
        layout()
    }
    
    // MARK: - Style
    private func style() {
        
        // Background setup
        backgroundImageView.image = UIImage(named: "BackGround")
        backgroundImageView.contentMode = .scaleAspectFill
        
        // TitleView setup (Hstack)
        titleView.axis = .horizontal
        titleView.alignment = .center
        titleView.distribution = .fill
        titleView.spacing = 20
        
        // Create title “動物占卜” with woodenUIView components
        let titleString = "動物占卜"
        for char in titleString {
            let charView = woodenUIView(labelText: String(char), labelSize: 60)
            titleView.addArrangedSubview(charView)
        }
        
        // StartButton setup (green gradient button)
        startButton.topColor = UIColor(hex: "#33B94D")
        startButton.bottomColor = UIColor(hex: "#009432")
        startButton.setTitle("測測看你是哪種動物？", for: .normal)
        startButton.fontSize = 24
        startButton.strokeWidth = 2
    }
    
    // MARK: - Layout
    private func layout() {
        // Disable AutoresizingMask
        [backgroundImageView, titleView, startButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        // Add background image
        addSubview(backgroundImageView)
        sendSubviewToBack(backgroundImageView)
        
        
        // Spacer views for flexible vertical layout
        let spacer0 = UIView()
        let spacer1 = UIView()
        
        // Main VStack containing title and button
        let vStack = UIStackView(arrangedSubviews: [
            spacer0,
            titleView,
            spacer1,
            startButton
        ])
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.axis = .vertical
        vStack.alignment = .center
        vStack.distribution = .fill
        vStack.spacing = 40

        addSubview(vStack)
        
        // Auto Layout Constraints
        NSLayoutConstraint.activate([
            // Background fills entire view
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // VStack constraints
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            vStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            vStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            // Title centered horizontally
            titleView.centerXAnchor.constraint(equalTo: vStack.centerXAnchor),
            
            // Start button size and bottom margin
            startButton.widthAnchor.constraint(equalToConstant: 360),
            startButton.heightAnchor.constraint(equalToConstant: 60),
            startButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -100),
            
            // Equal spacer heights for balanced layout
            spacer0.heightAnchor.constraint(equalTo: spacer1.heightAnchor)
        ])
    }
}
