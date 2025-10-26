//
//  MidPointViewController.swift
//  PersonalityTest_UIKit
//
//  Created by 陳嘉國
//
//  Displays a question (MidPoint) and handles user choices.
//  Navigates to either another question or the final result screen.
//

import UIKit

class MidPointViewController: UIViewController {
    
    // Current midpoint (question and choices)
    var midPoint: MidPoint
    
    // Main view containing question label and choice buttons
    var midPointView: MidPointView!

    // MARK: - Initialization
    
    // Initializes the view controller with a given midpoint
    init(midPoint: MidPoint) {
        self.midPoint = midPoint
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        midPointView = MidPointView(midPoint: midPoint)
        view = midPointView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Assign button actions
        midPointView.choiceButton0.addTarget(self, action: #selector(choiceButtonTapped), for: .touchUpInside)
        midPointView.choiceButton1.addTarget(self, action: #selector(choiceButtonTapped), for: .touchUpInside)
        midPointView.choiceButton2.addTarget(self, action: #selector(choiceButtonTapped), for: .touchUpInside)
    }

    // MARK: - Actions
    
    // Handles choice selection and navigates to the next screen
    @objc private func choiceButtonTapped(_ sender: UIButton) {
        guard let index = [midPointView.choiceButton0,
                           midPointView.choiceButton1,
                           midPointView.choiceButton2].firstIndex(of: sender) else { return }

        let goToEnd = midPoint.gotoEndView[index]
        let nextIndex = midPoint.choiceDestination[index]

        if goToEnd {
            // Navigate to result (EndViewController)
            let nextViewController = EndViewController(animal: AnimalData[nextIndex])
            navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            // Navigate to next question (MidPointViewController)
            let nextViewController = MidPointViewController(midPoint: MidPointData[nextIndex])
            navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}
