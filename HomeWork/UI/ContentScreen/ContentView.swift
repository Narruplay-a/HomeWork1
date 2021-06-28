//
//  ContentView.swift
//  HomeWork
//
//  Created by Adel Khaziakhmetov on 21.06.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var routing: Routing
    
    var body: some View {
        TabView(selection: $routing.selectedTab) {
            TitleScreen()
            .tabItem {
                Text("Первый таб")
            }.environmentObject(routing)
            .tag(0)
            
            ListScreen(model: ListModel())
            .tabItem {
                Text("Второй таб")
            }
            .environmentObject(routing)
            .tag(1)
            
            ModalScreen()
            .tabItem {
                Text("Третий таб")
            }
            .tag(2)
        }
    }
}
