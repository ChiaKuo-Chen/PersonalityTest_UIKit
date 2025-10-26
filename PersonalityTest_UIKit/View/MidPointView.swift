//
//  MidPointView.swift
//  PersonalityTest_UIKit
//
//  Created by 陳嘉國
//
//  This view displays a multiple-choice question in the middle of the screen,
//  with a wooden question board and one to three answer buttons.
//
//  It would look like this:
//        ┌──────────────────────┐
//        │      （背景圖）        │
//        │  BackGround Image    │
//        ├──────────────────────┤
//        │     ↑ Spacer ↑       │
//        │ ┌──────────────────┐ │
//        │ │   questionView   │ │
//        │ │ (woodenUIView)   │ │
//        │ └──────────────────┘ │
//        │      ↓ Spacer ↓      │
//        │    ┌────────────┐    │
//        │    │ choiceBtn0 │    │
//        │    ├────────────┤    │
//        │    │ choiceBtn1 │    │
//        │    ├────────────┤    │
//        │   (│ choiceBtn2 │)   │  ← optional
//        │    └────────────┘    │
//        └──────────────────────┘
//
//  MidPointView
//  └─ backgroundImageView (UIImageView)
//  └─ VStack (UIStackView)
//       ├─ spacer0 (UIView)
//       ├─ questionView (woodenUIView)
//       ├─ spacer1 (UIView)
//       ├─ choiceButton0 (TwoColorUIButton)
//       ├─ choiceButton1 (TwoColorUIButton)
//       └─ (choiceButton2) (TwoColorUIButton, optional)
//

import UIKit

class MidPointView: UIView {
    
    // MARK: - UI Components
    private var midPoint: MidPoint

    // The question board
    var questionView = UIView()
    
    // Choice buttons
    let choiceButton0 = TwoColorUIButton()
    let choiceButton1 = TwoColorUIButton()
    let choiceButton2 = TwoColorUIButton()
    
    // Background image
    private var backgroundImageView: UIImageView!
    
    // MARK: - Init
    init(midPoint: MidPoint) {
        self.midPoint = midPoint
        super.init(frame: .zero)
        questionView = woodenUIView(labelText: midPoint.title)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Style
    private func style() {
        
        // Setup background
        if let bgImage = UIImage(named: "BackGround") {
            backgroundImageView = UIImageView(image: bgImage)
            backgroundImageView.contentMode = .scaleAspectFill
            backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(backgroundImageView)
            sendSubviewToBack(backgroundImageView)
        }
        
        // Setup questionView
        questionView.translatesAutoresizingMaskIntoConstraints = false
        
        // Setup choice buttons
        choiceButton0.setTitle(midPoint.choiceString[0], for: .normal)
        choiceButton0.strokeWidth = 2
        choiceButton0.translatesAutoresizingMaskIntoConstraints = false
        
        choiceButton1.setTitle(midPoint.choiceString[1], for: .normal)
        choiceButton1.strokeWidth = 2

        choiceButton1.translatesAutoresizingMaskIntoConstraints = false
        
        if midPoint.choiceString.count > 2 {
            choiceButton2.setTitle(midPoint.choiceString[2], for: .normal)
            choiceButton2.strokeWidth = 2
            choiceButton2.translatesAutoresizingMaskIntoConstraints = false
        }

    }
    
    // MARK: - Layout
    private func layout() {
        guard let background = backgroundImageView else { return }
        
        
        // Setup VSTack
        let VStack = UIStackView()
        VStack.axis = .vertical
        VStack.alignment = .center
        VStack.distribution = .fill
        VStack.spacing = 20
        VStack.translatesAutoresizingMaskIntoConstraints = false
        
        // Spacers for layout balance
        let spacer0 = UIView()
        let spacer1 = UIView()

        // VStack content
        VStack.addArrangedSubview(spacer0)
        VStack.addArrangedSubview(questionView)
        VStack.addArrangedSubview(spacer1)
        VStack.addArrangedSubview(choiceButton0)
        VStack.addArrangedSubview(choiceButton1)
        
        if midPoint.choiceString.count > 2 {
            VStack.addArrangedSubview(choiceButton2)
        }

        addSubview(VStack)
        
        // Fill entire View with background
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: leadingAnchor),
            background.trailingAnchor.constraint(equalTo: trailingAnchor),
            background.topAnchor.constraint(equalTo: topAnchor),
            background.bottomAnchor.constraint(equalTo: bottomAnchor),

        // Auto Layout for VStack
            VStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            VStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            VStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            VStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        
        // Auto Layout for questionView
            questionView.centerXAnchor.constraint(equalTo: VStack.centerXAnchor),
            questionView.widthAnchor.constraint(equalToConstant: 360),
            questionView.heightAnchor.constraint(equalToConstant: 254.5)
        ])
    
        // Auto Layout for choice buttons
        if midPoint.choiceString.count > 2 {
            NSLayoutConstraint.activate([
                choiceButton0.widthAnchor.constraint(equalToConstant: 360),
                choiceButton0.heightAnchor.constraint(equalToConstant: 60),
                choiceButton0.bottomAnchor.constraint(equalTo: choiceButton1.topAnchor, constant: -30),
                
                choiceButton1.widthAnchor.constraint(equalToConstant: 360),
                choiceButton1.heightAnchor.constraint(equalToConstant: 60),
                choiceButton1.bottomAnchor.constraint(equalTo: choiceButton2.topAnchor, constant: -30),

                choiceButton2.widthAnchor.constraint(equalToConstant: 360),
                choiceButton2.heightAnchor.constraint(equalToConstant: 60),
                choiceButton2.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50)

            ])
        } else {
            NSLayoutConstraint.activate([
                choiceButton0.widthAnchor.constraint(equalToConstant: 360),
                choiceButton0.heightAnchor.constraint(equalToConstant: 60),
                choiceButton0.bottomAnchor.constraint(equalTo: choiceButton1.topAnchor, constant: -30),
                
                choiceButton1.widthAnchor.constraint(equalToConstant: 360),
                choiceButton1.heightAnchor.constraint(equalToConstant: 60),
                choiceButton1.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50)
            ])
        }
        // Equal spacer heights for balanced layout
        spacer0.heightAnchor.constraint(equalTo: spacer1.heightAnchor).isActive = true

    }
}
