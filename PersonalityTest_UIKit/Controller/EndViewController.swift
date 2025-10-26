//
//  EndViewController.swift
//  PersonalityTest_UIKit
//
//  Created by 陳嘉國
//
//  Displays the result screen (EndView) based on the selected Animal.
//  Handles navigation back to the root view controller.
//

import UIKit

class EndViewController: UIViewController {
    
    // The main view displaying the animal result
    private var endView: EndView!

    // MARK: - Initialization
    
    // Initializes the view controller with a specific animal result
    init(animal: Animal) {
        super.init(nibName: nil, bundle: nil)
        self.endView = EndView(animal: animal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    
    override func loadView() {
        view = endView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        endView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    // Returns to the root (cover) view controller
    @objc private func backButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
}
