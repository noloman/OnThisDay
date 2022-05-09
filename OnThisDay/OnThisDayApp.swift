//
//  OnThisDayApp.swift
//  OnThisDay
//
//  Created by Manu on 09/05/2022.
//

import SwiftUI

@main
struct OnThisDayApp: App {
    @StateObject var appState = AppState()
    @AppStorage("displayMode") var displayMode = DisplayMode.auto
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
                .onAppear {
                    DisplayMode.changeDisplayMode(to: displayMode)
                }
                .onChange(of: displayMode) { newValue in
                    DisplayMode.changeDisplayMode(to: newValue)
                }
            
        }
        .commands {
            Menus()
        }
    }
}
