//
//  AddNewCustomer.swift
//  UC Showroom_0706012010038
//
//  Created by Averill Saladin Atma Setiawan on 11/11/23.
//

import SwiftUI
import PhotosUI

struct AddCustomerView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var custController = CustomerController.shared
    
    /* Variables for data */
    @State private var name :String = ""
    @State private var idcard :String = ""
    @State private var telp :String = ""
    @State private var address :String = ""
    
    /* Image */
    
    func submitButton() -> Bool {
        guard !name.isEmpty,
              !idcard.isEmpty,
              !telp.isEmpty,
              !address.isEmpty
        else {
            return true
        }
        return false
    }
    
    var body: some View {
        HStack {
            Spacer()
            VStack (alignment: .leading){
                /* Upload Photo */
//                HStack{
//                    Spacer()
//                    PhotosPicker(selection: $selectedItems,
//                                 maxSelectionCount: 1,
//                                 matching: .images) {
//                        if selectedItems.count != 0 {
//                            if selectedImg.isEmpty {
//                                let data = selectedImg
//                                let uiImage = UIImage(data: data)
//                                Image(uiImage: uiImage!)
//                                    .renderingMode(.original)
//                                    .resizable()
//                                    .frame(width: 60, height: 60)
//                                    .cornerRadius(8)
//                                    .shadow(radius: 5)
//                                    .background()
//                                
//                            }
//                        } else {
//                            Image(systemName: "photo")
//                                .resizable()
//                                .frame(width: 60, height: 60)
//                                .cornerRadius(8)
//                                .foregroundColor(.gray)
//                        }
//                    }
//                    Spacer()
//                }
                
                Text("Name")
                TextField("John Smith", text: $name).textFieldStyle(.plain)
                    .padding()
                    .frame(height: 50)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.bottom, 24)
                Text("ID Card Number")
                TextField("351000000000000", text: $idcard)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.plain)
                    .padding()
                    .frame(height: 50)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.bottom, 24)
                Text("Phone Number")
                TextField("+62 XXXXXXXXX", text: $telp)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.plain)
                    .padding()
                    .frame(height: 50)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.bottom, 24)
                Text("Address")
                TextField("Surabaya", text: $address).textFieldStyle(PlainTextFieldStyle())
                    .padding()
                    .frame(height: 50)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.bottom, 24)
                
                Button {
                    print("Submit New Customer Data")
                    
                    // Add data to database and update data
                    custController.addNewCustomer(name: self.name, idCard: self.idcard, phoneNum: self.telp, address: self.address)
                    custController.getCustomer()
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
        }
        .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(.red)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        print("Submit New Customer Data")
                        
                        // Add data to database and update data
                        custController.addNewCustomer(name: self.name, idCard: self.idcard, phoneNum: self.telp, address: self.address)
                        custController.getCustomer()
                        // Back
                        dismiss()
                    } label: {
                        Text("Submit")
                            .foregroundStyle(.red)
                    }
                    .disabled(submitButton())
                }
        }
        .padding()
    }
}

//#Preview {
//    AddCustomerView()
//}
