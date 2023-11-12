//
//  HomeView.swift
//  UC Showroom_0706012010038
//
//  Created by Averill Saladin Atma Setiawan on 11/11/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack (spacing: 20) {
                NavigationLink {
                    VehicleView()
                } label: {
                    HStack {
                        Image(systemName: "car")
                        Text("Vehicle")
                    }
                    .foregroundStyle(.white)
                    .frame(width: ScreenInformation().getScreenWidth() * 0.7, height: 50)
                    .background(.primary)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    
                }
                NavigationLink {
                    CustomerListView()
                } label: {
                    HStack{
                        Image(systemName: "person.text.rectangle")
                        Text("Customer")
                    }
                    .foregroundStyle(.white)
                        .frame(width: ScreenInformation().getScreenWidth() * 0.7, height: 50)
                        .background(.primary)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                }
                NavigationLink {
                    HistoryOrderView()
                } label: {
                    HStack{
                        Image(systemName:"clock.arrow.circlepath")
                        Text("Order")
                            
                    }
                    .foregroundStyle(.white)
                    .frame(width: ScreenInformation().getScreenWidth() * 0.7, height: 50)
                    .background(.primary)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
