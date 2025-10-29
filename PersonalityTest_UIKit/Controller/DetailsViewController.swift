//
//  DetailsViewController.swift
//  PersonalityTest_UIKit
//
//  Created by 陳嘉國
//
//  A data-driven Settings page implemented using UITableViewController.
//  Each section and row is modeled explicitly to make the structure clear and scalable.
//

import UIKit

// MARK: - Models

// Represents a single row in a section.
// Can either be a link row (with a URL) or a static info row.
private struct RowData {
    let icon: String
    let color: UIColor
    let title: String
    let value: String?
    let link: String?
    
    // Initializer for link rows (external websites)
    init(icon: String, color: UIColor, title: String, link: String) {
        self.icon = icon
        self.color = color
        self.title = title
        self.value = nil
        self.link = link
    }

    // Initializer for static info rows
    init(icon: String, title: String, value: String) {
        self.icon = icon
        self.color = .label
        self.title = title
        self.value = value
        self.link = nil
    }
}

// Represents one logical section in the Settings page.
// Each section has a title and multiple rows.
private struct SectionData {
    let title: String
    let rows: [RowData]
}

// MARK: - View Controller

// A Detail screen implemented with UITableViewController.
// Displays external links and app information using reusable table view cells.
final class DetailsViewController: UITableViewController {
    
    // MARK: - Data Source Setup
    
    // Section 1: External resource links (Wiki, GitHub, etc.)
    private let externalLinkRows: [RowData] = [
        RowData(
            icon: "globe",
            color: .systemBlue,
            title: "Wiki",
            link: "https://zh.wikipedia.org/zh-tw/%E9%82%81%E7%88%BE%E6%96%AF-%E5%B8%83%E9%87%8C%E6%A0%BC%E6%96%AF%E9%A1%9E%E5%9E%8B%E6%8C%87%E6%A8%99"
        ),
        RowData(
            icon: "githubLogo",
            color: .black,
            title: "GitHub",
            link: "https://github.com/ChiaKuo-Chen/PersonalityTest_UIKit"
        )
    ]
    
    // Section 2: App information (non-interactive static info)
    private let appInfoRows: [RowData] = [
        RowData(icon: "questionmark.square.dashed", title: "Application", value: "PersonalityTest"),
        RowData(icon: "checkmark", title: "Compatibility", value: "iPhone, iPad"),
        RowData(icon: "keyboard", title: "Developer", value: "ChiaKuo-Chen"),
        RowData(icon: "applescript", title: "Designer", value: "ChiaKuo-Chen"),
        RowData(icon: "document", title: "Version", value: "3.14159")
    ]
    
    // All sections combined in one array
    private lazy var sections: [SectionData] = [
        SectionData(title: "Know More About Personality Test", rows: externalLinkRows),
        SectionData(title: "About the Application", rows: appInfoRows)
    ]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Settings"
        
        // Add a "Close" button on the navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .close,
            target: self,
            action: #selector(dismissSelf)
        )
        
        // Register both custom cell types for reuse
        tableView.register(FormRowLinkCellView.self, forCellReuseIdentifier: "LinkCell")
        tableView.register(FormRowStaticCellView.self, forCellReuseIdentifier: "StaticCell")
        
        tableView.backgroundColor = .systemGroupedBackground
    }
    
    // Dismisses this settings screen when the close button is tapped
    @objc private func dismissSelf() {
        dismiss(animated: true)
    }
    
    // MARK: - TableView DataSource
    
    // Defines how many sections to show in the table
    override func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    // Provides the title for each section header
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sections[section].title
    }
    // Defines how many rows each section contains
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].rows.count
    }
    
    // Configures the content of each row (called for every visible cell)
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        // Retrieve the correct row model for this index path
        let row = sections[indexPath.section].rows[indexPath.row]
        
        // Determine which cell type to use based on whether `link` exists
        if let link = row.link {
            // Link-type row → use a clickable cell
            let rowLinkCellView = tableView.dequeueReusableCell(withIdentifier: "LinkCell", for: indexPath) as! FormRowLinkCellView
            rowLinkCellView.configure(iconName: row.icon, color: row.color, title: row.title, link: link)
            return rowLinkCellView
        } else {
            // Static info row → use non-clickable display cell
            let rowStaticCellView = tableView.dequeueReusableCell(withIdentifier: "StaticCell", for: indexPath) as! FormRowStaticCellView
            rowStaticCellView.configure(iconName: row.icon, title: row.title, value: row.value ?? "")
            return rowStaticCellView
        }
    }
}
