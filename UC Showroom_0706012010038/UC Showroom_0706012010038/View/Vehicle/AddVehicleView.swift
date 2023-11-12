//
//  AddVehicleView.swift
//  UC Showroom_0706012010038
//
//  Created by Averill Saladin Atma Setiawan on 11/11/23.
//

import SwiftUI

struct AddVehicleView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var vehicleController = VehicleController.shared
    
    /* Variables for saving data */
//    @State private var imagePath: String = ""
//    @State private var inputImage: UIImage?
    
    @State private var model: String = ""
    @State private var manufacture: String = ""
    @State private var passengerAmount: String = ""
    @State private var price: String = ""
    @State private var type: String = ""
    @State private var variable1: String = ""
    @State private var variable2: String = ""
    
    /* Other Variables */
//    @State private var showingImagePicker = false
    
    enum vehicleType: String, CaseIterable, Identifiable {
        case Cars, Motorcycle, Truck
        var id: Self { self }
    }
    
    var body: some View {
        ScrollView{
            VStack (alignment: .leading){
                
                /* Add Model */
                Text("Model")
                TextField("Vehicle Model", text: $model).textFieldStyle(.plain)
                    .padding()
                    .frame(height: 50)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.bottom, 24)
                
                /* Add Manufacture */
                Text("Manufacture")
                TextField("Manufacture", text: $manufacture).textFieldStyle(.plain)
                    .padding()
                    .frame(height: 50)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.bottom, 24)
                
                /* Add Passenger Amount */
                Text("Passenger Amount")
                TextField("0", text: $passengerAmount)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.plain)
                    .padding()
                    .frame(height: 50)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.bottom, 24)
                
                /* Add Price */
                Text("Price (Rp)")
                TextField("0", text: $price)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.plain)
                    .padding()
                    .frame(height: 50)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.bottom, 24)
                
                /* Add Type */
                Text("Vehicle Type")
                Picker("Vehicle Type", selection: $type) {
                    Text("None").tag("")
                    Text("Car").tag("Car")
                    Text("Motorcycle").tag("Motorcycle")
                    Text("Truck").tag("Truck")
                }
                .padding(.vertical, 5)
                .frame(width: ScreenInformation().getScreenWidth())
                .background(Color(.systemGray6))
                
                /* Input check based on type */
                /* Car */
                if (type == "Car") {
                    Text("Fuel Type")
                    Picker("Vehicle Type", selection: $variable1) {
                        Text("None").tag("")
                        Text("Petrol").tag("Petrol")
                        Text("Gas").tag("Gas")
                        Text("Electric").tag("Electric")
                    }
                    .pickerStyle(.menu)
                    .padding(.vertical, 5)
                    .frame(width: ScreenInformation().getScreenWidth())
                    .background(Color(.systemGray6))
                    Text("Luggage Size (m2)")
                    TextField("0", text: $variable2)
                        .keyboardType(.numberPad)
                        .textFieldStyle(.plain)
                        .padding()
                        .frame(height: 50)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.bottom, 24)
                } else if (type == "Motorcycle") {
                    Text("Fuel Capacity (L)")
                    TextField("0", text: $variable1)
                        .keyboardType(.numberPad)
                        .textFieldStyle(.plain)
                        .padding()
                        .frame(height: 50)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.bottom, 24)
                    Text("Luggage Area (m2)")
                    TextField("0", text: $variable2)
                        .keyboardType(.numberPad)
                        .textFieldStyle(.plain)
                        .padding()
                        .frame(height: 50)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.bottom, 24)
                } else if (type == "Truck") {
                    Text("Cargo Area (m2)")
                    TextField("0", text: $variable1)
                        .keyboardType(.numberPad)
                        .textFieldStyle(.plain)
                        .padding()
                        .frame(height: 50)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.bottom, 24)
                    Text("Tire Amount(s)")
                    TextField("0", text: $variable2)
                        .keyboardType(.numberPad)
                        .textFieldStyle(.plain)
                        .padding()
                        .frame(height: 50)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.bottom, 24)
                } else {
                    Spacer()
                }
            }
            .padding([.top, .horizontal])
            
            // Button Submit
            Button {
                // Debugging
                print("Submit New Vehicle Data")
                
                // Add data to database
                vehicleController.addNewVehicle(model: model, manufacture: manufacture, passengerAmount: passengerAmount, price: price, type: type, variable1: variable1, variable2: variable2)
                vehicleController.getVehicles()
                // Back
                dismiss()
            } label: {
                HStack {
                    Text("Submit")
                        .padding(.horizontal)
                }
            }
            .disabled(submitButton())
            .frame(width: ScreenInformation().getScreenWidth())
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationTitle("Add New Vehicle")
        .toolbarTitleDisplayMode(.inline)
    }
    
    func submitButton() -> Bool {
        guard !model.isEmpty,
              !manufacture.isEmpty,
              !passengerAmount.isEmpty,
              !price.isEmpty,
              !type.isEmpty,
              !variable1.isEmpty,
              !variable2.isEmpty else {
            return true
        }
        return false
    }
}

#Preview {
    AddVehicleView()
}
