//
//  SidebarView.swift
//  OnThisDay
//
//  Created by Manu on 09/05/2022.
//

import SwiftUI

struct SidebarView: View {
    @EnvironmentObject var appState: AppState
    @AppStorage("showTotals") var showTotals = true
    @Binding var selection: EventType?
    
    var body: some View {
        VStack {
            List(selection: $selection) {
                Section("TODAY") {
                    ForEach(EventType.allCases, id: \.self) { type in
                        Text(type.rawValue)
                            .badge(
                                showTotals ? appState.countFor(eventType: type) : 0
                            )
                    }
                }
            }
            .listStyle(.sidebar)
        }.frame(minWidth: 220)
        Spacer()
        DayPickerView()
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SidebarView(selection: .constant(nil))
                .frame(width: 200)
        }
    }
}
