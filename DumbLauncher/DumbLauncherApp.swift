//
//  DumbLauncherApp.swift
//  DumbLauncher
//
//  Created by Cooper Baltimore on 5/12/25.
//

import SwiftUI

@main
struct DumbLauncherApp: App {
    @AppStorage("selectedBackground") var selectedBackground: String = "#F4F4F4"
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .background(Color(hex: selectedBackground))
                .edgesIgnoringSafeArea(.all)
        }
    }
}
