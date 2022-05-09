//
//  DisplayMode.swift
//  OnThisDay
//
//  Created by Manu on 09/05/2022.
//

import SwiftUI

enum DisplayMode: String, CaseIterable {
    case light = "Light"
    case dark = "Dark"
    case auto = "Auto"
    // 1
    static func changeDisplayMode(to mode: DisplayMode) {
        // 2
        @AppStorage("displayMode") var displayMode = DisplayMode.auto
        
        // 3
        displayMode = mode
        
        // 4
        switch mode {
        case .light:
            // 5
            NSApp.appearance = NSAppearance(named: .aqua)
        case .dark:
            NSApp.appearance = NSAppearance(named: .darkAqua)
        case .auto:
            // 6
            NSApp.appearance = nil
        }
    }
}
