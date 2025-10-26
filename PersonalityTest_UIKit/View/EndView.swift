//
//  EndView.swift
//  PersonalityTest_UIKit
//
//  Created by 陳嘉國
//
//  Represents the final results screen shown after the personality test.
//  Displays the user's animal result, rarity, description, compatible friends,
//  and a button to return to the home screen.
//
//  It would look like this:
//     ┌─────────────────────────────--─┐
//     │    🌄 背景圖 (BackGround)       │
//     │─────────────────────────────--─│
//     │   ┌────────────────────────┐   │
//     │   │  UpperEndView          │   │
//     │   │ ┌──────────────┐       │   │
//     │   │ │ 你的內心住著...│ ...   │   │
//     │   │ └──────────────┘       │   │
//     │   └────────────────────────┘   │
//     │────────────────────────────--──│
//     │   RarityView  →  UR ☆☆☆☆☆☆     │
//     │─────────────────────────────---│
//     │        discriptionView         │
//     │        (woodenUIView)          │
//     │────────────────────────--──────│
//     │ FriendsCardView (woodenUIView) │
//     │        🦊 🐻 🐼               │
//     │──────────────────────────--────│
//     │  [ 回到首頁 ] (TwoColorUIButton) │
//     │────────────────────────────--──│
//     │  Presented by Chia-Kuo Chen    │
//     └────────────────────────────--──┘
//
//  EndView
//  └─ backgroundImageView (UIImageView)
//  └─ vStack (VStack)
//       ├─ upperView (UpperEndView)
//       ├─ rarityView (RarityView)
//       ├─ discriptionView (woodenUIView)
//       ├─ friendsCardView (FriendsCardView)
//       ├─ backButton (TwoColorUIButton)
//       └─ authorLabel (UILabel)
//

import UIKit

class EndView: UIView {
    
    // MARK: - Properties
    // The animal data used to populate all subviews.
    private var animal: Animal

    // MARK: - UI Components
    private let backgroundImageView = UIImageView()
    private var upperView: UpperEndView!
    private var rarityView: RarityView!
    private var discriptionView = UIView()
    private var friendsCardView: FriendsCardView!
    private var authorLabel = UILabel()
    var backButton = TwoColorUIButton()

    // MARK: - Init
    // Initializes the EndView with a specific animal result.
    init(animal: Animal) {
        self.animal = animal
        super.init(frame: .zero)
        update(animal: animal)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Style
    private func style() {
        // Background setup
        backgroundImageView.image = UIImage(named: "BackGround")
        backgroundImageView.contentMode = .scaleAspectFill

        // Description (woodenUIView with animal description text)
        discriptionView = woodenUIView(labelText: animal.description, horizontalPadding: 12)

        // Author label at the bottom of the screen
        authorLabel.text = "Presented by Chia-Kuo Chen"
        authorLabel.font = .systemFont(ofSize: 22, weight: .black)
        authorLabel.textColor = .white
        authorLabel.textAlignment = .center

        // Back button ("Return to Home") styling
        backButton.setTitle("回到首頁", for: .normal)
        backButton.fontSize = 20
        backButton.strokeWidth = 2
        backButton.cornerRadius = 12.5
    }

    // MARK: - Layout
    private func layout() {
        // Disable AutoresizingMask
        [backgroundImageView, upperView, rarityView, discriptionView, friendsCardView, backButton, authorLabel].forEach {
            $0?.translatesAutoresizingMaskIntoConstraints = false
        }

        // Add background image
        addSubview(backgroundImageView)
        sendSubviewToBack(backgroundImageView)

        // Main vertical stack containing all major UI elements
        let vStack = UIStackView(arrangedSubviews: [
            upperView,
            rarityView,
            discriptionView,
            friendsCardView,
            backButton,
            authorLabel
        ])
        vStack.axis = .vertical
        vStack.alignment = .center
        vStack.distribution = .fill
        vStack.spacing = 20
        vStack.translatesAutoresizingMaskIntoConstraints = false

        addSubview(vStack)
        
        // Apply Auto Layout constraints
        NSLayoutConstraint.activate([
            // Background fills entire view
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            // Main StackView anchors
            vStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            vStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            vStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            // Subview constraints for consistent layout proportions
            upperView.heightAnchor.constraint(equalToConstant: 180),
            upperView.leadingAnchor.constraint(equalTo: vStack.leadingAnchor),
            upperView.trailingAnchor.constraint(equalTo: vStack.trailingAnchor),

            rarityView.heightAnchor.constraint(equalToConstant: 70),
            rarityView.leadingAnchor.constraint(equalTo: vStack.leadingAnchor),
            rarityView.trailingAnchor.constraint(equalTo: vStack.trailingAnchor),
            
            discriptionView.widthAnchor.constraint(equalToConstant: 360),
            discriptionView.heightAnchor.constraint(equalToConstant: 180),
            
            friendsCardView.leadingAnchor.constraint(equalTo: vStack.leadingAnchor),
            friendsCardView.trailingAnchor.constraint(equalTo: vStack.trailingAnchor),
            friendsCardView.heightAnchor.constraint(equalToConstant: 180),

            backButton.widthAnchor.constraint(equalToConstant: 360),
            backButton.heightAnchor.constraint(equalToConstant: 30),

            authorLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    // MARK: - Data Setup
    // Creates and updates subviews based on the current animal data.
    private func update(animal: Animal) {
        upperView = UpperEndView(animal: animal)
        rarityView = RarityView(animal: animal)
        friendsCardView = FriendsCardView(animal: animal)
    }
}
