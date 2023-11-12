//
//  UC_Showroom_0706012010038App.swift
//  UC Showroom_0706012010038
//
//  Created by Averill Saladin Atma Setiawan on 11/11/23.
//

import SwiftUI

@main
struct UC_Showroom_0706012010038App: App {
    
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .preferredColorScheme(.light)
        }
    }
}
