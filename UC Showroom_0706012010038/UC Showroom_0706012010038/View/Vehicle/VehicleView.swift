//
//  VehicleView.swift
//  UC Showroom_0706012010038
//
//  Created by Averill Saladin Atma Setiawan on 11/11/23.
//

import SwiftUI

struct VehicleView: View {
    
    @StateObject var vehicleController = VehicleController.shared
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    @State private var isAddingData = false
    @State private var isViewingData = false
    
    var body: some View {
        ScrollView {
            if (vehicleController.transportList.isEmpty) {
                Text("No Data")
            } else {
                LazyVGrid(columns: columns) {
                    ForEach(vehicleController.transportList, id: \.self) { vehicle in
                        NavigationLink {
                            VehicleDetailView(id: vehicle.id!, vehicle: vehicle)
                        } label : {
                            VStack {
                                Text(vehicle.type!)
                                    .font(.caption)
                                Divider()
                                Text(vehicle.model!)
                                    .font(.title3)
                                Text(String(vehicle.price))
                                    .font(.caption)
                                Divider()
                            }
                            .padding()
                            .frame(height: 120)
                            .shadow(radius: 8)
                        }
                    }
                }
            }
        }
        .navigationTitle("Vehicle Showroom")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear() {
            vehicleController.getVehicles()
        }
        .toolbar(content: {
            Button {
                isAddingData = true
            } label: {
                Text("Add Vehicle")
            }
        })
        .sheet(
            isPresented: $isAddingData,
            content: {
                AddVehicleView()
            }
        )
    }
}

//#Preview {
//    VehicleView()
//}
