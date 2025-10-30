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
    private var descriptionView = UIView()
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
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        upperView.translatesAutoresizingMaskIntoConstraints = false
        rarityView.translatesAutoresizingMaskIntoConstraints = false
        
        // Description (woodenUIView with animal description text)
        descriptionView = WoodenUIView(labelText: animal.description, horizontalPadding: 12)
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        
        friendsCardView.translatesAutoresizingMaskIntoConstraints = false
        
        // Back button ("Return to Home") styling
        backButton.setTitle("回到首頁", for: .normal)
        backButton.fontSize = Device.isPad ? 36 : 24
        backButton.strokeWidth = 2
        backButton.cornerRadius = 12.5
        backButton.translatesAutoresizingMaskIntoConstraints = false

        // Author label at the bottom of the screen
        authorLabel.text = "Presented by Chia-Kuo Chen"
        authorLabel.font = .systemFont(ofSize: Device.isPad ? 26 : 22, weight: .black)
        authorLabel.textColor = .white
        authorLabel.textAlignment = .center
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: - Layout
    private func layout() {

        // Add background image
        addSubview(backgroundImageView)
        sendSubviewToBack(backgroundImageView)

        // Main vertical stack containing all major UI elements
        let VStack = UIStackView(arrangedSubviews: [
            upperView,
            rarityView,
            descriptionView,
            friendsCardView,
            backButton,
            authorLabel
        ])
        VStack.axis = .vertical
        VStack.alignment = .center
        VStack.distribution = .fill
        VStack.spacing = Device.isPad ? 30 : 20
        VStack.translatesAutoresizingMaskIntoConstraints = false

        addSubview(VStack)
        
        // Apply Auto Layout constraints
        NSLayoutConstraint.activate([
            // Background fills entire view
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            // Main StackView anchors
            VStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            VStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            VStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            VStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            // Subview constraints for consistent layout proportions
            upperView.leadingAnchor.constraint(equalTo: VStack.leadingAnchor),
            upperView.trailingAnchor.constraint(equalTo: VStack.trailingAnchor),
            upperView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: Device.isPad ? 0.25 : 0.2),

            rarityView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.075),
            rarityView.leadingAnchor.constraint(equalTo: VStack.leadingAnchor),
            rarityView.trailingAnchor.constraint(equalTo: VStack.trailingAnchor),
            
            descriptionView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            descriptionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: Device.isPad ? 0.22 : 0.18),

            friendsCardView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            friendsCardView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: Device.isPad ? 0.25 : 0.2),

            backButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            backButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: Device.isPad ? 0.05 : 0.03),

            authorLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: Device.isPad ? 0.04 : 0.03)
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
