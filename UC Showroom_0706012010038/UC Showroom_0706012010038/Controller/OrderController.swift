//
//  OrderController.swift
//  UC Showroom_0706012010038
//
//  Created by Averill Saladin Atma Setiawan on 12/11/23.
//

import Foundation
import CoreData

class OrderController: ObservableObject {
    static var shared = OrderController()
    let dataController = DataController.shared
    var vehicleController = VehicleController()
    var customerController = CustomerController()
    
    @Published var orderList: [Order] = []
    
    var total : Double = 0.0
    
    /* Get Order Data */
    func getOrderData () {
        let request = NSFetchRequest<Order>(entityName: "Order")
        
        do {
            orderList = try dataController.context.fetch(request)
        } catch {
            print("DEBUG: Some error occurred while fetching")
        }
    }
    
    /* Access Core Data Service with NSPersistentContainer called Showroom */
    struct NewVehicle: Hashable{
        var vehicle: Transportation
    }
    
    var listNewVehicle: [NewVehicle] = [
        NewVehicle(vehicle: Transportation())
    ]
    
    /* Add New Order Data */
    func addNewOrder (
        date: Date, customer: UUID, listVehicle: [UUID]
    ) {
        let newOrder = Order(context: dataController.context)
        newOrder.id = UUID()
        newOrder.date = date
        
        var relatedTransportations: Set<Transportation>? // Use Set for to-many relationships

    
        /* Insert Vehicle Data to Order Data*/
        listVehicle.forEach { orderedID in
            var orderedVehicle = vehicleController.getVehicleByID(id: orderedID)
            newOrder.haveVehicles = orderedVehicle
            
            /* Insert Vehicle Data to Order Data*/
            total += orderedVehicle.price
        }
        newOrder.totalPrice = total
        
        /* Insert Customer Data to Order Data*/
        var customerOrdered = customerController.getCustomerByID(id: customer)
        
        newOrder.belongsToCustomer = customerOrdered
        /* Save data to database */
        dataController.save()
    }
}

