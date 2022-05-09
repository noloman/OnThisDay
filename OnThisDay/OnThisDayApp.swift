//
//  OnThisDayApp.swift
//  OnThisDay
//
//  Created by Manu on 09/05/2022.
//

import SwiftUI

@main
struct OnThisDayApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        .commands {
            Menus()
        }
    }
}
