//
//  AddOrderView.swift
//  UC Showroom_0706012010038
//
//  Created by Averill Saladin Atma Setiawan on 12/11/23.
//

import SwiftUI

struct AddOrderView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var orderController = OrderController.shared
    @StateObject var custController = CustomerController.shared
    @StateObject var vehicleController = VehicleController.shared
    
    @State private var date : Date = Date.now
    @State private var selectedCustomer = UUID()
    @State private var selectedVehicle = UUID()
    
    /* Amount of Vehicles */
    @State private var listVehicles : [UUID] = []
    
    var body: some View {
        NavigationView{
            List {
                Section ("Order Data"){
                    DatePicker("Order Date", selection: $date, displayedComponents: .date)
                        .datePickerStyle(.compact)
                    
                    if(custController.customerList.isEmpty) {
                        NavigationLink{
                            AddCustomerView()
                        } label: {
                            Text("+ Add Customer")
                        }
                    } else {
                        Picker("Ordered By", selection: $selectedCustomer){
                            ForEach(custController.customerList){ customer in
                                Text(customer.name!).tag(customer.id)
                            }
                        }
                    }
                }
                
                Section ("Vehicle"){
                    if(vehicleController.transportList.isEmpty) {
                        NavigationLink{
                            AddVehicleView()
                        } label: {
                            Text("+ Add Vehicle")
                        }
                    }else {
                        ForEach(listVehicles.indices, id: \.self) { index in
                            Picker("Model \(index + 1)", selection: $listVehicles[index]) {
                                ForEach(vehicleController.transportList, id: \.self) { vehicle in
                                    Text(vehicle.model!).tag(vehicle.id)
                                }
                            }
                        }
                    }
                    
                    Button{
                        addOrderedVehicles()
                    }label: {
                        HStack (alignment: .center){
                            Spacer()
                            Text("+ Add Vehicle")
                                .fontWeight(.bold)
                            Spacer()
                        }
                    }
                }
            }.navigationBarItems(
                leading: Button("Cancel") {
                    dismiss()
                },
                trailing: Button("Save") {
                    submitOrder()
                    dismiss()
                }
            )
            .navigationTitle("Create New Order")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                
                /* Init data */
                custController.getCustomer()
                vehicleController.getVehicles()
                
                /* Initialize the listVehicles array with default UUID() */
                listVehicles = Array(repeating: UUID(), count: 1)
            }
        }
    }
    
    /* Help Views to Looping */
    func addOrderedVehicles() {
        listVehicles.append(UUID())
    }
    
    /* Store Data to Database */
    func submitOrder() {
        orderController.addNewOrder(date: date, customer: selectedCustomer, listVehicle: listVehicles)
    }
}
