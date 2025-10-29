//
//  FormRowStaticCell.swift
//  PersonalityTest_UIKit
//
//  Created by 陳嘉國
//
//  A custom UITableViewCell subclass used for displaying static information rows
//  (non-interactive settings or app metadata).
//
//  Each cell displays an icon with a gray background, a title label, and a value label
//  aligned horizontally. This is used for app info such as version, developer, etc.
//
//  It visually looks like this:
//
//     ┌─────────────────────────────────────────────────────┐
//     │  [🔘]  Application                PersonalityTest   │
//     │   │     │                                         │ │
//     │   │ iconBackGround (gray bg)                      │ │
//     │         └ iconView (UIImageView)                  │ │
//     │ titleLabel (UILabel)                              │ │
//     │ valueLabel (UILabel, right-aligned)                │ │
//     └─────────────────────────────────────────────────────┘
//
//  FormRowStaticCellView
//  ├─ iconBackGround (UIView)
//  │   └─ iconView (UIImageView)
//  ├─ titleLabel (UILabel)
//  └─ valueLabel (UILabel)
//

import UIKit

// A reusable table view cell used to display read-only static information
// such as app version, developer name, or compatibility details.
final class FormRowStaticCellView: UITableViewCell {
    
    // MARK: - UI Components
    
    // The gray rounded rectangle behind the icon.
    private let iconBackGround = UIView()
    
    // The main icon image displayed at the left.
    private let iconView = UIImageView()
    
    // The descriptive title text on the left side.
    private let titleLabel = UILabel()
    
    // The value text displayed on the right side.
    private let valueLabel = UILabel()
    
    // MARK: - Init
    
    // Initializes the cell programmatically.
    override init(style cellStyle: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: cellStyle, reuseIdentifier: reuseIdentifier)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    // Configures the cell with a given icon name, title, and value.
    // - Parameters:
    //   - iconName: The system symbol name or asset image name.
    //   - title: The text describing what this row represents.
    //   - value: The actual value to display (e.g., version number).
    func configure(iconName: String, title: String, value: String) {
        
        // Try to load as an SF Symbol first.
        if let symbolImage = UIImage(systemName: iconName) {
            iconView.image = symbolImage
            iconView.tintColor = .white
        }
        // If not an SF Symbol, try loading from the asset catalog.
        else if let normalImage = UIImage(named: iconName) {
            iconView.image = normalImage
            iconView.tintColor = nil // Regular images don't need tint.
        }
        // Fallback: show a question mark icon if the name is invalid.
        else {
            iconView.image = UIImage(systemName: "questionmark.circle")
            iconView.tintColor = .white
        }
        
        // Assign the texts.
        titleLabel.text = title
        valueLabel.text = value
    }

    // MARK: - Style
    // Applies visual styles and prepares subviews.
    private func style() {
        iconView.tintColor = .white
        iconView.contentMode = .scaleAspectFit
        iconView.translatesAutoresizingMaskIntoConstraints = false

        iconBackGround.backgroundColor = .systemGray3
        iconBackGround.layer.cornerRadius = Device.isPad ? 10 : 8
        iconBackGround.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textColor = .gray
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        valueLabel.textColor = .label
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Layout
    // Adds all subviews and defines Auto Layout constraints.
    private func layout() {
        
        // Add subviews
        contentView.addSubview(iconBackGround)
        iconBackGround.addSubview(iconView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(valueLabel)

        // Different layout sizes for iPad vs iPhone
        let sidePadding: CGFloat = Device.isPad ? 24 : 16
        let iconSize: CGFloat = Device.isPad ? 44 : 36
        let iconSpacing: CGFloat = Device.isPad ? 16 : 12

        // Layout constraints
        NSLayoutConstraint.activate([
            // Icon background
            iconBackGround.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sidePadding),
            iconBackGround.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconBackGround.widthAnchor.constraint(equalToConstant: iconSize),
            iconBackGround.heightAnchor.constraint(equalToConstant: iconSize),
            
            // Icon image
            iconView.centerXAnchor.constraint(equalTo: iconBackGround.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: iconBackGround.centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: Device.isPad ? 24 : 20),
            iconView.heightAnchor.constraint(equalToConstant: Device.isPad ? 24 : 20),
            
            // Title label
            titleLabel.leadingAnchor.constraint(equalTo: iconBackGround.trailingAnchor, constant: iconSpacing),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            // Value label
            valueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -sidePadding),
            valueLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
