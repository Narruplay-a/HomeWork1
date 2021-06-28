//
//  Routing.swift
//  HomeWork
//
//  Created by Adel Khaziakhmetov on 21.06.2021.
//

import SwiftUI

final class Routing: ObservableObject {
    @Published var selectedTab: Int = 0
    @Published var shouldSelectDetail: Bool = false
}
