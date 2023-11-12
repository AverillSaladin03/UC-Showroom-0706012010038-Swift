//
//  File.swift
//  UC Showroom_0706012010038
//
//  Created by Averill Saladin Atma Setiawan on 11/11/23.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    static let shared = DataController()
    
    /* Access Core Data Service with NSPersistentContainer called Showroom. */
    let container = NSPersistentContainer(name: "Showroom")
    let context: NSManagedObjectContext
    
    
    /* Initialize the Core Data Connectio.n */
    init(){
        container.loadPersistentStores { description, error in
            if let error = error{
                print("core data failed to load: \(error.localizedDescription)")
            }
        }
        
        context = container.viewContext
    }
    
    /* Saving Data Added, Updated, Deleted from Controllers. */
    func save(){
        do{
            try context.save()
            print("data \(context.name ?? "") saved")
        } catch{
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
