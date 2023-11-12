//
//  VehicleController.swift
//  UC Showroom_0706012010038
//
//  Created by Averill Saladin Atma Setiawan on 11/11/23.
//

import Foundation
import CoreData

class VehicleController: ObservableObject {
    static var shared = VehicleController()
    let dataController = DataController.shared
    
    /* List of Vehicle/Transportation in General */
    @Published var transportList: [Transportation] = []
    
    /* 3 Lists of specific  */
    @Published var carList: [Transportation] = []
    @Published var motorList: [Transportation] = []
    @Published var truckList: [Transportation] = []
    
    /* Get All Vehicles Data */
    func getVehicles () {
        let request = NSFetchRequest<Transportation>(entityName: "Transportation")
        
        do {
            transportList = try dataController.context.fetch(request)
        } catch {
            print("DEBUG: Some error occurred while fetching")
        }
    }
    
    /* Get All Vehicles Data with a specific Type */
    func getVehicles (type: String){
        transportList.forEach({ vehicle in
            switch vehicle.type {
            case "Car":
                print("Vehicle is Car")
                carList.append(vehicle)
            case "Motorcycle":
                print("Vehicle is Motorcycle")
                motorList.append(vehicle)
            case "Truck":
                print("Vehicle is Truck")
                truckList.append(vehicle)
            default:
                print("Invalid.")
            }
        })
    }
    
    /* Get Vehicle Data by ID */
    func getVehicleByID(id: UUID) -> Transportation {
        let newId = [id]
        var transportation: [Transportation] = []
        let request = NSFetchRequest<Transportation>(entityName: "Transportation")
        
        let filter = NSPredicate(format: "id IN %@", newId)
        request.predicate = filter
        
        do {
            transportation = try dataController.context.fetch(request)
        } catch let error{
            print("Error fetching. \(error.localizedDescription)")
        }
        return transportation.first!
    }
    
    /* Add New Vehicle Data */
    func addNewVehicle (
        model: String,
        manufacture: String,
        passengerAmount: String,
        price: String,
        type: String,
        variable1: String,
        variable2: String
    ) {
        let newVehicle = Transportation(context: dataController.context)
        newVehicle.id = UUID()
        newVehicle.model = model
        newVehicle.manufacture = manufacture
        newVehicle.passengerAmount = Int16(passengerAmount)!
        newVehicle.price = Double(price)!
        newVehicle.type = type
        
        /* Check if the incoming data is a Car, Motorcycle or Truck  and add it according to their type */
        /* Transportation */
        switch type {
        case "Car":
            print("Car Added")
            newVehicle.car_luggageSize =
            variable1
            newVehicle.car_fuelType = variable2
        case "Motorcycle":
            print("Motorcycle Added")
            newVehicle.motor_luggageArea = variable1
            newVehicle.motor_fuelCapacity = variable2
        case "Truck":
            print("Truck Added.")
            newVehicle.truck_cargoArea = variable1
            newVehicle.truck_tireAmount = variable2
        default:
            print("Invalid.")
        }
        
        /* Save data to database */
        dataController.save()
    }
    
    /* Edit Vehicle Data */
    func editVehicle (id: UUID,
        model: String,
        manufacture: String,
        passengerAmount: String,
        price: String,
        variable1: String,
        variable2: String
    ) {
        let edittingVehicle = getVehicleByID(id: id)
        edittingVehicle.model = model
        edittingVehicle.manufacture = manufacture
        edittingVehicle.passengerAmount = Int16(passengerAmount)!
        edittingVehicle.price = Double(price)!
        
        /* Check if the incoming data is a Car, Motorcycle or Truck  and add it according to their type */
        /* Transportation */
        switch edittingVehicle.type {
        case "Car":
            print("Car Edited")
            edittingVehicle.car_luggageSize = variable1
            edittingVehicle.car_fuelType = variable2
        case "Motorcycle":
            print("Motorcycle Edited")
            edittingVehicle.motor_luggageArea = variable1
            edittingVehicle.motor_fuelCapacity = variable2
        case "Truck":
            print("Truck Edited.")
            edittingVehicle.truck_cargoArea = variable1
            edittingVehicle.truck_tireAmount = variable2
        default:
            print("Invalid.")
        }
        
        /* Save data to database */
        dataController.save()
    }
    
    /* Delete Vehicle Data */
    func deleteItem(vehicle: Transportation) {
        dataController.context.delete(vehicle)
        
        do {
            try dataController.context.save()
        } catch {
            // Handle the Core Data save error
            print("Error saving context after delete: \(error)")
        }
    }
}
