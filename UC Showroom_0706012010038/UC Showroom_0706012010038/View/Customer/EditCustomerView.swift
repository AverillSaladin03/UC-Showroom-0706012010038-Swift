//
//  EditCustomerView.swift
//  UC Showroom_0706012010038
//
//  Created by Averill Saladin Atma Setiawan on 11/11/23.
//

import SwiftUI
import PhotosUI

struct EditCustomerView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var id: UUID
    @State var name: String
    @State var idcard: String
    @State var phoneNum: String
    @State var address: String
    
    /* Image */
//    @State var selectedImg: Data
//    @State private var selectedItems: [PhotosPickerItem] = []
    
    @StateObject var custController = CustomerController.shared
    
    var body: some View {
        HStack {
            Spacer()
            VStack (alignment: .leading){
                /* Upload Photo */
//                HStack{
//                    Spacer()
//                    Button {
//                        print("edit profile pic")
//                    }label: {
//                        PhotosPicker(selection: $selectedItems,
//                                     maxSelectionCount: 1,
//                                     matching: .images) {
//                            if selectedImg == nil {
//                                if let uiImage = UIImage(data: selectedImg) {
//                                    Image(uiImage: uiImage)
//                                        .renderingMode(.original)
//                                        .resizable()
//                                        .frame(width: 60, height: 60)
//                                        .cornerRadius(8)
//                                        .shadow(radius: 5)
//                                        .background()
//                                    
//                                }
//                            } else {
//                                Image(systemName: "photo")
//                                    .resizable()
//                                    .frame(width: 60, height: 60)
//                                    .cornerRadius(8)
//                                    .foregroundColor(.gray)
//                            }
//                        }
//                        Text("Upload Image")
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
                TextField("08XXXXXXXXX", text: $phoneNum)
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
                    print("Edit Customer Data")
                    // Edit data
                    custController.editCustomer(id: id, name: name, idCard: idcard, phoneNum: phoneNum, address: address)
                    custController.getCustomer()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Submit")
                            .padding(.horizontal)
                    }
                }
                
                .frame(width: ScreenInformation().getScreenWidth())
                .buttonStyle(.borderedProminent)
                
            }
        }
        .padding()
    }
}

//#Preview {
//    EditCustomerView(id: <#Binding<UUID>#>, name: <#Binding<String>#>, idcard: <#Binding<String>#>, phoneNum: <#Binding<String>#>, address: <#Binding<String>#>)
//}
