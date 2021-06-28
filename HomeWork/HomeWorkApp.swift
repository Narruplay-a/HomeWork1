//
//  HomeWorkApp.swift
//  HomeWork
//
//  Created by Adel Khaziakhmetov on 21.06.2021.
//

import SwiftUI

@main
struct HomeWorkApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(Routing())
        }
    }
}
