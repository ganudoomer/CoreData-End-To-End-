//
//  coreMainDay60App.swift
//  coreMainDay60
//
//  Created by Sree on 30/11/21.
//

import SwiftUI

@main
struct coreMainDay60App: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext,dataController.container.viewContext)
        }
    }
}
