//
//  RarityView.swift
//  PersonalityTest_UIKit
//
//  Created by 陳嘉國
//
//  Displays the rarity level of an animal with a rarity label (UR/SSR/etc.)
//  followed by a number of glowing stars indicating rarity.
//
//  It would look like this:
//        UR ☆☆☆☆☆☆
//
//  RarityView
//  └─ rarityHStackView
//      ├─ rarityImage
//      └─ starHStackView
//            ├─ (ShadowView + StarImage) × (5 or 6)
//

import UIKit

class RarityView: UIView {
    
    // MARK: - Properties
    // The animal whose rarity is being displayed.
    private var animal: Animal
    // Computed number of stars based on rarity value.
    private var starCount: Int {
        switch (animal.rarity) {
        case 0..<5 : return 6    // Ultra Rare (UR)
        case 5..<10: return 5    // Super Super Rare (SSR)
        case 10..<15: return 4   // Super Super Rare (SSR)
        default: return 3        // Super Super Rare (SSR)
        }
    }

    // MARK: - UI Components
    // HstackView for rarity label and star group.
    private let rarityHStackView = UIStackView()
    // Hstack holding all star images.
    private let starHStackView = UIStackView()
    // Rarity label image (“UR” or “SSR”).
    private var rarityImageView = UIImageView()

    // MARK: - Init
    init(animal: Animal) {
        self.animal = animal
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Style
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        // Main horizontal stack
        rarityHStackView.axis = .horizontal
        rarityHStackView.alignment = .center
        rarityHStackView.distribution = .fill
        rarityHStackView.spacing = 10
        rarityHStackView.translatesAutoresizingMaskIntoConstraints = false

        // Star container stack
        starHStackView.axis = .horizontal
        starHStackView.alignment = .center
        starHStackView.distribution = .fillEqually
        starHStackView.spacing = 5
        starHStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Rarity label image
        rarityImageView = UIImageView(
            image: UIImage(named: starCount == 6 ? "UR5" : "SSR2")
        )
        rarityImageView.contentMode = .scaleAspectFit
        rarityImageView.translatesAutoresizingMaskIntoConstraints = false

        // Build star components dynamically
        for _ in 0..<starCount {
            let starWithShadow = ShadowView()
            starWithShadow.shadowOffset = CGSize(width: 4, height: 2)
            starWithShadow.translatesAutoresizingMaskIntoConstraints = false

            let starImage = UIImageView(image: UIImage(named: "star"))
            starImage.contentMode = .scaleAspectFit
            starImage.translatesAutoresizingMaskIntoConstraints = false
            starWithShadow.addSubview(starImage)

            NSLayoutConstraint.activate([
                starImage.leadingAnchor.constraint(equalTo: starWithShadow.leadingAnchor),
                starImage.trailingAnchor.constraint(equalTo: starWithShadow.trailingAnchor),
                starImage.topAnchor.constraint(equalTo: starWithShadow.topAnchor),
                starImage.bottomAnchor.constraint(equalTo: starWithShadow.bottomAnchor),
                starWithShadow.widthAnchor.constraint(equalToConstant: 45),
                starWithShadow.heightAnchor.constraint(equalToConstant: 45)
            ])

            starHStackView.addArrangedSubview(starWithShadow)
        }

        // Combine into hierarchy
        rarityHStackView.addArrangedSubview(rarityImageView)
        rarityHStackView.addArrangedSubview(starHStackView)
        addSubview(rarityHStackView)
    }
    
    // MARK: - Layout
    private func layout() {
        NSLayoutConstraint.activate([
            // Rarity label size
            rarityImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.23),
            rarityImageView.heightAnchor.constraint(equalToConstant: 70),

            // Star container height
            starHStackView.heightAnchor.constraint(equalToConstant: 70),

            // Main Hstack layout
            rarityHStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            rarityHStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            rarityHStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
