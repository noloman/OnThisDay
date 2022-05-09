//
//  ContentView.swift
//  OnThisDay
//
//  Created by Manu on 09/05/2022.
//

import SwiftUI

enum ViewMode: Int {
  case grid
  case table
}

struct ContentView: View {
    @State private var viewMode: ViewMode = .grid
    @EnvironmentObject var appState: AppState
    @State private var eventType: EventType? = .events
    @State private var searchText = ""
    
    var events: [Event] {
      appState.dataFor(eventType: eventType, searchText: searchText)
    }

    
    var windowTitle: String {
        if let eventType = eventType {
            return "On This Day - \(eventType.rawValue)"
        }
        return "On This Day"
    }
    
    var body: some View {
        NavigationView {
            SidebarView(selection: $eventType)
            if viewMode == .table {
              TableView(tableData: events)
            } else {
              GridView(gridData: events)
            }
        }
        .frame(
            minWidth: 700,
            idealWidth: 1000,
            maxWidth: .infinity,
            minHeight: 400,
            idealHeight: 800,
            maxHeight: .infinity)
        .navigationTitle(windowTitle)
        .toolbar(id: "mainToolbar") {
          Toolbar(viewMode: $viewMode)
        }
        .searchable(text: $searchText)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
