//
//  FormRowLinkView.swift
//  PersonalityTest_UIKit
//
//  Created by 陳嘉國
//
//  A custom UITableViewCell subclass used for displaying link-type settings rows.
//  Each cell shows an icon with colored background, a text label, and a disclosure indicator.
//  When tapped, the cell opens the corresponding external URL in Safari.
//
//  It would look like this:
//
//     ┌─────────────────────────────────────────────┐
//     │  [🔵]       Wiki                    >       │
//     │   │           │                arrow.right  │
//     │   │      iconBackGround                     │
//     │   |        └ iconView (UIImageView)         │
//     │ label (UILabel)                             │
//     └─────────────────────────────────────────────┘
//
//  FormRowLinkView
//  ├─ iconContainer (UIView)
//  │   └─ iconView (UIImageView)
//  ├─ label (UILabel)
//  └─ linkURL (String?) – the link to open when tapped
//

import UIKit

// A table view cell used for displaying an external link row.
// When the user taps the cell, it automatically opens the associated URL in Safari.
final class FormRowLinkCellView: UITableViewCell {
    
    // MARK: - UI Components
    // Colored background container for the icon.
    private let iconBackGround = UIView()
    
    // The icon representing the link.
    private let iconView = UIImageView()
    
    // The text label describing the link destination.
    private let label = UILabel()
    
    // Stores the URL string associated with this cell.
    private var linkURL: String?
    
    // MARK: - Init
    
    // Initializes the cell programmatically.
    override init(style cellStyle: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: cellStyle, reuseIdentifier: reuseIdentifier)
        style()
        layout()
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    // Configures the cell with given data from the settings model.
    // - Parameters:
    //   - icon: The system or asset image to display.
    //   - color: The background color behind the icon.
    //   - text: The link title shown beside the icon.
    //   - link: The URL string to open when tapped.
    func configure(iconName: String, color: UIColor, title: String, link: String) {
        
        // Try to load as SF Symbol first
        if let symbolImage = UIImage(systemName: iconName) {
            iconView.image = symbolImage
            iconView.tintColor = .white
        }
        // If not an SF Symbol, try to load from asset catalog
        else if let normalImage = UIImage(named: iconName) {
            iconView.image = normalImage
            iconView.tintColor = nil // Regular images don't need tint color
        }
        // Fallback: if the icon name doesn't exist at all
        else {
            iconView.image = UIImage(systemName: "questionmark.circle")
            iconView.tintColor = .white
        }
        
        // Apply background color and text
        iconBackGround.backgroundColor = color
        label.text = title
        linkURL = link
    }

    // MARK: - Style
    private func style() {
        iconBackGround.layer.cornerRadius = Device.isPad ? 10 : 8
        iconBackGround.translatesAutoresizingMaskIntoConstraints = false
        iconView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false

        accessoryType = .disclosureIndicator
    }

    // MARK: - Layout
    private func layout() {
        
        // Add subviews
        contentView.addSubview(iconBackGround)
        iconBackGround.addSubview(iconView)
        contentView.addSubview(label)
        
        // Show the disclosure indicator arrow ( > )
        accessoryType = .disclosureIndicator
        
        // Diffrent Size For different Device
        let sidePadding: CGFloat = Device.isPad ? 24 : 16
        let iconSize: CGFloat = Device.isPad ? 44 : 36
        let spacing: CGFloat = Device.isPad ? 16 : 12

        // Layout constraints
        NSLayoutConstraint.activate([
            // Icon container
            iconBackGround.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sidePadding),
            iconBackGround.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconBackGround.widthAnchor.constraint(equalToConstant: iconSize),
            iconBackGround.heightAnchor.constraint(equalToConstant: iconSize),
            
            // Icon image centered within the container
            iconView.centerXAnchor.constraint(equalTo: iconBackGround.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: iconBackGround.centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: Device.isPad ? 24 : 20),
            iconView.heightAnchor.constraint(equalToConstant: Device.isPad ? 24 : 20),

            // Text label to the right of the icon
            label.leadingAnchor.constraint(equalTo: iconBackGround.trailingAnchor, constant: spacing),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    // MARK: - Setup
    private func setup() {
        // Add a tap gesture recognizer for opening links
        let tap = UITapGestureRecognizer(target: self, action: #selector(openLink))
        contentView.addGestureRecognizer(tap)
    }
    
    // MARK: - Interaction
    // Opens the stored URL in Safari when the cell is tapped.
    @objc private func openLink() {
        guard let linkURL, let url = URL(string: linkURL) else { return }
        UIApplication.shared.open(url)
    }
}
