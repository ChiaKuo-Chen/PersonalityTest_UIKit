//
//  CheckpointModel.swift
//  PersonalityTest
//

import Foundation

// Represents a branching checkpoint within the personality test flow.
struct MidPoint: Identifiable, Hashable {
    
    // Unique ID for identifying this checkpoint.
    var id = UUID()
    
    // The question or prompt displayed at this checkpoint.
    var title: String
    
    // The text for each possible user choice.
    var choiceString: [String]
    
    // The index (in a question or result array) that each choice leads to.
    var choiceDestination: [Int]
    
    // Flags indicating whether each choice leads directly to the EndView.
    var gotoEndView: [Bool] = [false, false, false]
}
