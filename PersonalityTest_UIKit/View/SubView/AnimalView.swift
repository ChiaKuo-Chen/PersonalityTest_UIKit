//
//  AnimalView.swift
//  PersonalityTest_UIKit
//
//  Created by 陳嘉國
//
// Creates a circular animal image view with optional foil texture and shadow.
// When `mainCharacter` is true, the view includes a golden border
// and foil texture for a highlighted look.
//
import UIKit

func AnimalView(animalName: String, size: CGFloat = 180, borderWidth: CGFloat = 4, mainCharacter: Bool = true) -> UIView {
    
    // MARK: - Container
    // Use ShadowView for main characters to provide visual emphasis.
    let container: UIView
    if mainCharacter {
        container = ShadowView()
    } else {
        container = UIView()
    }
    container.translatesAutoresizingMaskIntoConstraints = false

    // MARK: - Image Setup
    let animalImageView = UIImageView(image: UIImage(named: animalName))
    animalImageView.contentMode = .scaleAspectFit
    animalImageView.translatesAutoresizingMaskIntoConstraints = false
    animalImageView.layer.cornerRadius = size / 2
    animalImageView.layer.masksToBounds = true
    animalImageView.layer.borderWidth = borderWidth
    animalImageView.layer.borderColor = UIColor.white.cgColor
    
    // MARK: - Foil Texture (for main character)
    if mainCharacter {
        let foilTexture = UIImageView(image: UIImage(named: "foilTexture"))
        foilTexture.contentMode = .scaleAspectFit
        foilTexture.translatesAutoresizingMaskIntoConstraints = false
        animalImageView.layer.borderColor = UIColor(hex: "#cd6133").cgColor

        animalImageView.addSubview(foilTexture)
        
        NSLayoutConstraint.activate([
            foilTexture.leadingAnchor.constraint(equalTo: animalImageView.leadingAnchor),
            foilTexture.trailingAnchor.constraint(equalTo: animalImageView.trailingAnchor),
            foilTexture.topAnchor.constraint(equalTo: animalImageView.topAnchor),
            foilTexture.bottomAnchor.constraint(equalTo: animalImageView.bottomAnchor),
            foilTexture.widthAnchor.constraint(equalToConstant: size),
            foilTexture.heightAnchor.constraint(equalToConstant: size)
        ])

    }
    
    container.addSubview(animalImageView)
    
    // MARK: - Layout
    NSLayoutConstraint.activate([
        animalImageView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
        animalImageView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
        animalImageView.topAnchor.constraint(equalTo: container.topAnchor),
        animalImageView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
        animalImageView.widthAnchor.constraint(equalToConstant: size),
        animalImageView.heightAnchor.constraint(equalToConstant: size)
    ])
    
    return container

}
