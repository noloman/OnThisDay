//
//  Toolbar.swift
//  OnThisDay
//
//  Created by Manu on 09/05/2022.
//

import SwiftUI

// 2
struct Toolbar: CustomizableToolbarContent {
    var body: some CustomizableToolbarContent {
        // 3
        // 1
        ToolbarItem(
            id: "toggleSidebar",
            placement: .navigation, // Change this to .automatic in order to allow the reordering of menu items
            showsByDefault: true
        ) {
            // 2
            Button {
                toggleSidebar()
            } label: {
                // 3
                Label("Toggle Sidebar", systemImage: "sidebar.left")
            }
            .help("Toggle Sidebar")
        }
        
    }
    
    func toggleSidebar() {
        // 1
        NSApp.keyWindow?
        // 2
            .contentViewController?
        // 3
            .tryToPerform(
                // 4
                #selector(NSSplitViewController.toggleSidebar(_:)),
                with: nil)
    }
}
