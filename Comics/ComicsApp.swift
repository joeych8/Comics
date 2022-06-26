//
//  ComicsApp.swift
//  Comics
//
//  Created by joey chau on 24/09/2021.
//

import SwiftUI
import Firebase


@main
struct ComicsApp: App {
    
    init() {
        
        FirebaseApp.configure()
        
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
