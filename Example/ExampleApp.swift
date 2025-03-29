//
//  ExampleApp.swift
//  Example
//
//  Created by Nick Trienens on 3/18/25.
//

import SwiftUI
import OverlayToastStack

@main
struct ExampleApp: App {
    let sot = OverlayToastStack()

    var body: some Scene {
        WindowGroup {
            ContentView(sot: sot)
                
        }
    }
}
