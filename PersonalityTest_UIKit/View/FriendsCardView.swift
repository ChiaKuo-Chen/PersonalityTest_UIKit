//
//  FriendsCardView.swift
//  PersonalityTest_UIKit
//
//  Created by 陳嘉國
//
//  Displays the “Animal Friends” card section on the end screen.
//  It shows a wooden board background with a title and one to three
//  friend animal icons, depending on available data.
//
//  It would look like this:
//     ┌───────────────────────-─┐
//     │  🪵 Wooden Background   │
//     │───────────────────────-─│
//     │  「動物好朋友」(title)     │
//     │─────────────────────-───│
//     │    🦊     🐻      🐼    │
//     │ friend0 friend1 friend2 |
//     |               (optional)│
//     │────────────────────────-│
//     │    (cardVstackVie       │
//     └────────────────────-────┘
//
//  FriendsCardView
//  └─ woodenBoard (woodenUIView)
//       └─ cardVstackView (VStack)
//            ├─ title (UILabel)
//            └─ friendHstackView (HStack)
//                 ├─ friend0 (OneFriendView)
//                 ├─ friend1 (OneFriendView)
//                 └─ (friend2) (OneFriendView, optional)
//


import UIKit

class FriendsCardView: UIView {
    
    // MARK: - Properties
    // Represents the current animal used to display its compatible friends.
    private var animal: Animal

    // MARK: - UI Components
    private let woodenBoard = woodenUIView(labelText: "")
    private let title = UILabel()
    private let cardVstackView = UIStackView()
    private let friendHstackView = UIStackView()
    
    private var friend0 = UIView()
    private var friend1 = UIView()
    private var friend2 = UIView()

    // MARK: - Init
    // Initializes the FriendsCardView with a given animal to display its friend list.
    init(animal: Animal) {
        self.animal = animal
        super.init(frame: .zero)
        loadAnimal(animalList: animal.friend)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Style
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false

        // Title label configuration
        title.text = "動物好朋友"
        title.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        title.textColor = .white
        title.textAlignment = .center
        title.shadowColor = .black
        title.shadowOffset = CGSize(width: 0, height: 2)
        title.translatesAutoresizingMaskIntoConstraints = false

        // Hstack view for displaying friend icons
        friendHstackView.axis = .horizontal
        friendHstackView.alignment = .center
        friendHstackView.distribution = .fill
        friendHstackView.spacing = 20
        friendHstackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the first two friends
        friendHstackView.addArrangedSubview(friend0)
        friendHstackView.addArrangedSubview(friend1)
        
        // Optionally add the third friend if available
        if animal.friend.count > 2 {
            friendHstackView.addArrangedSubview(friend2)
        }
        
        // Vstack view containing title and friend list
        cardVstackView.axis = .vertical
        cardVstackView.alignment = .center
        friendHstackView.distribution = .fillProportionally
        cardVstackView.spacing = 12
        cardVstackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add subviews
        cardVstackView.addArrangedSubview(title)
        cardVstackView.addArrangedSubview(friendHstackView)
        
        woodenBoard.addSubview(cardVstackView)
        addSubview(woodenBoard)
        
        woodenBoard.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Layout
    private func layout() {
        NSLayoutConstraint.activate([
            // Wooden background board centered on the view
            woodenBoard.centerXAnchor.constraint(equalTo: centerXAnchor),
            woodenBoard.centerYAnchor.constraint(equalTo: centerYAnchor),
            woodenBoard.widthAnchor.constraint(equalTo: widthAnchor),
            woodenBoard.heightAnchor.constraint(equalTo: heightAnchor),

            // Inner card content (title + friends)
            cardVstackView.topAnchor.constraint(equalTo: woodenBoard.topAnchor, constant: 6),
            cardVstackView.leadingAnchor.constraint(equalTo: woodenBoard.leadingAnchor, constant: 6),
            cardVstackView.trailingAnchor.constraint(equalTo: woodenBoard.trailingAnchor, constant: -3),
            cardVstackView.bottomAnchor.constraint(equalTo: woodenBoard.bottomAnchor, constant: -3),

            // Friend icons area horizontal padding
            friendHstackView.leadingAnchor.constraint(equalTo: cardVstackView.leadingAnchor),
            friendHstackView.trailingAnchor.constraint(equalTo: cardVstackView.trailingAnchor)
        ])
    }
    
    // MARK: - Data
    // Loads and initializes friend views based on the given friend list.
    // - Parameter animalList: Array of optional friend indices referencing `AnimalData`.
    private func loadAnimal(animalList: [Int?]) {
        // Create first and second friend views
        if let firstFriend = animalList[0], let secondFriend = animalList[1] {
            friend0 = OneFriendView(animal: AnimalData[firstFriend])
            friend1 = OneFriendView(animal: AnimalData[secondFriend])
        }
        // Optionally create a third friend view if available
        if animalList.count > 2 {
            if let thirdFriend = animalList[2] {
                friend2 = OneFriendView(animal: AnimalData[thirdFriend])
            }
        }
    }
}
