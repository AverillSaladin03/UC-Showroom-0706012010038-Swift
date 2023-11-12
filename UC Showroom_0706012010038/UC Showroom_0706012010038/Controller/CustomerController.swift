//
//  CustomerController.swift
//  UC Showroom_0706012010038
//
//  Created by Averill Saladin Atma Setiawan on 11/11/23.
//

import Foundation
import CoreData

class CustomerController: ObservableObject {
    static var shared = CustomerController()
    let dataController = DataController.shared
    
    @Published var customerList : [Customer] = []
    
    /* Get All Customer*/
    func getCustomer() {
        let request = NSFetchRequest<Customer>(entityName: "Customer")
        
        do {
            customerList = try dataController.context.fetch(request)
        } catch {
            print("DEBUG: Some error occurred while fetching")
        }
    }
    
    /* Add New Customer Data */
    func addNewCustomer (name: String, idCard: String, phoneNum: String, address: String) {
        let newCustomer = Customer(context: dataController.context)
        newCustomer.id = UUID()
        newCustomer.name = name
        newCustomer.idcard = idCard
        newCustomer.phoneNum = phoneNum
        newCustomer.address = address
        dataController.save()
    }
    
    /* Edit Customer Data */
    func editCustomer (id: UUID, name: String, idCard: String, phoneNum: String, address: String) {
        let editCustomer = getCustomerByID(id: id)
        editCustomer.name = name
        editCustomer.idcard = idCard
        editCustomer.phoneNum = phoneNum
        editCustomer.address = address
        print("\(String(describing: editCustomer.name)) was edited")
        dataController.save()
    }
    
    /* Delete Customer Data */
    func deleteItem() {
        do {
            try dataController.context.save()
        } catch {
            // Handle the Core Data save error
            print("Error saving context after delete: \(error)")
        }
    }
    
    /* Throw a Customer when User want to get Customer data by its ID*/
    func getCustomerByID(id: UUID) -> Customer {
        let newId = [id]
        var customer: [Customer] = []
        let request = NSFetchRequest<Customer>(entityName: "Customer")
        
        let filter = NSPredicate(format: "id IN %@", newId)
        request.predicate = filter
        
        do {
            customer = try dataController.context.fetch(request)
        } catch let error{
            print("Error fetching. \(error.localizedDescription)")
        }
        return customer.first!
    }
    
}
