//
//  Menus.swift
//  OnThisDay
//
//  Created by Manu on 09/05/2022.
//

import SwiftUI

struct Menus: Commands {
    @AppStorage("showTotals") var showTotals = true
    @AppStorage("displayMode") var displayMode = DisplayMode.auto
    
    var body: some Commands {
        SidebarCommands()
        ToolbarCommands()
        CommandGroup(after: .help) {
            // 1
            Button("ZenQuotes.io web site") {
                // 2
                showAPIWebSite()
            }
            // 3
            .keyboardShortcut("/", modifiers: .command)
        }
        CommandMenu("Display") {
            // 1
            Toggle(isOn: $showTotals) {
                // 2
                Text("Show Totals")
            }
            // 3
            .keyboardShortcut("t", modifiers: .command)
            // 1
            Divider()
            
            // 2
            Picker("Appearance", selection: $displayMode) {
                // 3
                ForEach(DisplayMode.allCases, id: \.self) {
                    // 4
                    Text($0.rawValue).tag($0)
                }
            }
        }
    }
    
    func showAPIWebSite() {
        // 1
        let address = "https://today.zenquotes.io"
        guard let url = URL(string: address) else {
            fatalError("Invalid address")
        }
        // 2
        NSWorkspace.shared.open(url)
    }
}
