//
//  UpperEndView.swift
//  PersonalityTest_UIKit
//
//  Created by 陳嘉國
//
//  Displays the upper section of the result screen,
//  showing text like “你的內心住著...” followed by the animal title,
//  a short description, and a circular animal image.
//
//  It would look like this:
//    ┌──────────────┐                  ___
//    │ 你的內心住著...│                /      \
//    ├──────────────┤───            /        \
//        │ animal.title  │         |  Image  |
//        ├───────────────┤───--     \       /
//             │ animal.overview│     `.___.'
//             └─--─────────────┘
//
//  UpperEndView
//  └─ upperView (HStack)
//       ├─ titleVStackView (VStack)
//       │    ├─ HStack0 (Left-aligned)
//       │    ├─ TitleLabel (Center)
//       │    └─ HStack1 (Right-aligned)
//       └─ animalImageView (Circle Image)
//

import UIKit

class UpperEndView: UIView {
    
    // MARK: - Properties
    // The animal object used to populate this view.
    private var animal: Animal
    
    // MARK: - UI Components
    // Main Hstack holding title area and image.
    private let upperView = UIStackView()
    // Vstack containing three text rows.
    private let titleVStackView = UIStackView()
    // Spacer for IPad Device.
    private var ipadSpacer = UIView()
    // Circular animal image on the right side.
    private var animalImageView = UIView()
    
    // Top wooden label displaying "你的內心住著..."
    private let topLabel = WoodenUIView(labelText: "你的內心住著...",
                                        labelSize: 20, verticalPadding: 4, horizontalPadding: 8)
    // Center title label (animal title)
    private var titleLabel = UIView()
    // Bottom description label (animal overview)
    private var bottomLabel = UIView()
    
    // MARK: - Init
    init(animal: Animal) {
        self.animal = animal
        super.init(frame: .zero)
        loadAnimal(with: animal)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Style
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        // Main Hstack
        upperView.axis = .horizontal
        upperView.alignment = .center
        upperView.spacing = Device.isPad ? 24 : 12
        upperView.translatesAutoresizingMaskIntoConstraints = false
        
        // Title VStack
        titleVStackView.axis = .vertical
        titleVStackView.alignment = .center
        titleVStackView.spacing = Device.isPad ? 12 : 8
        titleVStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: - Top HStack (left-aligned)
        let hstack0 = UIStackView()
        hstack0.axis = .horizontal
        hstack0.alignment = .center
        hstack0.distribution = .fill
        hstack0.translatesAutoresizingMaskIntoConstraints = false
        
        let spacer0 = UIView() // pushes content to the left
        hstack0.addArrangedSubview(topLabel)
        hstack0.addArrangedSubview(spacer0)
        titleVStackView.addArrangedSubview(hstack0)
                
        // MARK: - Center title
        titleVStackView.addArrangedSubview(titleLabel)
        
        // MARK: - Bottom HStack (right-aligned)
        let hstack1 = UIStackView()
        hstack1.axis = .horizontal
        hstack1.alignment = .center
        hstack1.distribution = .fill
        hstack1.translatesAutoresizingMaskIntoConstraints = false
        
        let spacer1 = UIView()
        hstack1.addArrangedSubview(spacer1) // pushes content to the right
        hstack1.addArrangedSubview(bottomLabel)
        titleVStackView.addArrangedSubview(hstack1)
        
        NSLayoutConstraint.activate([
            hstack0.leadingAnchor.constraint(equalTo: titleVStackView.leadingAnchor),
            hstack0.trailingAnchor.constraint(equalTo: titleVStackView.trailingAnchor),

            hstack1.leadingAnchor.constraint(equalTo: titleVStackView.leadingAnchor),
            hstack1.trailingAnchor.constraint(equalTo: titleVStackView.trailingAnchor),
        ])
        
        // MARK: - Animal image
        animalImageView = AnimalView(animalName: animal.name, size: Device.isPad ? 220 : 180)
        animalImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Layout
    private func layout() {
        upperView.addArrangedSubview(titleVStackView)
        upperView.addArrangedSubview(ipadSpacer)
        upperView.addArrangedSubview(animalImageView)
        addSubview(upperView)
        
        NSLayoutConstraint.activate([
            upperView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Device.isPad ? 166 : 6),
            upperView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Device.isPad ? -166 : -6),
            upperView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            topLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: Device.isPad ? 36 : 28),
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: Device.isPad ? 60 : 45),
            bottomLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: Device.isPad ? 38 : 28),
            
            ipadSpacer.widthAnchor.constraint(equalToConstant: Device.isPad ? 80 : 0)
        ])
    }
    
    // MARK: - Update Data
    func loadAnimal(with animal: Animal) {
        self.animal = animal
        titleLabel = WoodenUIView(labelText: animal.title,
                                  labelSize: Device.isPad ? 55 : 45,
                                  verticalPadding: 6, horizontalPadding: 10)
        bottomLabel = WoodenUIView(labelText: animal.overview,
                                   labelSize: Device.isPad ? 28 : 20,
                                   verticalPadding: 4, horizontalPadding: 8)
        animalImageView = AnimalView(animalName: animal.name)
    }
}
