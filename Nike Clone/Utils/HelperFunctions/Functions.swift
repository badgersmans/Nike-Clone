//
//  Functions.swift
//  Nike Clone
//
//  Created by Shawn Law on 29/12/2024.
//


// Function to apply non-breaking space to long text...
func applyNonBreakingSpaceIfNeeded(_ text: String) -> String {
    // Check text length and insert non-breaking space at the 20th character if needed
    if text.count >= 20 {
        let index = text.index(text.startIndex, offsetBy: 26)
        return text.prefix(upTo: index) + "\u{00A0}" + text.suffix(from: index)
    }
    return text
}
