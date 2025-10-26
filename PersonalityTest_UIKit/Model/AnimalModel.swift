//
//  AnimalModel.swift
//  PersonalityTest
//

import Foundation

// Represents a personality test result as an animal profile.
struct Animal: Identifiable, Hashable {
    
    // Unique ID for SwiftUI or UIKit identification.
    var id = UUID()
    
    // Display title for the animal (e.g., “Brave Lion”).
    var title: String
    
    // Short introductory phrase (shown under the title).
    var overview: String
    
    // Image asset name corresponding to this animal.
    var name: String
    
    // Numeric rarity level used to determine visual styling (0–15) s.
    var rarity: Double
    
    // Full description text used in result detail views.
    var description: String
    
    // Indices of friend animals (used for recommendation lists).
    var friend: [Int?]
}
