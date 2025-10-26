//
//  CoverViewController.swift
//  PersonalityTest_UIKit
//
//  Created by 陳嘉國
//
//  View controller for the cover screen.
//  Displays the start view and navigates to the first MidPointViewController when the button is tapped.
//

import UIKit

class CoverViewController: UIViewController {
    
    // Main cover view
    let coverView = CoverView()
    
    // MARK: - Lifecycle
    
    // Use the custom CoverView as the main view
    override func loadView() {
        view = coverView
    }
    
    // Set up button actions
    override func viewDidLoad() {
        super.viewDidLoad()
        coverView.startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    // Hide the navigation bar when appearing
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    // MARK: - Actions
    
    // Navigate to the first midpoint view when the start button is tapped
    @objc private func startButtonTapped() {
        let nextViewController = MidPointViewController(midPoint: MidPointData[0])
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
