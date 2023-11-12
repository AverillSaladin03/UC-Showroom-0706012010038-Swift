//
//  CustomerListView.swift
//  UC Showroom_0706012010038
//
//  Created by Averill Saladin Atma Setiawan on 11/11/23.
//

import SwiftUI

struct CustomerListView: View {
    
//    @Environment(\.managedObjectContext) var moc
    
    @StateObject var custController = CustomerController.shared
    @State private var isAddingData = false
    
    var body: some View {
        NavigationStack {
            if custController.customerList.isEmpty {
                Text("No Data")
                Spacer()
            } else {
                List {
                ForEach (custController.customerList) { customer in
                    NavigationLink {
                        EditCustomerView(id: customer.id!, name: customer.name!, idcard: customer.idcard!, phoneNum: customer.phoneNum!, address: customer.address!)
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(customer.name ?? "Unknown")
                                    .font(.headline)
                                
                                Text(customer.address ?? "-")
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                        }
                    }
                }
                    
                .onDelete(perform: deleteItem)
                .listStyle(.plain)
                .padding()
                }
            }
        }
        .navigationTitle("Customers")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(){
            custController.getCustomer()
        }
        .toolbar(content: {
            Button {
                isAddingData = true
            } label: {
                Text("Add Customer")
            }
        })
        .sheet(
            isPresented: $isAddingData,
            content: {
                AddCustomerView()
            }
        )
    }
    
    private func deleteItem(offsets: IndexSet) {
            withAnimation {
                offsets.map { custController.customerList[$0] }.forEach(custController.dataController.context.delete)

                custController.deleteItem()
            }
        }
}

#Preview {
    CustomerListView()
}
