//
//  OneFriendView.swift
//  PersonalityTest_UIKit
//
//  Created by 陳嘉國
//
//  This view represents a single "animal friend" shown on a card.
//  It displays the animal’s circular image (with border) above a title label.
//
//  It would look like this:
//         ___＿＿
//        /       \
//       |  Image  |
//        \       /
//         \.___./
//
//          Title
//
//  OneFriendView
//  └─ vstackView (VStack)
//       ├─ animalImageView (AnimalView)
//       └─ titleLabel (UILabel)
//

import UIKit

class OneFriendView: UIView {
    
    // MARK: - Properties
    // The `Animal` object representing this friend.
    private let animal: Animal

    // MARK: - UI Components
    // Vstack containing the image and title.
    private let vstackView = UIStackView()
    // The animal image view (created via `AnimalView()`).
    private var animalImageView = UIView()
    // The label displaying the animal's title(name).
    private let titleLabel = UILabel()

    // MARK: - Init
    init(animal: Animal) {
        self.animal = animal
        super.init(frame: .zero)
        
        // 初始化 AnimalView
        self.animalImageView = AnimalView(
            animalName: animal.name,
            size: 80,
            borderWidth: 2,
            mainCharacter: false
        )
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Style
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        // VStackView setup
        vstackView.axis = .vertical
        vstackView.alignment = .center
        vstackView.distribution = .equalCentering
        vstackView.spacing = 5
        vstackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Title Label setup
        titleLabel.text = animal.title
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.shadowColor = .gray
        titleLabel.shadowOffset = CGSize(width: 0, height: 2)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Animal ImageView setup
        animalImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Layout
    private func layout() {
        // Assemble the hierarchy
        vstackView.addArrangedSubview(animalImageView)
        vstackView.addArrangedSubview(titleLabel)
        addSubview(vstackView)
        
        NSLayoutConstraint.activate([
            // Center the stack view within this view
            vstackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            vstackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            // Fix the size of the animal image view
            animalImageView.widthAnchor.constraint(equalToConstant: 80),
            animalImageView.heightAnchor.constraint(equalTo: animalImageView.widthAnchor)
        ])
    }
}
