//
//  TableView.swift
//  OnThisDay
//
//  Created by Manu on 09/05/2022.
//

import SwiftUI

struct TableView: View {
    @State private var sortOrder = [KeyPathComparator(\Event.year)]
    var tableData: [Event]
    var sortedTableData: [Event] {
      return tableData.sorted(using: sortOrder)
    }
    var body: some View {
        Table(sortedTableData, sortOrder: $sortOrder) {
            TableColumn("Year", value: \.year) {
                Text($0.year)
            }
            .width(min: 50, ideal: 60, max: 100)
            TableColumn("Title", value: \.text)
        }
    }
}
