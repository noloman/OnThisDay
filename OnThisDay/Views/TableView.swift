//
//  TableView.swift
//  OnThisDay
//
//  Created by Manu on 09/05/2022.
//

import SwiftUI

struct TableView: View {
    var tableData: [Event]
    var body: some View {
        Table(tableData) {
            TableColumn("Year") {
                Text($0.year)
            }
            .width(min: 50, ideal: 60, max: 100)
            TableColumn("Title") {
                Text($0.text)
            }
        }
    }
}
