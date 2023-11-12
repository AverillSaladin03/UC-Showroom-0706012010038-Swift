//
//  VehicleDetailView.swift
//  UC Showroom_0706012010038
//
//  Created by Averill Saladin Atma Setiawan on 11/11/23.
//

import SwiftUI

struct VehicleDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    /* Get Data */
    @StateObject var vehicleController = VehicleController.shared
    @State var id : UUID
    @State var vehicle : Transportation
    
    /* Sheet State */
    @State private var isEditingData = false
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Model : ")
                    Text(vehicle.model!)
                }
                Text("Manufacture :  \(vehicle.manufacture!)")
                Text("Passenger Amount : \(vehicle.passengerAmount)")
                /* Add Price */
                Text("Price : Rp. \(vehicle.price)")
                Text("Vehicle Type : \(vehicle.type!)")
                
                /* Car */
                switch vehicle.type {
                case "Car" :
                    Text("Fuel Type :  \(vehicle.car_fuelType!)")
                    Text("Luggage Size :  \(vehicle.car_luggageSize!) m2")
                case "Motorcycle" :
                    Text("Fuel Capacity  :  \(vehicle.motor_fuelCapacity!) L")
                    Text("Luggage Area :  \(vehicle.motor_luggageArea!) m2")
                case "Truck" :
                    Text("Cargo Area  :  \(vehicle.truck_cargoArea!) m2")
                    Text("Tire Amount  :  \(vehicle.truck_tireAmount!)")
                default:
                    Text("")
                }
            }
            .padding()
        }
        .onAppear(){
            vehicleController.getVehicleByID(id: vehicle.id!)
        }
        .toolbar(content: {
            ToolbarItem{
                Button {
                    isEditingData = true
                } label: {
                    Text("Edit")
                }
            }
            ToolbarItem{
                Button {
                    print("Delete Vehicle")
                    vehicleController.deleteItem(vehicle: vehicle)
                    vehicleController.getVehicles()
                }label: {
                    
                    Text("Delete")
                        .foregroundStyle(.red)
                }
                
            }
        })
        .sheet(
            isPresented: $isEditingData,
            content: {
                EditVehicleView(vehicle: $vehicle)
            }
        )
    }
}

//#Preview {
//    VehicleDetailView(model: <#String#>, manufacture: <#String#>, passengerAmount: <#String#>, price: <#String#>, type: <#String#>, variable1: <#String#>, variable2: <#String#>)
//}
