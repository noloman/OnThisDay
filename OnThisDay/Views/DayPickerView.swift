//
//  DayPickerView.swift
//  OnThisDay
//
//  Created by Manu on 11/05/2022.
//

import SwiftUI

struct DayPickerView: View {
    @EnvironmentObject var appState: AppState
    @SceneStorage("selectedDate") var selectedDate: String?
    
    @State private var month = "January"
    @State private var day = 1
    
    var maxDays: Int {
        switch month {
        case "February":
            return 29
        case "April", "June", "September", "November":
            return 30
        default:
            return 31
        }
    }
    
    var body: some View {
        VStack {
            Text("Select a Date")
            HStack {
                Picker("", selection: $month) {
                    ForEach(appState.englishMonthNames, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
                Picker("", selection: $day) {
                    ForEach(1 ... maxDays, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.menu)
                .frame(maxWidth: 60)
                .padding(.trailing, 10)
            }
            
            if appState.isLoading {
                ProgressView()
                    .frame(height: 28)
            } else {
                Button("Get Events") {
                    Task {
                        await getNewEvents()
                    }
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            }
        }
        .padding()
    }
    
    func getNewEvents() async {
        let monthIndex = appState.englishMonthNames
            .firstIndex(of: month) ?? 0
        let monthNumber = monthIndex + 1
        await appState.getDataFor(month: monthNumber, day: day)
        selectedDate = "\(month) \(day)"
    }
}

struct DayPickerView_Previews: PreviewProvider {
    static var previews: some View {
        DayPickerView()
            .environmentObject(AppState())
            .frame(width: 200)
    }
}
