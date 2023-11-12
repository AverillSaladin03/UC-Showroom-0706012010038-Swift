//
//  HistoryOrderView.swift
//  UC Showroom_0706012010038
//
//  Created by Averill Saladin Atma Setiawan on 11/11/23.
//

import SwiftUI

struct HistoryOrderView: View {
    
    @State var isAddingData = false
    
    var body: some View {
        NavigationStack {
            Text("This is history order view")
            Spacer()
        }
        .navigationTitle("Order History")
        .toolbar{
            ToolbarItem {
                Button {
                    isAddingData = true
                } label: {
                    Text("Add Order")
                    
                }
            }
        }
        .sheet(isPresented: $isAddingData) {
            AddOrderView()
        }
    }
}

#Preview {
    HistoryOrderView()
}
